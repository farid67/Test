@echo off
cd build
# le nom de la cible peut être changer dans le CMakeLists de base
nmake my_coverage_test 
ctest -D Experimental
