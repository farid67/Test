#Génération de la bibliothèque
<<<<<<< HEAD
include (GenerateExportHeader)
=======
>>>>>>> 4370c587bd414c488ae09b373bbc00d6bfcf30da

cmake_minimum_required(VERSION 2.6)


#Configuration du projet

project(Hello)

<<<<<<< HEAD
#Inclusion des en-têtes publics

include_directories(src/lib)

#librairie dynamique (SHARED) pour que l'exécutable fasse appel à la librairie seulement lors de l'éxecution

=======
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
>>>>>>> 4370c587bd414c488ae09b373bbc00d6bfcf30da

add_library(

		libTest

        SHARED

<<<<<<< HEAD
        src/lib/test.c

)

GENERATE_EXPORT_HEADER( 
		libTest
		BASE_NAME libTest
		EXPORT_MACRO_NAME libTest_EXPORT
		EXPORT_FILE_NAME libTest_Export.h
)


include_directories(${CMAKE_BINARY_DIR})
=======
        ${source_files}

)

>>>>>>> 4370c587bd414c488ae09b373bbc00d6bfcf30da

#Configuration de l'exécutable

add_executable(

        main

<<<<<<< HEAD
        src/app/main.c

)

=======
        ${source_files}

)



>>>>>>> 4370c587bd414c488ae09b373bbc00d6bfcf30da
#Configuration de l'édition de liens

target_link_libraries(

        main
<<<<<<< HEAD
		
		libTest
=======

        libTest

>>>>>>> 4370c587bd414c488ae09b373bbc00d6bfcf30da
)



