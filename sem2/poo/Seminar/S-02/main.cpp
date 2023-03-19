#include <iostream>
#include <string>

class Seminar
{
    std::string materie;
    int serie;
    int grupa[4];

public:

    // asa nu mai e nevoie sa il fac 
    int operator[](int x)
    {
        return grupa[x];
    }
    friend std::istream &operator>>(std::istream &, Seminar &);
    friend std::ostream &operator<<(std::ostream &, Seminar &); // cand dau antetul merge si fara sa dau numele
};

std::istream &operator>>(std::istream &in, Seminar &s)
{
    in >> s.materie >> s.serie;
    for (int i = 0; i < 4; i++)
        in >> s.grupa[i];
    return in;

    // 1& -> e.g. cin >> s1 >> s2; adica operator>>(operator>>(cin, s1), s2)
    // 2& -> trebuie neaparat sa am un singur flux intrare standard
}

std::ostream &operator<<(std::ostream &out, Seminar &s)
{
    out << s.materie << ' ' << s.serie;
    for (int i = 0; i < 4; i++)
        out << s.grupa[i];
    return out;
}


int main()
{
    Seminar s1; // 700 13 131 132 133 134
    std::cin >> s1;

    // s1.operator[]() sau as putea face cu getter intrucat s.grupa e private
    
    std::cout << s1[2]; // 133
}