#include "test.hpp"


int main (int argc, char * argv[]) // récupère une chaine de caractère en ligne de commande et affiche le message Hello + nom
{
    Test test(argv[1]); // appel au constructeur avec le nom passé en paramètre
    test.displayString();
    return 0;
}
