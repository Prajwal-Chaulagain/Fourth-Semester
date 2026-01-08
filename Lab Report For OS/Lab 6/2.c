// Write a c program to simulate contiguous memory allocation techniques for Best Fit.
#include <stdio.h>

int main()
{
    int n, m, i, j, best, bestIndex;
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
    printf("Enter the size of each process:\n");
    for (i = 0; i < m; i++)
    {
        scanf("%d", &process[i]);
    }
    for (i = 0; i < m; i++)
    {
        best = -1;
        bestIndex = -1;
        for (j = 0; j < n; j++)
        {
            if (block[j] >= process[i] && (best == -1 || block[j] < best))
            {
                best = block[j];
                bestIndex = j;
            }
        }
        if (bestIndex != -1)
        {
            printf("Process %d allocated to block %d of size %d\n", i + 1, bestIndex + 1, block[bestIndex]);
            block[bestIndex] -= process[i];
        }
        else
        {
            printf("Process %d cannot be allocated\n", i + 1);
        }
    }
    return 0;
}
