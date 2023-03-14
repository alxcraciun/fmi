
#include "bon.h"

using namespace std;

int main()
{
	BonDeMasa b1(1, "GustoPass", 9.35), b2, b3;
	b3 = b1;
	Angajat a1(22, "Ionescu"), a2;
	cout << a1;
	cin >> b2;
	cin >> a2;
	Angajat a3(a2), a4;
	a3 *= b1; // atribuie bonul de masa b1 angajatului a3 prin salvarea lui b1 in vectorul bonuri din a3
	a4 = a3;
	if (a1 < a2)
		cout << "Angajatul " << a1 << " are id-ul mai mic decat " << a2;
	a3.afiseaza(); // afisarea tuturor informatiilor despre un angajat.

	return 0;
}