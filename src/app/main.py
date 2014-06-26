# -*- coding:utf-8 -*-

import os 

class InvalidStringError(Exception):pass

def displayName(name):
    if not name : 
        raise InvalidStringError,'Input can not be blank'
    if not name.isalpha():
        raise InvalidStringError,'Input can only contain letters'
    chaine = "Hello {0}".format(name)
    print chaine
    return chaine


