#Génération de la bibliothèque
include (GenerateExportHeader)

cmake_minimum_required(VERSION 2.6)


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



