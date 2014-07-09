@echo off
echo set(CTEST_PROJECT_NAME "%NODE_NAME%") >> CTestConfig.cmake
echo set(CTEST_NIGHTLY_START_TIME "01:00:00 UTC") >> CTestConfig.cmake
echo.  >> CTestConfig.cmake
echo  set(CTEST_DROP_METHOD "http")  >> CTestConfig.cmake
echo  set(CTEST_DROP_SITE "192.168.56.2") >> CTestConfig.cmake
echo  set(CTEST_DROP_LOCATION "/CDash/submit.php?project=%NODE_NAME%") >> CTestConfig.cmake
echo  set(CTEST_DROP_SITE_CDASH TRUE) >> CTestConfig.cmake
