#define BOOST_TEST_MODULE MonTest
#include "test.hpp"
#include <boost/test/unit_test.hpp>

using namespace std;


//~ BOOST_TEST_OUTPUT_FORMAT(XML)

BOOST_AUTO_TEST_CASE(constructor_test)
{
    Test t("Jean");
    BOOST_CHECK_EQUAL(t.get_string(),"Hello Jean");
    Test t2("Pierre");
    BOOST_CHECK_EQUAL(t2.get_string().length(),strlen("Hello Pierre"));
}

BOOST_AUTO_TEST_CASE(get_and_set_tests)
{
	Test t3("Henry");
	BOOST_CHECK_EQUAL(t3.get_string(),"Hello Henry");
	t3.set_string("Jean");
	BOOST_CHECK_EQUAL(t3.get_string(),"Hello Jean");
}
