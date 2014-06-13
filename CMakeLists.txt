#Génération de la bibliothèque

cmake_minimum_required(VERSION 2.6)


#Configuration du projet

project(Hello)

set(LIBRARY_OUTPUT_PATH ../lib/${CMAKE_BUILD_TYPE})

set(EXECUTABLE_OUTPUT_PATH ../bin/${CMAKE_BUILD_TYPE})

#Inclusion des en-têtes publics

include_directories(include)

#fichiers source

file(

        GLOB_RECURSE

        source_files
		
		src/*
		
        include/*

)

#librairie dynamique (SHARED) pour que l'exécutable fasse appel à la librairie seulement lors de l'éxecution

add_library(

		libTest

        SHARED

        ${source_files}

)


#Configuration de l'exécutable

add_executable(

        main

        ${source_files}

)



#Configuration de l'édition de liens

target_link_libraries(

        main

        libTest

)



