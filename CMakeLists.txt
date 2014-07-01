include (GenerateExportHeader)
INCLUDE(InstallRequiredSystemLibraries)

cmake_minimum_required(VERSION 2.6)

project(Hello)

enable_testing()

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/app)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Tests)
