#include <iostream>
#include <cstring>

using namespace std;

class Curs
{
    // daca am date alocate dinamic 
    char *denumire;

public:
    Curs() 
    {
        denumire = new char[100];
    }
    
    Curs(const Curs& ob) 
    {
        denumire = new char[strlen(ob.denumire)+1];
        strcpy(denumire, ob.denumire);
        strcpy(ob.denumire, "modificat");
    }
    
    ~Curs()
    {
        delete[] denumire;
    }

    void citire() { cin >> denumire; }
    void afisare() { cout << denumire << endl; }

    // const la functie nu modifica elementele din this
};


int main()
{
    Curs a;
    cout << sizeof(a) << ' ';
    a.citire();
    a.afisare();

    {
        Curs b(a);
    }

    a.afisare();

    return 0;
}