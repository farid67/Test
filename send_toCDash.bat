@echo off
cd build
set PATH=%PATH%;%WORKSPACE%\build\src\lib
ctest -D Experimental
