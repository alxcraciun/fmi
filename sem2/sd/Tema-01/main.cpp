#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
#include <cstdlib>
#include <algorithm>

using namespace std;

ifstream in("test.txt");

void radixsort();

void merge(vector<int> &vect, int low, int mid, int high);  // utility for mergesort
void mergesort(vector<int> &vect, int low, int high);       // O(nlogn) time

void shellsort(vector<int> &vect, int size);

void insertionsort(vector<int> &vect, int low, int high);   //  O(n^2) time
void timsort();   // O(nlogn)

void countsort(); //  O(n + max_val) time

vector<int> vect{18, 8, 4, 34, 10, 5, 2}, vect_sorted, vect_dummy;

int main()
{
  cout << '\n';

  vect_sorted = vect;
  auto start = chrono::high_resolution_clock::now();
  sort(vect_sorted.begin(), vect_sorted.end());
  auto finish = chrono::high_resolution_clock::now();
  auto duration = chrono::duration_cast<chrono::microseconds>(finish - start);
  cout << "STL IntroSort:\n" << duration.count() << " microseconds\n\n";

  vect_dummy = vect;
  auto start1 = chrono::high_resolution_clock::now();
  mergesort(vect_dummy, 0, vect_dummy.size()-1);
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
  insertionsort(vect_dummy, 0, vect_dummy.size()-1);
  auto finish3 = chrono::high_resolution_clock::now();
  auto duration3 = chrono::duration_cast<chrono::microseconds>(finish3 - start3);
  if (vect_sorted == vect_dummy)
    cout << "InsertionSort:\n" << duration.count() << " microseconds\n\n";
  else
    cout << "InsertionSort failed\n\n";

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

void radixsort()
{
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

void timsort()
{
}

void introsort()
{
}


void countsort()
{
}