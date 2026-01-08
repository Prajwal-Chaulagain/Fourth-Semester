// Write a c Program for Simulate Round Robin (RR) Algorithm.
#include <stdio.h>

int main()
{
    int n, i, tq, time = 0;
    int bt[100], rt[100], wt[100] = {0}, tat[100];
    int completed = 0;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    printf("Enter burst time for each process:\n");
    for (i = 0; i < n; i++)
    {
        printf("Process %d: ", i + 1);
        scanf("%d", &bt[i]);
        rt[i] = bt[i];     }

    printf("Enter time quantum: ");
    scanf("%d", &tq);

    while (1)
    {
        int done = 1;

        for (i = 0; i < n; i++)
        {
            if (rt[i] > 0)
            {
                done = 0;

                if (rt[i] > tq)
                {
                    time += tq;
                    rt[i] -= tq;
                }
                else
                {
                    time += rt[i];
                    wt[i] = time - bt[i];
                    rt[i] = 0;
                }
            }
        }

        if (done == 1)
            break;
    }

    float total_wt = 0, total_tat = 0;

    for (i = 0; i < n; i++)
    {
        tat[i] = bt[i] + wt[i];
        total_wt += wt[i];
        total_tat += tat[i];
    }

    printf("\nProcess\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (i = 0; i < n; i++)
    {
        printf("P%d\t%d\t\t%d\t\t%d\n", i + 1, bt[i], wt[i], tat[i]);
    }

    printf("\nAverage Waiting Time = %.2f", total_wt / n);
    printf("\nAverage Turnaround Time = %.2f\n", total_tat / n);

    return 0;
}
