// Write a C program to implement a DFA over {0,1} that accept strings that even number of 1.
#include <stdio.h>
#include <string.h>
int main() 
{
    char input[100];
    int state = 0; 
    printf("Enter a binary string (0s and 1s only): ");
    scanf("%s", input);
    for (int i = 0; i < strlen(input); i++) 
    {
        char c = input[i];
        if (c != '0' && c != '1') 
        {
            printf("Invalid input. Only 0 and 1 allowed.\n");
            return 0;
        }
        switch (state) 
        {
            case 0: 
                if (c == '1')
                    state = 1; 
                break;
            case 1: 
                if (c == '1')
                    state = 0; 
                break;
        }
    }
    if (state == 0)
        printf("Accepted: Even number of 1s.\n");
    else
        printf("Rejected: Odd number of 1s.\n");
    return 0;
}
