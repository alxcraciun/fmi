#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
using namespace std;

ifstream in("date.in");
ofstream out("date.out");

int v[10000001]; 

void mergesort();
void radixsort();
void shellsort();
void timsort();
void introsort();
void insertionsort();   //  O(n^2) time
void countsort();       //  O(n + max_val) time


int main()
{
    auto start = chrono::steady_clock::now();

    for (int i = 1; i <= 1000; i++)
        int a;

    auto end = chrono::steady_clock::now();

    chrono::duration<double> timer = start - end;

    cout << timer.count();

    return 0;
}

void mergesort()
{

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