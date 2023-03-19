#include <iostream>
#include <vector>

using namespace std;

vector<int> vect{18, 8, 4, 34, 10, 5, 2};

void merge(int low, int mid, int high)
{
    vector<int> aux_vect;
    int i = low;
    int j = mid + 1;

    while (i <= mid && j <= high)
        if (vect[i] < vect[j])
        {
            aux_vect.push_back(vect[i]);
            i += 1;
        }
        else
        {
            aux_vect.push_back(vect[j]);
            j += 1;
        }

    while (i <= mid)
    {
        aux_vect.push_back(vect[i]);
        i += 1;
    }

    while (j <= high)
    {
        aux_vect.push_back(vect[j]);
        j += 1;
    }

    for (int i = 0; i < aux_vect.size(); i++)
        vect[low + i] = aux_vect[i];
}

void mergesort(int low, int high)
{
    int mid = (low + high) / 2;
    if (low < high)
    {
        mergesort(low, mid);
        mergesort(mid + 1, high);
        merge(low, mid, high);
    }
}

int main()
{
    for (int i = 0; i < vect.size(); i++)
        cout << vect[i] << ' ';

    cout << endl;

    mergesort(0, vect.size());

    for (int i = 0; i < vect.size(); i++)
        cout << vect[i] << ' ';

    return 0;
}


