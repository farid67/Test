"""Unit test for main.py"""

import os
import sys
main_path = os.path.join('..','src','app')
sys.path.append(main_path)
import main
import unittest

class KnownValues(unittest.TestCase):
    def testDisplayNameKnownValues(self):
        """displayName should give knows result"""
        name = "Jean"
        expected_result = "Hello {0}".format(name)
        result = main.displayName(name)
        self.assertEqual(expected_result,result)

class DisplayNameBadInput(unittest.TestCase):
    def testBlank(self):
        """displayName should fail with blank string """
        self.assertRaises(main.InvalidStringError,main.displayName,"")

    def testNonAlpha(self):
        """ display should fail with not alpha string """
        self.assertRaises(main.InvalidStringError,main.displayName,"2")

