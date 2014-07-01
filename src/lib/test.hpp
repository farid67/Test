#ifndef _TEST_HPP_
#define _TEST_HPP_
#include <iostream>
#include "libTest_Export.hpp"
#include <string>
#include <fstream>

using namespace std;

class Test 
{
    public :
    
        Test();
        Test(string name);
        void displayString ();
        string return_string;
        ~Test();

    private :
};

#endif
