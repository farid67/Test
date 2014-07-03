add_definitions(-DBOOST_ALL_NO_LIB)
find_package(Boost COMPONENTS unit_test_framework REQUIRED)


include_directories(${CMAKE_CURRENT_BINARY_DIR}/../src/lib) # include libTest_Export.h
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../src/lib) # include test.hpp
include_directories(${DIR}) #ajouté pour trouvé boost/test/unit_test.hpp
link_directories(${Boost_LIBRARY_DIRS})

ADD_DEFINITIONS(-DBOOST_TEST_DYN_LINK)

file(GLOB_RECURSE tests *.cpp )
#~ message ("\n ${tests}")
foreach(test_file ${tests})
    # On construit l'exécutable de test
    get_filename_component(test ${test_file} NAME_WE)
    add_executable(${test} ${test_file})
    target_link_libraries( ${test} ${Boost_LIBRARIES} libTest ) # ajouté
    
    # On cherche tous les cas dans le fichier source
    file(READ ${test_file} content)
    set(pattern "BOOST_(AUTO|FIXTURE)_TEST_CASE\\(([^),]+)")
    string(REGEX MATCHALL ${pattern} cases ${content})
    
    # Pour chaque cas, on génère un test CMake
    foreach(case ${cases})
        string(REGEX REPLACE ${pattern} "\\2" case ${case})
        add_test("${test}_${case}" "${test}" "--run_test=${case} --log_level=test_suite --log_format=xml --output_format=xml")
    endforeach()
    
endforeach()
