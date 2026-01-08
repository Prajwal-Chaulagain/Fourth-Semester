// Write a c program using threads that prints sum of numbers up to given positive number n.
#include <stdio.h>
#include <pthread.h>

// Global variables to share data between thread and main
int n;
long long sum = 0;

// Thread function to calculate sum
void* calculate_sum(void* arg) {
    for(int i = 1; i <= n; i++) {
        sum += i;
    }
    pthread_exit(NULL);
}

int main() {
    pthread_t thread;

    printf("Enter a positive number: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Please enter a positive number.\n");
        return 1;
    }

    // Create thread
    if(pthread_create(&thread, NULL, calculate_sum, NULL)) {
        printf("Error creating thread.\n");
        return 1;
    }

    // Wait for the thread to finish
    pthread_join(thread, NULL);

    printf("Sum of numbers from 1 to %d = %lld\n", n, sum);
    return 0;
}
