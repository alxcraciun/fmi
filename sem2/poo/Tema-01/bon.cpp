#include "bon.h"
#include <cstring>

BonDeMasa::BonDeMasa()
{
	id = 0;
	emitent = new char[50];
	strcpy(emitent, "Untitled");
	valoare = 0.0;
}

BonDeMasa::BonDeMasa(const int &other_id, const char *other_emitent, const float &other_valoare)
{
	id = other_id;
	emitent = new char[strlen(other_emitent) + 1];
	strcpy(emitent, other_emitent);
	valoare = other_valoare;
}

BonDeMasa::BonDeMasa(const BonDeMasa &other)
	: id(other.id), valoare(other.valoare)
{
	emitent = new char[strlen(other.emitent) + 1];
	strcpy(emitent, other.emitent);
}

BonDeMasa::~BonDeMasa()
{
	delete[] emitent;
}

void BonDeMasa::afiseaza()
{
	std::cout << "BonID " << id << " | " << emitent << ' ' << valoare << std::endl;
}

BonDeMasa &BonDeMasa::operator=(const BonDeMasa &other)
{
	id = other.id;
	emitent = new char[strlen(other.emitent) + 1];
	strcpy(emitent, other.emitent);
	valoare = other.valoare;
	return *this;
}

std::istream &operator>>(std::istream &stream, BonDeMasa &other)
{
	//? why is line 53 needed?

	std::cout << "ID-Bon: ";
	stream >> other.id;

	std::cout << "Emitent: ";
	stream.ignore();
	stream.getline(other.emitent, 50);

	std::cout << "Valoare: ";
	stream >> other.valoare;

	std::cout << std::endl;
	return stream;
}

std::ostream &operator<<(std::ostream &stream, const BonDeMasa &other)
{
	stream << "BonID " << other.id << " | " << other.emitent << ' ' << other.valoare << std::endl;
	return stream;
}

Angajat::Angajat()
{
	id = 0;
	nume = new char[50];
	strcpy(nume, "Untitled");
	nrBonuri = 0;
	bonuri = new BonDeMasa[1];
}

Angajat::Angajat(const int &other_id, const char *other_nume)
{
	id = other_id;
	nume = new char[50];
	strcpy(nume, other_nume);
	nrBonuri = 0;
	bonuri = new BonDeMasa[1];
}

Angajat::Angajat(const Angajat &other)
{
	id = other.id;
	nume = new char[strlen(other.nume) + 1];
	strcpy(nume, other.nume);
	nrBonuri = other.nrBonuri;
	bonuri = new BonDeMasa[nrBonuri + 1];
	for (int i = 1; i <= other.nrBonuri; i++)
		bonuri[i] = other.bonuri[i];
}

Angajat::~Angajat()
{
	delete[] nume;
	delete[] bonuri;
}

void Angajat::afiseaza()
{
	//? de ce nu trebuie pus void la constructori/destructori
	std::cout << "AngajatID " << id << " | " << nume << " - " << nrBonuri << " bonuri" << std::endl;

	for (int i = 1; i <= nrBonuri; i++)
		bonuri[i].afiseaza();
	
	std::cout << std::endl;
}

Angajat &Angajat::operator=(const Angajat &other)
{
	id = other.id;
	nume = new char[strlen(other.nume) + 1];
	strcpy(nume, other.nume);
	nrBonuri = other.nrBonuri;
	bonuri = new BonDeMasa[nrBonuri + 1];
	for (int i = 1; i <= other.nrBonuri; i++)
		bonuri[i] = other.bonuri[i];
	return *this;
}

bool Angajat::operator<(const Angajat &other)
{
	if (id < other.id)
		return true;
	else
		return false;
}

std::istream &operator>>(std::istream &stream, Angajat &other)
{
	//? De ce nu merge const aici cum pun la cout?

	std::cout << "ID_Angajat: ";
	stream >> other.id;

	std::cout << "Nume_Angajat: ";
	stream.ignore();
	stream.getline(other.nume, 50);

	std::cout << "Nr_Bonuri: ";
	stream >> other.nrBonuri;

	std::cout << std::endl;

	other.bonuri = new BonDeMasa[other.nrBonuri + 1];
	for (int i = 1; i <= other.nrBonuri; i++)
		std::cin >> other.bonuri[i];

	return stream;
}

std::ostream &operator<<(std::ostream &stream, const Angajat &other)
{
	stream << "AngajatID " << other.id << " | " << other.nume;
	return stream;
}

Angajat &Angajat::operator*=(const BonDeMasa &other_bon)
{
	nrBonuri = nrBonuri + 1;
	BonDeMasa *auxiliar;
	auxiliar = new BonDeMasa[nrBonuri + 1];
	for (int i = 1; i < nrBonuri; i++)
		auxiliar[i] = bonuri[i];
	auxiliar[nrBonuri] = other_bon;
	bonuri = auxiliar;
	return *this;
}