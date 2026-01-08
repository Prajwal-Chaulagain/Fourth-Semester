// Write a C program to find the prefix, suffix and substring of the given input strings.
#include <stdio.h>
#include <string.h>

// Function to print all prefixes of a string
void printPrefixes(char *str)
{
    int len = strlen(str);
    printf ("Prefixes:\n");
    for (int i = 1; i <= len; i++)
    {
        // Print the prefix of length i
       for (int j = 0; j < i; j++) 
       {
        printf("%c", str[j]);
       }
       printf("\n");
    }
}
// Function to print all suffixes of a string
void printSuffixes(char *str)
{
    int len = strlen(str);
    printf("Suffixes:\n");
    for (int i = 0; i < len; i++)
    {
        for (int j = i; j < len; j++)
        {
            printf("%c", str[j]);
        }
        printf("\n");
    }
}
// Function to print all substrings of a string
void printSubstrings(char *str)
{
    int len = strlen(str);
    printf("Substrings:\n");
    for (int i = 0; i < len; i++)
    {
        for (int j = i + 1; j <= len; j++)
        {
            //Print the substring starting from i and ending at j - i
            for (int k = i; k < j; k++)
            {
                printf("%c", str[k]);
            }
            printf("\n");
        }
    }
}
int main()
{
    char str[100];
    printf("Enter a string:");
    scanf("%s", str);
    printPrefixes(str);
    printSuffixes(str);
    printSubstrings(str);
    return 0;
}