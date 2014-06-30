#define BOOST_TEST_MODULE MonTest
#include "test.hpp"
#include <boost/test/unit_test.cpp>

using namespace std;

BOOST_AUTO_TEST_CASE(constructor_test)
{
    Test t("Jean");
    BOOST_CHECK_EQUAL(t.return_string,"Hello Jean");
}

BOOST_AUTO_TEST_CASE(length_test)
{
    Test t2("Pierre");
    BOOST_CHECK_EQUAL(t2.return_string.length(),strlen("Hello Pierre"));
}
