# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hirak/RapCompress/sailfish

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hirak/RapCompress/sailfish/build

# Utility rule file for libsparsehash.

# Include the progress variables for this target.
include CMakeFiles/libsparsehash.dir/progress.make

CMakeFiles/libsparsehash: CMakeFiles/libsparsehash-complete

CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-install
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-mkdir
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-update
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-patch
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-build
CMakeFiles/libsparsehash-complete: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-install
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Completed 'libsparsehash'"
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/build/CMakeFiles
	/usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/CMakeFiles/libsparsehash-complete
	/usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-done

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-install: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-build
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing install step for 'libsparsehash'"
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && make install
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && /usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-install

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-mkdir:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Creating directories for 'libsparsehash'"
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/external/install
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/tmp
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp
	/usr/bin/cmake -E make_directory /home/hirak/RapCompress/sailfish/external
	/usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-mkdir

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-mkdir
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing download step for 'libsparsehash'"
	cd /home/hirak/RapCompress/sailfish/external && curl -k -L https://github.com/COMBINE-lab/sparsehash/archive/sparsehash-2.0.2.tar.gz -o sparsehash-2.0.2.tar.gz && tar -xzf sparsehash-2.0.2.tar.gz
	cd /home/hirak/RapCompress/sailfish/external && /usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-update: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No update step for 'libsparsehash'"
	/usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-update

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-patch: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "No patch step for 'libsparsehash'"
	/usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-patch

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure: libsparsehash-prefix/tmp/libsparsehash-cfgcmd.txt
libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-update
libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-patch
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing configure step for 'libsparsehash'"
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && sh -c "CC=/usr/bin/cc CXX=/usr/bin/c++ ./configure --prefix=/home/hirak/RapCompress/sailfish/external/install"
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && /usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure

libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-build: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure
	$(CMAKE_COMMAND) -E cmake_progress_report /home/hirak/RapCompress/sailfish/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Performing build step for 'libsparsehash'"
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && $(MAKE)
	cd /home/hirak/RapCompress/sailfish/external/sparsehash-sparsehash-2.0.2 && /usr/bin/cmake -E touch /home/hirak/RapCompress/sailfish/build/libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-build

libsparsehash: CMakeFiles/libsparsehash
libsparsehash: CMakeFiles/libsparsehash-complete
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-install
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-mkdir
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-download
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-update
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-patch
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-configure
libsparsehash: libsparsehash-prefix/src/libsparsehash-stamp/libsparsehash-build
libsparsehash: CMakeFiles/libsparsehash.dir/build.make
.PHONY : libsparsehash

# Rule to build all files generated by this target.
CMakeFiles/libsparsehash.dir/build: libsparsehash
.PHONY : CMakeFiles/libsparsehash.dir/build

CMakeFiles/libsparsehash.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libsparsehash.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libsparsehash.dir/clean

CMakeFiles/libsparsehash.dir/depend:
	cd /home/hirak/RapCompress/sailfish/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hirak/RapCompress/sailfish /home/hirak/RapCompress/sailfish /home/hirak/RapCompress/sailfish/build /home/hirak/RapCompress/sailfish/build /home/hirak/RapCompress/sailfish/build/CMakeFiles/libsparsehash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/libsparsehash.dir/depend

