@echo off
cd build 
ctest --no-compress-output -T Test
cd ..
verify >nul
python CTest2JUnit.py build converter.xsl > build/JUnitResults.xml
