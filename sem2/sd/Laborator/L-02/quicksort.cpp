#include <iostream>
#include <vector>

using namespace std;

vector<int> vect{18, 8, 4, 34, 10, 5, 2};

void quicksort(int low, int high)
{
    if (low < high)
    {
        int pivot = vect[high];
        int j = low;
        int i = low - 1;

        while (j < high)
        {
            if (vect[j] < pivot)
            {
                i++;
                swap(vect[i], vect[j]);
            }
            j++;
        }
        swap(vect[high], vect[i+1]);
        quicksort(low, i);
        quicksort(i+2, high);
    }
}

int main()
{
    for (int i = 0; i < vect.size(); i++)
        cout << vect[i] << ' ';

    cout << endl;

    quicksort(0, vect.size());

    for (int i = 0; i < vect.size(); i++)
        cout << vect[i] << ' ';

    return 0;
}