@echo off
cd build 
cpack
nosetests test\
