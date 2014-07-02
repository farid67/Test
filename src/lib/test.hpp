#ifndef _TEST_HPP_
#define _TEST_HPP_
#include <iostream>
#include "libTest_Export.hpp"
#include <string>
#include <fstream>

using namespace std;

class libTest_EXPORT Test 
{
    public :
    
        Test();
        Test(string name);
        void displayString ();
        ~Test();
        string get_string();
        void set_string(string new_string);
    private :
        string return_string;
};

#endif
