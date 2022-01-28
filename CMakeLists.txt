cmake_minimum_required(VERSION 3.8)
project(cmake-metal-example)

set(CMAKE_CXX_STANDARD 17)

include_directories(${PROJECT_SOURCE_DIR}/metal-cpp)

set(SOURCE_FILES src/main.cpp)
add_executable(cmake-metal-example ${SOURCE_FILES})

find_library(METAL Metal)
find_library(FOUNDATION Foundation)
find_library(QUARTZCORE QuartzCore)

target_link_libraries(cmake-metal-example stdc++ "-framework Metal" "-framework Foundation" "-framework QuartzCore" objc)
