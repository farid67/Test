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

void Test::set_string(string new_string)
{
	return_string = "Hello " + new_string;
}

string Test::get_string()
{
	return return_string;
}
