@echo off
cd build 
(echo Boost_INCLUDE_DIR:=C:\local\boost_1_55_0) > CMakeCache.txt
(echo Boost_LIBRARY_DIR:=C:\local\boost_1_55_0\lib32-msvc-12.0) >> CMakeCache.txt
(echo Boost_UNIT_TEST_FRAMEWORK_LIBRARY:=C:\local\boost_1_55_0\lib32-msvc-12.0\boost_unit_test_framework-vc120-mt-gd-1_55.lib) >> CMakeCache.txt
(echo DIR:=C:\local\boost_1_55_0) >> CMakeCache.txt