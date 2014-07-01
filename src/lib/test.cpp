#include "test.hpp"

Test::Test()
{
}

Test::Test(string name)
{
    return_string = "Hello " + name;
}


void Test::displayString()
{
    cout << return_string << endl;
}

Test::~Test()
{
    // destructor
}
