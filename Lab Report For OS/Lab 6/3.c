// Write a c program to simulate contiguous memory allocation techniques for First Fit.
#include <stdio.h>

int main()
{
    int n, m, i, j;
    printf("Enter the number of blocks: ");
    scanf("%d", &n);
    int block[n];
    printf("Enter the size of each block:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &block[i]);
    }
    printf("Enter the number of processes: ");
    scanf("%d", &m);
    int process[m];  
    for (i = 0; i < m; i++)
    {
        scanf("%d", &process[i]);
    }
    for (i = 0; i < m; i++)
    {
        for (j = 0; j < n; j++)
        {
            if (block[j] >= process[i])
            {
                printf("Process %d allocated to block %d of size %d\n", i + 1, j + 1, block[j]);
                block[j] -= process[i];
                break;
            }
        }
        if (j == n)
        {
            printf("Process %d cannot be allocated\n", i + 1);
        }
    }
    return 0;
}