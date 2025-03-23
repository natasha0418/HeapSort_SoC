#include <stdio.h>

void heapify(int A[], int n, int idx) {
    int largest = idx;      //initialize largest as root
    int left = 2 * idx + 1; //left child
    int right = 2 * idx + 2; //right child

    if (left < n && A[left] > A[largest])
        largest = left;

    if (right < n && A[right] > A[largest])
        largest = right;

    if (largest != idx) {
        //if largest isnt root, swap 
        int temp = A[idx];
        A[idx] = A[largest];
        A[largest] = temp;

        // Recursively heapify subtree
        heapify(A, n, largest);
    }
}

//build max heap from array
void buildHeap(int A[], int n) {
    for (int i = n / 2 - 1; i >= 0; i--) {
        heapify(A, n, i);
    }
}

//heap sort function
void heapSort(int A[], int n) {
    //step 1: build a max heap
    buildHeap(A, n);

    //step 2: extract elements from heap 1by1
    for (int i = n - 1; i > 0; i--) {
        //move current root to end
        int temp = A[0];
        A[0] = A[i];
        A[i] = temp;

        //call heapify on reduced heap
        heapify(A, i, 0);
    }
}

//print array function
void printArray(int A[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", A[i]);
    }
    printf("\n");
}

int main() {
    int A[] = {5, 3, 16, 2, 10, 14};
    int n = sizeof(A) / sizeof(A[0]);

    printf("Original array: ");
    printArray(A, n);

    heapSort(A, n);

    printf("Sorted array: ");
    printArray(A, n);

    return 0;
}
