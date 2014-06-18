#ifndef TEST_H
#define TEST_H

#include <stdio.h>
#include <stdlib.h>
#include "libTest_Export.h" // important! Nom du fichier créer avec GENERATE_EXPORT_HEADER


/*
	Important, si on souhaite que la dll soit créer lors de la compilation, on doit spécifier le nom du header que l'on a 
	créer dans CMakeLists pour que les fonctions soient importées
*/
libTest_EXPORT void affiche(); 

#endif
