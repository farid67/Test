include (GenerateExportHeader)
INCLUDE(InstallRequiredSystemLibraries)

cmake_minimum_required(VERSION 2.6)

project(Hello)

# message("\n ${CMAKE_CURRENT_SOURCE_DIR}/src/app ")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/app)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/lib)


# fichiers de base
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/test.h DESTINATION src/lib)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/lib/test.c DESTINATION src/lib)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/app/main.c DESTINATION src/app)
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/doc/README DESTINATION doc )

# librairie
find_file (
	lib_win 
	libTest.dll 
	${CMAKE_CURRENT_SOURCE_DIR}/src/lib
)
if (lib_win) # comprendre : si un dll est trouvé
install (FILES ${CMAKE_CURRENT_SOURCE_DIR}/build/src/lib/libTest.dll DESTINATION include)
ELSE(lib_win)
install	(FILES ${CMAKE_CURRENT_SOURCE_DIR}/build/src/lib/liblibTest.so DESTINATION include)
ENDIF(lib_win)

#config paquet
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Hello Project")
SET(CPACK_PACKAGE_VENDOR "Vendeur anonyme")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/doc/README")
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "0")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "CMake ${CMake_VERSION_MAJOR}.${CMake_VERSION_MINOR}")
IF(WIN32 AND NOT UNIX)
  # There is a bug in NSI that does not handle full unix paths properly. Make
  # sure there is at least one set of four (4) backlasshes.
  SET(CPACK_PACKAGE_ICON "${CMake_SOURCE_DIR}/Utilities/Release\\\\InstallIcon.bmp")
  SET(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\MyExecutable.exe")
  SET(CPACK_NSIS_DISPLAY_NAME "${CPACK_PACKAGE_INSTALL_DIRECTORY} Hello Project")
  SET(CPACK_NSIS_HELP_LINK "http:\\\\\\\\www.mon-projet.org")
  SET(CPACK_NSIS_URL_INFO_ABOUT "http:\\\\\\\\www.page-perso.com")
  SET(CPACK_NSIS_CONTACT "f@hotmail.fr")
  SET(CPACK_NSIS_MODIFY_PATH ON)
ELSE(WIN32 AND NOT UNIX)
  SET(CPACK_STRIP_FILES "bin/main")
  SET(CPACK_SOURCE_STRIP_FILES "")
ENDIF(WIN32 AND NOT UNIX)
SET(CPACK_PACKAGE_EXECUTABLES "main" "main")
INCLUDE(CPack)
