#include <stdio.h>

#define SIZE 100

void bubble_sort(int arr[SIZE]) {
    for (int i = 0; i < SIZE-1; i++) {
        for (int j = 0; j < SIZE-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

int main() {
    int arr[SIZE];
    for (int i = 0; i < SIZE; i++) {
        arr[i] = SIZE - i;  // Initialize array in reverse order
    }
    
    bubble_sort(arr);

    for (int i = 0; i < SIZE; i++) {
        printf("%d ", arr[i]);
    }
    return 0;
}
