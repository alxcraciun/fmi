#include <iostream>
#include <vector>

using namespace std;



class Curs
{
    int nr_ore, grupa;

public:
    // desi are merge si fara this
    // this = pointer la adresa obiectului care apeleaza functia
    Curs(int nr_ore = 20) {this->nr_ore = nr_ore;} 
    void citire();
    virtual void afisare();
    operator int() {return nr_ore;} // operator de cast catre int
};

// inheritance, adica mostenire
class Optional : public Curs
{
    void afisare()
    {
        cout << "Am suprascris functia de la Curs";
    }
};

void Curs::citire()
{
    cout << "Nr. ore: ";
    cin >> nr_ore;
    cout << "Grupa: ";
    cin >> grupa;
    cout << endl;
}

void Curs::afisare()
{
    cout << nr_ore << ' ' << grupa << endl;
}

// porneste de la unvector care are dimensiunea 0, pushback realoca spatiul respectiv din nou

int main()
{
    Curs a0; // default a0.nr_ore = 20;
    Curs a = 100;   // cast prin constructorul cu 1 param
    Curs b = a;     // constructor de copiere
    Curs c(100);
    int X = a; // merge doar daca am operatorul de cast supraincarcat

    /*

    // referinta = alias
    // pointer = copie

    vector<Curs> v;
    int n;

    v.push_back(Curs());

    // ultima zona de memorie din v
    // v.back()  --  referinta
    // v.rbegin()  --  iterator

    // v.begin(), v.rbegin(), v.end(), v.rend()  ->  iterator
    (v.back()).citire();
    (v.back()).afisare();

    for (int i = 0; i < v.size(); i++)
        v[i].afisare();

    // p <iterator_object>, asemanator cu pointer
    for (auto p = v.begin(); p != v.end(); p++)
        (*p).afisare();

    // in loc de linia 44
    for (vector<Curs>::iterator p = v.begin(); p != v.end(); p++)
        (*p).afisare();

    vector<Curs>::reverse_iterator q;
    for (q = v.rbegin(); q != v.rend(); q++)
        (*q).afisare();
    */

    /*
    vector<Curs *> vv;
    vv.push_back(new Curs());

    (vv.back())->citire();
    vv.push_back(new Optional());
    (vv.back())->citire();

    for (auto p = vv.begin(); p != vv.end(); p++)
        (**p).afisare(); // (*p)->afisare();
    */


    return 0;
}