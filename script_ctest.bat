@echo off
cd build 
echo %WORKSPACE%
#set PATH=%PATH%;${WORKSPACE}/build/src/lib
#echo %PATH%
ctest --no-compress-output -T Test
cd ..
verify >nul
python CTest2JUnit.py build converter.xsl > build/JUnitResults.xml
