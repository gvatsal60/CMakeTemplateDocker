cmake_minimum_required(VERSION 3.4...3.28)

set(PROJECT_NAME cmakeTemplate)
set(PROJECT_VERSION 1.0.0)
project(${PROJECT_NAME} VERSION ${PROJECT_VERSION})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Remove for compiler-specific features
set(CMAKE_CXX_EXTENSIONS OFF)

string(APPEND CMAKE_CXX_FLAGS " -Wall")
string(APPEND CMAKE_CXX_FLAGS " -Wbuiltin-macro-redefined")
string(APPEND CMAKE_CXX_FLAGS " -pedantic")
string(APPEND CMAKE_CXX_FLAGS " -Werror")

# clangd completion
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SRC src)
set(INC inc)
set(LIB lib)
set(EXEC_BIN_NAME debugBin)
set(REQUIRED_LIB memlib) # Change accordingly with required libraries

file(
  GLOB V_GLOB
  LIST_DIRECTORIES true
  ${LIB}/*)
foreach(item ${V_GLOB})
  if(IS_DIRECTORY ${item})
    add_subdirectory(${item})
  endif()
endforeach()

file(GLOB SOURCE_FILES ${SRC}/*.cpp)
add_executable(${EXEC_BIN_NAME} ${SOURCE_FILES})

target_include_directories(${EXEC_BIN_NAME} PRIVATE ${INC})
target_link_libraries(${EXEC_BIN_NAME} PUBLIC ${REQUIRED_LIB})
