include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../lib/
                    ${CMAKE_CURRENT_BINARY_DIR}/../lib/
                    )
                    
add_executable(
        main 
        main.cpp
)

target_link_libraries(
        main 
        libTest
        )
        
        
