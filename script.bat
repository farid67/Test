@echo off
cd build 
cpack
cd ..
nosetests test\
