include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_library(
    libTest
    SHARED
    test.cpp
)

GENERATE_EXPORT_HEADER(
            libTest
            BASE_NAME libTest
            EXPORT_MACRO_NAME libTest_EXPORT
            EXPORT_FILE_NAME libTest_Export.hpp
)
