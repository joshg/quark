set ( SAILFISH_MAIN_SRCS 
Sailfish.cpp
)

set ( UNIT_TESTS_SRCS
    ${GAT_SOURCE_DIR}/tests/UnitTests.cpp
)

# Build the specific Sailfish commands as a 
# shared libraray (for some reason, building
# them into a single executable was causing 
# multiple symbold definition errors).
set (SAILFISH_LIB_SRCS
VersionChecker.cpp
SailfishIndexer.cpp
SailfishQuantify.cpp
SailfishUtils.cpp
SailfishStringUtils.cpp
LibraryFormat.cpp
TranscriptGroup.cpp
EmpiricalDistribution.cpp
GZipWriter.cpp
xxhash.c
${GAT_SOURCE_DIR}/external/install/src/rapmap/RapMapFileSystem.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/RapMapSAIndexer.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/RapMapSAIndex.cpp
#${GAT_SOURCE_DIR}/external/install/src/rapmap/RapMapSAMapper.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/RapMapUtils.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/HitManager.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/rank9b.cpp
${GAT_SOURCE_DIR}/external/install/src/rapmap/bit_array.c
#${GAT_SOURCE_DIR}/external/install/src/EasyH5Utils.cpp
)

include_directories( 
${GAT_SOURCE_DIR}/tests
${GAT_SOURCE_DIR}/include
${GAT_SOURCE_DIR}/include/eigen3
${GAT_SOURCE_DIR}/external
${GAT_SOURCE_DIR}/external/cereal/include
${GAT_SOURCE_DIR}/external/install/include
${GAT_SOURCE_DIR}/external/install/include/rapmap
${GAT_SOURCE_DIR}/external/install/include/jellyfish-2.2.3
${ZLIB_INCLUDE_DIR}
${TBB_INCLUDE_DIRS}
${Boost_INCLUDE_DIRS}
)

link_directories( 
${GAT_SOURCE_DIR}/lib
${GAT_SOURCE_DIR}/external/install/lib
${Boost_LIBRARY_DIRS}
${TBB_LIBRARY_DIRS}
${LAPACK_LIBRARY_DIR}
${BLAS_LIBRARY_DIR}
)

#dd_library(pca SHARED ${PCA_LIB_SRCS})

message("TBB_LIBRARIES = ${TBB_LIBRARIES}")
message("Boost_LIBRARIES = ${Boost_LIBRARIES}")

# Set the RPATH 
if (APPLE)
    ## This DOES NOT do what I / any one sane, expects.  Setting the 
    ## linker path on OSX is messed up.  Just tell the user to use 
    ## DYLD_FALLBACK_LIBRARY_PATH for now
    set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
else()
    set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib:$ORIGIN/../../lib:$ORIGIN/:$ORIGIN/../../external/install/lib")
endif()

set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)

set(DECODER_SRCS BinaryDecoder.cpp)

# Build the decoder
add_executable(decoder ${DECODER_SRCS})
target_link_libraries(decoder
  ${PTHREAD_LIB}
  ${Boost_LIBRARIES}
)

# Build the Sailfish library
add_library(sailfish_core STATIC ${SAILFISH_LIB_SRCS} )
set_target_properties(sailfish_core PROPERTIES LINKER_LANGUAGE CXX)

# Build the Sailfish executable
add_executable(quark ${SAILFISH_MAIN_SRCS})

# Build the Sailfish executable
add_executable(unitTests ${UNIT_TESTS_SRCS})

# our suffix array construction libraries
set (SUFFARRAY_LIB ${GAT_SOURCE_DIR}/external/install/lib/libdivsufsort.a)
set (SUFFARRAY64_LIB ${GAT_SOURCE_DIR}/external/install/lib/libdivsufsort64.a)

# Link the executable
target_link_libraries(quark 
    sailfish_core 
    ${PTHREAD_LIB}
    ${Boost_LIBRARIES} 
    gff
    ${ZLIB_LIBRARY} 
    ${SUFFARRAY_LIB}
    ${SUFFARRAY64_LIB}
    ${GAT_SOURCE_DIR}/external/install/lib/libjellyfish-2.0.a 
    m
    ${TBB_LIBRARIES}
    ${LIBSAILFISH_LINKER_FLAGS} 
    ${NON_APPLECLANG_LIBS}
    #${HDF5_LIBRARIES}
    ${FAST_MALLOC_LIB}
)

# Link the executable
target_link_libraries(unitTests
    sailfish_core 
    ${PTHREAD_LIB}
    ${Boost_LIBRARIES} 
    gff
    ${ZLIB_LIBRARY} 
    ${SUFFARRAY_LIB}
    ${SUFFARRAY64_LIB}
    ${GAT_SOURCE_DIR}/external/install/lib/libjellyfish-2.0.a 
    m
    ${TBB_LIBRARIES}
    ${LIBSAILFISH_LINKER_FLAGS} 
    ${NON_APPLECLANG_LIBS}
    ${FAST_MALLOC_LIB}
)

