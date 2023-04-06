#include <iostream>
#include <fstream>
#include <cstdlib>
#include <chrono>

using namespace std;

ofstream out("test03.txt");

int main()
{
    // Providing a seed value to get unique numbers each time
    srand((unsigned)time(NULL));

    for (int i = 1; i <= 100000000; i++)
    {
        int random = rand() % 1001;
        out << random << ' ';
    }

    return 1;
}