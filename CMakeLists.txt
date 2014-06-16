<<<<<<< HEAD
=======
#Génération de la bibliothèque
>>>>>>> 9591e4c38aaa7a1034bc7619667ddd0526f3c989
include (GenerateExportHeader)

cmake_minimum_required(VERSION 2.6)

<<<<<<< HEAD
project(Hello)

# message("\n ${CMAKE_CURRENT_SOURCE_DIR}/src/app ")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/app)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/lib)
=======

#Configuration du projet

project(Hello)

#Inclusion des en-têtes publics

include_directories(src/lib)

#librairie dynamique (SHARED) pour que l'exécutable fasse appel à la librairie seulement lors de l'éxecution

add_library(

		libTest

        SHARED

        src/lib/test.c

)

GENERATE_EXPORT_HEADER( 
		libTest
		BASE_NAME libTest
		EXPORT_MACRO_NAME libTest_EXPORT
		EXPORT_FILE_NAME libTest_Export.h
)


include_directories(${CMAKE_BINARY_DIR})

#Configuration de l'exécutable

add_executable(

        main

        src/app/main.c

)

#Configuration de l'édition de liens

target_link_libraries(

        main
		
		libTest

)



>>>>>>> 9591e4c38aaa7a1034bc7619667ddd0526f3c989
