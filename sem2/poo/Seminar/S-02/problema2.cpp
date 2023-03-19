#include <iostream>
#include <string>

class seminar
{
    std::string materie;
    int grupa[4], serie;

public:
    friend std::istream &operator>>(std::istream &, seminar &);
    friend std::ostream &operator<<(std::ostream &, const seminar &);
    int operator[](int x);
    seminar &operator-();
    // seminar &operator++();    // ++s, in loc de linia 17
    seminar &operator++(int); // s++
    operator int();
    friend seminar &operator++(seminar &);

    seminar &operator-(seminar &other)
    {
        // am warning din cauza ca returnez o adresa care apoi dispare din memorie
        seminar local(*this);
        local.serie -= other.serie;
        return local;
    }

    // const-ul aici imi strica atribuirea multipla e.g. v[1] = v[2] = s2 - s3;
    seminar &operator=(seminar &other)
    {
        // evita s1 = s1
        if (this != &other)
        {
            materie = other.serie;
            for (int i = 0; i < 4; ++i)
                grupa[i] = other.grupa[i];
            serie = other.serie;
        }
        return *this;
    }

    bool operator!=(const seminar &other)
    {
        // fa si o sortare si apoi vevrificarea

        for (int i = 0; i < 4; ++i)
            if (grupa[i] != other.grupa[i])
                return false;

        if (serie != other.serie)
            return true;
        
        if(materie != other.materie)
            return true;

        return false;
    }

    seminar& operator+ (seminar& other)
    {
        seminar local (*this);
        local.serie += other.serie;
        return local;
    }

    seminar& operator+= (seminar& other)
    {
        *this = *this + other;
        return *this;
    }

    bool operator!()
    {
        if(materie == "poo")
            return false;
        return true;
    }
};

int main()
{
    seminar s1;
    std::cin >> s1;
    std::cout << s1;
    std::cout << s1[2];
    std::cout << std::endl << -s1;
    ++s1;
    s1++;
    int y = s1; // extrage seria

    seminar v[3], s2, s3;
    v[0] = s1;
    std::cin >> s2 >> s3;
    v[1] = v[2] = s2 - s3;
    if (v[0] != v[2])
    {
        v[0] += v[2];
    }
    else if (!v[1])
        std::cout << "v[1] nu e zero";

    return 0;
}

// niciodata const la &s pt ca ii blochez citirea
std::istream &operator>>(std::istream &in, seminar &s)
{
    in >> s.materie >> s.serie;
    for (int i = 0; i < 4; i++)
        in >> s.grupa[i];
    return in;
}

std::ostream &operator<<(std::ostream &out, const seminar &s)
{
    out << s.materie << ' ' << s.serie << ' ';
    for (int i = 0; i < 4; i++)
        out << s.grupa[i];
    return out;
}

int seminar::operator[](int x)
{
    return grupa[x];
}

seminar &seminar::operator-()
{
    this->serie = this->serie * (-1);
    return *this;
}

// seminar &seminar::operator++()
// {
//     this->serie++;
//     return *this;
// }

seminar &seminar::operator++(int)
{
    serie++;
    return *this;
}

seminar::operator int()
{
    return serie;
}

// in loc de liniile comentate mai sus
seminar &operator++(seminar &s)
{
    s.serie++;
    return s;
}

/* Notes

Linker-ul gestioneaza toate scope-urile

Operatorul de rezolutie dinainte mentioneaza la ce scope sa caute.

this->serie
(*this).serie


! N-o sa aiba foarte mult sens corpul operatorilor, e doar pentru partea de sintaxa

*/