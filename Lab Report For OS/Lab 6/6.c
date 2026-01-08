// Write a c program to simulate for LRU.
#include <stdio.h>

int findLRU(int time[], int f)
{
    int i, min = time[0], pos = 0;
    for (i = 1; i < f; i++)
    {
        if (time[i] < min)
        {
            min = time[i];
            pos = i;
        }
    }
    return pos;
}
int main()
{
    int pages[50], frames[10], time[10];
    int n, f, i, j, pos, pageFaults = 0, count = 0, found;
    printf("Enter the number of pages: ");
    scanf("%d", &n);
    printf("Enter the page reference string: ");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &pages[i]);
    }
    printf("Enter the number of frames: ");
    scanf("%d", &f);

    for (i = 0; i < f; i++)
    {
        frames[i] = -1;
        time[i] = 0;
    }
    printf("\nPage\tFrames\n");
    for (i = 0; i < n; i++)
    {
        found = 0;
        for (j = 0; j < f; j++)
        {
            if (frames[j] == pages[i])
            {
                found = 1;
                time[j] = ++count; 
                break;
            }
        }
        if (!found)
        {
            pos = findLRU(time, f);
            frames[pos] = pages[i];
            time[pos] = ++count;
            pageFaults++;
        }
        printf("%d\t", pages[i]);
        for (j = 0; j < f; j++)
        {
            if (frames[j] != -1)
                printf("%d ", frames[j]);
            else
                printf("- ");
        }
        printf("\n");
    }
    printf("\nTotal Page Faults = %d\n", pageFaults);
    return 0;
}
