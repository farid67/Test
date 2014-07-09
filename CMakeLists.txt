#pour ajouter le module CodeCoverage
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/CMakeModules/" )
include (GenerateExportHeader)
INCLUDE(InstallRequiredSystemLibraries)

cmake_minimum_required(VERSION 2.6)

project(Hello)

enable_testing()

if (CMAKE_COMPILER_IS_GNUCXX)
	include (CodeCoverage)
	setup_target_for_coverage(
							my_coverage_test #nom de la cible
							Test_test #nom de l'exécutable permettant de lancer des tests
							coverage #répertoire de sortie
							)
endif()

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/app)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/Tests)


install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/test.hpp DESTINATION library COMPONENT lib)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/test.cpp DESTINATION src/lib COMPONENT app)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/app/main.cpp DESTINATION src/app COMPONENT app)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/doc/README DESTINATION doc COMPONENT app)

include (CPack.txt)
include(CTest)
