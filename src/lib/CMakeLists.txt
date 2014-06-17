#Inclusion des en-têtes publics

#librairie dynamique (SHARED) pour que l'exécutable fasse appel à la librairie seulement lors de l'éxecution

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_library(

	libTest

        SHARED

        test.c

)

GENERATE_EXPORT_HEADER( 
		libTest
		BASE_NAME libTest
		EXPORT_MACRO_NAME libTest_EXPORT
		EXPORT_FILE_NAME libTest_Export.h
)

if(WIN)
install (TARGETS libTest ARCHIVE DESTINATION include)
ELSE
install (TARGETS libTest LIBRARY DESTINATION include)
ENDIF()
