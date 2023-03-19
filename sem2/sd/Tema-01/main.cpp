#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
#include <cstdlib>
#include <algorithm>

using namespace std;

ifstream in("test.txt");

void radixsort();

void shellsort();

void timsort();

void introsort();

void insertionsort(); //  O(n^2) time

void countsort(); //  O(n + max_val) time

vector<int> vect{18, 8, 4, 34, 10, 5, 2}, vect_sorted, vect_dummy;

int main()
{
  cout << '\n';
  int size = sizeof(vect) / sizeof(vect[0]);

  vect_sorted = vect;
  vect_dummy = vect;

  auto start = chrono::high_resolution_clock::now();
  sort(vect_sorted.begin(), vect_sorted.end());
  auto finish = chrono::high_resolution_clock::now();
  auto duration = chrono::duration_cast<chrono::microseconds>(finish - start);
  cout << "STL IntroSort:\n" << duration.count() << " microseconds\n\n";

  auto start1 = chrono::high_resolution_clock::now();
  sort(vect_dummy.begin(), vect_dummy.end());
  auto finish1 = chrono::high_resolution_clock::now();
  auto duration1 = chrono::duration_cast<chrono::microseconds>(finish1 - start1);
  if (vect_sorted == vect_dummy)
    cout << "MergeSort:\n" << duration.count() << " microseconds\n\n";
  else
    cout << "MergeSort failed\n\n";

  cout << '\n';
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

void shellsort()
{
}

void timsort()
{
}

void introsort()
{
}

void insertionsort()
{
}

void countsort()
{
}