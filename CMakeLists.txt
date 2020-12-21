cmake_minimum_required(VERSION 3.13)
project(codeql-test)
set(CMAKE_CXX_STANDARD 14)

set(SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)

add_executable(codeql-test ${SOURCE_FILES})