##
#  This ensures that the sailfish executable should work with or without `make install`
##
# Grumble grumble . . . OSX
if (APPLE)
    # only attempt install_name_tool for tbb if we installed it
    if (${TBB_LIBRARY_DIRS} MATCHES ${GAT_SOURCE_DIR}/external/install/lib)
        add_custom_command(TARGET sailfish 
	    POST_BUILD
	    COMMAND install_name_tool -change libtbb.dylib @rpath/libtbb.dylib ${GAT_SOURCE_DIR}/build/src/sailfish
	    COMMAND install_name_tool -change libtbbmalloc.dylib @rpath/libtbbmalloc.dylib ${GAT_SOURCE_DIR}/build/src/sailfish
	    COMMAND install_name_tool -change libtbbmalloc_proxy.dylib @rpath/libtbbmalloc_proxy.dylib ${GAT_SOURCE_DIR}/build/src/sailfish
	    COMMAND install_name_tool -add_rpath  ${GAT_SOURCE_DIR}/external/install/lib ${GAT_SOURCE_DIR}/build/src/sailfish
        )
	add_custom_command(TARGET unitTests
    	    POST_BUILD
	    COMMAND install_name_tool -change libtbb.dylib @rpath/libtbb.dylib ${GAT_SOURCE_DIR}/build/src/unitTests
	    COMMAND install_name_tool -change libtbbmalloc.dylib @rpath/libtbbmalloc.dylib ${GAT_SOURCE_DIR}/build/src/unitTests
	    COMMAND install_name_tool -change libtbbmalloc_proxy.dylib @rpath/libtbbmalloc_proxy.dylib ${GAT_SOURCE_DIR}/build/src/unitTests
	    COMMAND install_name_tool -add_rpath  ${GAT_SOURCE_DIR}/external/install/lib ${GAT_SOURCE_DIR}/build/src/unitTests
	)
    endif()
else()
    # related to complete static linking --- on hold	
    set (BOOST_THREAD_LIBRARY)
endif()


#if (APPLE)
#	add_custom_command(TARGET sailfish 
#		POST_BUILD
#		COMMAND install_name_tool -add_rpath ${GAT_SOURCE_DIR}/external/install/lib/libtbb.dylib sailfish 
#		COMMAND install_name_tool -add_rpath ${GAT_SOURCE_DIR}/external/install/lib/libtbbmalloc.dylib sailfish 
#		COMMAND install_name_tool -add_rpath @executable_path/../lib/libtbb.dylib sailfish 
#		COMMAND install_name_tool -add_rpath @executable_path/../lib/libtbbmalloc.dylib sailfish 
#		)
#endif()
#
##### ======================================
IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  SET(CMAKE_INSTALL_PREFIX
    "${GAT_SOURCE_DIR}" CACHE PATH "Default install prefix" FORCE
    )
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

set(INSTALL_LIB_DIR lib )
set(INSTALL_BIN_DIR bin )
set(INSTALL_INCLUDE_DIR include )

install(DIRECTORY 
        ${GAT_SOURCE_DIR}/external/install/lib/ 
        DESTINATION ${INSTALL_LIB_DIR}
	    FILES_MATCHING PATTERN "libtbb*.${SHARED_LIB_EXTENSION}*"
    )

# install(FILES ${Boost_LIBRARIES}
# 	           DESTINATION ${INSTALL_LIB_DIR})

install(TARGETS quark sailfish_core
                RUNTIME DESTINATION bin 
                LIBRARY DESTINATION lib
                ARCHIVE DESTINATION lib
        )

install(TARGETS unitTests
    RUNTIME DESTINATION tests
)

set(POST_INSTALL_SCRIPT ${GAT_SOURCE_DIR}/cmake/PostInstall.cmake)

install(
    CODE 
    "
    execute_process(COMMAND \"${CMAKE_COMMAND}\"
                            -DCMAKE_SYSTEM_NAME=${CMAKE_SYSTEM_NAME}
                            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} 
                            -P \"${POST_INSTALL_SCRIPT}\")
    "
)

# install(FILES ${GAT_SOURCE_DIR}/scripts/SFPipeline.py DESTINATION scripts/SFPipeline.py )
# install(FILES ${GAT_SOURCE_DIR}/experimental_configs/SRX016368_25mers.cfg DESTINATION experimental_configs/SRX016368_25mers.cfg )

include(InstallRequiredSystemLibraries)
add_test( NAME unit_tests COMMAND ${CMAKE_COMMAND} -DTOPLEVEL_DIR=${CMAKE_INSTALL_PREFIX} -P ${GAT_SOURCE_DIR}/cmake/UnitTests.cmake )
add_test( NAME simple_test COMMAND ${CMAKE_COMMAND} -DTOPLEVEL_DIR=${CMAKE_INSTALL_PREFIX} -P ${GAT_SOURCE_DIR}/cmake/SimpleTest.cmake )
