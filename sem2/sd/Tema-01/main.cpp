#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
#include <cstdlib>
#include <algorithm>

using namespace std;

ifstream in("test.txt");

void counting(vector<int> &vect, int size, int exp, const int BASE);
void radixsort(vector<int> &vect, int size, const int BASE);

void merge(vector<int> &vect, int low, int mid, int high); // utility function
void mergesort(vector<int> &vect, int low, int high);      // O(nlogn) time

void insertionsort(vector<int> &vect, int low, int high); //  O(n^2) time
void timsort(vector<int> &vect, int size, const int SPLIT_SIZE);     // O(nlogn) time

void shellsort(vector<int> &vect, int size);

vector<int> vect{18, 8, 4, 34, 10, 5, 2}, vect_sorted, vect_dummy;

int main()
{
    cout << '\n';

    // vect.clear();

    // in.ignore(100, '\n');
    // int x;
    // while(in>>x)
    //     vect.push_back(x);

    vect_sorted = vect;
    auto start = chrono::high_resolution_clock::now();
    sort(vect_sorted.begin(), vect_sorted.end());
    auto finish = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::microseconds>(finish - start);
    cout << "STL IntroSort:\n"
         << duration.count() << " microseconds\n\n";

    vect_dummy = vect;
    auto start1 = chrono::high_resolution_clock::now();
    mergesort(vect_dummy, 0, vect_dummy.size() - 1);
    auto finish1 = chrono::high_resolution_clock::now();
    auto duration1 = chrono::duration_cast<chrono::microseconds>(finish1 - start1);
    if (vect_sorted == vect_dummy)
        cout << "MergeSort:\n" << duration.count() << " microseconds\n\n";
    else
        cout << "MergeSort failed\n\n";

    vect_dummy = vect;
    auto start2 = chrono::high_resolution_clock::now();
    shellsort(vect_dummy, vect_dummy.size());
    auto finish2 = chrono::high_resolution_clock::now();
    auto duration2 = chrono::duration_cast<chrono::microseconds>(finish2 - start2);
    if (vect_sorted == vect_dummy)
        cout << "ShellSort:\n" << duration.count() << " microseconds\n\n";
    else
        cout << "ShellSort failed\n\n";

    vect_dummy = vect;
    auto start3 = chrono::high_resolution_clock::now();
    insertionsort(vect_dummy, 0, vect_dummy.size() - 1);
    auto finish3 = chrono::high_resolution_clock::now();
    auto duration3 = chrono::duration_cast<chrono::microseconds>(finish3 - start3);
    if (vect_sorted == vect_dummy)
        cout << "InsertionSort:\n" << duration.count() << " microseconds\n\n";
    else
        cout << "InsertionSort failed\n\n";

    vect_dummy = vect;
    auto start4 = chrono::high_resolution_clock::now();
    timsort(vect_dummy, vect_dummy.size(), 32);
    auto finish4 = chrono::high_resolution_clock::now();
    auto duration4 = chrono::duration_cast<chrono::microseconds>(finish4 - start4);
    if (vect_sorted == vect_dummy)
        cout << "TimSort:\n" << duration.count() << " microseconds\n\n";
    else
        cout << "TimSort failed\n\n";

    vect_dummy = vect;
    auto start5 = chrono::high_resolution_clock::now();
    radixsort(vect_dummy, vect_dummy.size(), 10);
    auto finish5 = chrono::high_resolution_clock::now();
    auto duration5 = chrono::duration_cast<chrono::microseconds>(finish5 - start5);
    if (vect_sorted == vect_dummy)
        cout << "RadixSort:\n" << duration.count() << " microseconds\n\n";
    else
        cout << "RadixSort failed\n\n";

    return 0;
}

void merge(vector<int> &vect, int low, int mid, int high)
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

void mergesort(vector<int> &vect, int low, int high)
{
    int mid = (low + high) / 2;
    if (low < high)
    {
        mergesort(vect, low, mid);
        mergesort(vect, mid + 1, high);
        merge(vect, low, mid, high);
    }
}

void counting(vector<int> &vect, int size, int exp, const int BASE)
{
    vector<int> aux(size), counter(BASE, 0);

    // for each digit calculate occurence number
    for (int i = 0; i < size; i++)
        counter[(vect[i] / exp) % BASE]++;

    for (int i = 1; i < BASE; i++)
        counter[i] += counter[i - 1];

    for (int i = size - 1; i >= 0; i--)
    {
        aux[counter[(vect[i] / exp) % BASE] - 1] = vect[i];
        counter[(vect[i] / exp) % 10]--;
    }

    for (int i = 0; i < size; i++)
        vect[i] = aux[i];
}

void radixsort(vector<int> &vect, int size, const int BASE)
{
    int maxi = vect[0];
    for (int i = 1; i < size; i++)
        if (vect[i] > maxi)
            maxi = vect[i];

    for (int exp = 1; maxi / exp > 0; exp *= BASE)
        counting(vect, size, exp, BASE);
}

void shellsort(vector<int> &vect, int size)
{
    for (int gap = size / 2; gap > 0; gap /= 2)
        for (int i = gap; i < size; i += 1)
        {
            int temp = vect[i], j = i;
            while (j >= gap && vect[j - gap] > temp)
            {
                vect[j] = vect[j - gap];
                j -= gap;
            }
            vect[j] = temp;
        }
}

void insertionsort(vector<int> &vect, int low, int high)
{
    for (int i = low + 1; i <= high; i++)
    {
        int temp = vect[i], j = i - 1;
        while (j >= low && vect[j] > temp)
        {
            vect[j + 1] = vect[j];
            j--;
        }
        vect[j + 1] = temp;
    }
}

void timsort(vector<int> &vect, int size, const int SPLIT_SIZE)
{
    for (int i = 0; i < size; i += SPLIT_SIZE)
        insertionsort(vect, i, min((i + SPLIT_SIZE - 1), (size - 1)));     // check if remaining vector is less than SPLIT_SIZE

    // merge multiples of SPLIT_SIZE (32, 64, 128...)
    for (int seq_size = SPLIT_SIZE; seq_size < size; seq_size *= 2)
        for (int left = 0; left < size; left += 2 * seq_size)
        {
            int mid = left + seq_size - 1;
            int right = min((left + 2 * seq_size - 1), (size - 1));     // again, check if remaining vector is less than SPLIT_SIZE
            if (mid < right)
                merge(vect, left, mid, right);
        }
}

void introsort()
{

}