cmake_minimum_required(VERSION 3.4)

# Enable testing for the project
enable_testing()

# Locate GTest package
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Set sources for the test executable
set(TEST_BIN_NAME testBin)
set(TEST_SRC test/src)
file(GLOB TEST_SOURCES ${TEST_SRC}/*.cpp)

# Create the test executable
add_executable(${TEST_BIN_NAME} ${TEST_SOURCES})

# Link with GTest and your project's libraries
target_link_libraries(${TEST_BIN_NAME} ${GTEST_BOTH_LIBRARIES} memlib)

# If you use pthread in your tests
set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)
find_package(Threads REQUIRED)
target_link_libraries(${TEST_BIN_NAME} Threads::Threads)
