@echo off
cd build
set PATH=%PATH%;%WORKSPACE%\build\src\lib;C:\local\boost_1_55_0\lib32-msvc-12.0
ctest -D Experimental
