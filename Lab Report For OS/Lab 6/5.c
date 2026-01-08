// Write a c program to simulate optimal page replacement.
#include <stdio.h>

int findOptimal(int pages[], int frames[], int n, int index, int f)
{
    int farthest = index, res = -1, i, j;
    for (i = 0; i < f; i++)
    {
        int found = 0;
        for (j = index; j < n; j++)
        {
            if (frames[i] == pages[j])
            {
                if (j > farthest)
                {
                    farthest = j;
                    res = i;
                }
                found = 1;
                break;
            }
        }
        if (!found)
            return i;
    }
    return (res == -1) ? 0 : res;
}
int main()
{
    int pages[50], frames[10], n, f, i, j, k, pageFaults = 0, found, replaceIndex;
    printf("Enter number of pages: ");
    scanf("%d", &n);
    printf("Enter the page reference string: ");
    for (i = 0; i < n; i++)
        scanf("%d", &pages[i]);
    printf("Enter number of frames: ");
    scanf("%d", &f);
    for (i = 0; i < f; i++)
        frames[i] = -1; 
    printf("\nPage\tFrames\n");
    for (i = 0; i < n; i++)
    {
        found = 0;
        for (j = 0; j < f; j++)
        {
            if (frames[j] == pages[i])
            {
                found = 1;
                break;
            }
        }
        if (!found)
        {
            for (j = 0; j < f; j++)
            {
                if (frames[j] == -1)
                {
                    frames[j] = pages[i];
                    found = 1;
                    pageFaults++;
                    break;
                }
            }
        }
        if (!found)
        {
            replaceIndex = findOptimal(pages, frames, n, i + 1, f);
            frames[replaceIndex] = pages[i];
            pageFaults++;
        }
        printf("%d\t", pages[i]);
        for (k = 0; k < f; k++)
        {
            if (frames[k] != -1)
                printf("%d ", frames[k]);
            else
                printf("- ");
        }
        printf("\n");
    }
    printf("\nTotal Page Faults = %d\n", pageFaults);
    return 0;
}
