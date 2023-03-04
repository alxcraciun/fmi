#include <iostream>
#include <fstream>

// AlgSort (infoarena)

std::ifstream f("date.in");

class Algorithms
{
public:
    void insertionSort()
    {
        // O(n*n) time
        // O(1) space


    }

    void countSort()
    {
        // O(n + max_val) time
        // O(max_val) space
    }
};

int main()
{
    /*
        for (int i = 1; i < n; i++)
        {
        int key = v[i];
        int j = i - 1;
        while (j > -1 && key < v[j])
        {
            v[j + 1] = v[j];
            j -= 1;
        }
        v[j + 1] = key;
        }
    */
    int v[100], fr[100], n = -1;

    // while (f.good())

    while (f >> v[++n])
        fr[v[n]]++;

    int k = 0;
    for (int i = 0; i < 11; i++)
        for(int j = 0; i < fr[i]; j++)
            v[k++] = i;

    for (int i = 0; i < n; i++)
        std::cout << v[i] << ' ';


    /*
        vf = [0 for i in range(0,x+1)]
        for i in range(0, len(v)):
            vf[v[i]] += 1

        for i in range(0, k+1):
            j = vf[i]
            while j > 0:
                print(i)
                j -= 1
    */


    return 0;
}