#pragma once
#include <iostream>

class BonDeMasa
{
private:
	int id;
	char *emitent;
	float valoare;

public:
	BonDeMasa();
	BonDeMasa(const int &id, const char *emitent, const float &valoare);
	BonDeMasa(const BonDeMasa &other);
	~BonDeMasa();

	void afiseaza();

	BonDeMasa &operator=(const BonDeMasa &other);
	friend std::istream &operator>>(std::istream &stream, BonDeMasa &other);
	friend std::ostream &operator<<(std::ostream &stream, const BonDeMasa &other);
};

class Angajat
{
private:
	int id;
	char *nume;
	int nrBonuri;
	BonDeMasa *bonuri;

public:
	Angajat();
	Angajat(const int &id, const char *nume);
	Angajat(const Angajat &other);
	~Angajat();

	void afiseaza();

	Angajat &operator=(const Angajat &other);
	bool operator<(const Angajat &other);

	Angajat &operator*=(const BonDeMasa &other_bon);

	friend std::istream &operator>>(std::istream &stream, Angajat &other);
	friend std::ostream &operator<<(std::ostream &stream, const Angajat &other);
};