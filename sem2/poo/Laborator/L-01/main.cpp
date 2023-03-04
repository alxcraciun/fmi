#include <iostream>
// using namespace std;

class Facultate
{
public:
    Facultate()
    {
        std::cout << "sunt in constructorul default" << '\n';
    };

    Facultate(const std::string &numeParametru)
    {
        // std::cout << &numeParametru << std::endl;
        std::cout << "sunt in constructorul cu mai multi parametrii" << '\n';
        nume = numeParametru;
    };

    Facultate(const Facultate &other)
        : nume(other.nume)
    {
        std::cout << "sunt in constructorul de copiere" << nume << '\n';
    };


    Facultate& operator=(const Facultate& other)
    {
        std::cout << "operator =" << '\n';
        nume = other.nume;
        return *this;   
        // this este o adresa, returnam valoarea de la adresa respectiva\
        // operatorul * este unul de dereferentiere
    };

    std::string getNume()
    {
        return nume;
    };

    friend std::ostream& operator<<(std::ostream& os, const Facultate &facultate);

    // destructor - mereu fara parametru
    ~Facultate()
    {
        std::cout << "destructor facultate" << '\n';
    }

    std::ostream& operator<<(std::ostream& os, const Facultate &facultate)
    {
        os << "Facultatea selectata " << facultate.nume;
        return os;
    }
    
    // 

private:
    std::string nume;
    std::string nume2;
};

int main()
{
    std::string param = "FMI"; // copiaza string-ul la o alta adresa

    // std::cout << &param << '\n';

    Facultate facultate1(param); // apeleaza constructorul

    std::cout << param << '\n';

    // cout << '\n' << facultate1.~Facultate();

    return 0;
}