include (GenerateExportHeader)

cmake_minimum_required(VERSION 2.6)

project(Hello)

# message("\n ${CMAKE_CURRENT_SOURCE_DIR}/src/app ")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/app)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/lib)
