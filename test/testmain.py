"""Unit test for main.py"""

import os
import sys
main_path = os.path.join('src','app')
sys.path.append(main_path)
import main
import unittest

class KnownValues(unittest.TestCase):
    knownValues = ["Jean","Paul","pierre","Bob","louis"]
    
    def testDisplayNameKnownValues(self):
        """displayName should give knows result"""
        for name in self.knownValues:
            waited_result = "Hello {0}".format(name)
            result = main.displayName(name)
            self.assertEqual(waited_result,result)

class DisplayNameBadInput(unittest.TestCase):
    def testBlank(self):
        """displayName should fail with blank string """
        self.assertRaises(main.InvalidStringError,main.displayName,"")

    def testNonAlpha(self):
        """ display should fail with not alpha string """
        self.assertRaises(main.InvalidStringError,main.displayName,"2")

