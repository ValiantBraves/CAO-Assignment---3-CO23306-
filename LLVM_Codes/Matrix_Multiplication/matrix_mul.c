#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 100

void multiply_matrices(float A[SIZE][SIZE], float B[SIZE][SIZE], float C[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            C[i][j] = 0;
            for (int k = 0; k < SIZE; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

int main() {
    float A[SIZE][SIZE], B[SIZE][SIZE], C[SIZE][SIZE];
    
    srand(time(NULL));

    // Initialize matrices with random float values
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            A[i][j] = (float)(rand() % 100) / 10.0;
            B[i][j] = (float)(rand() % 100) / 10.0;
        }
    }

    clock_t start = clock();
    multiply_matrices(A, B, C);
    clock_t end = clock();

    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Matrix multiplication completed in %.3f seconds\n", time_spent);

    return 0;
}
