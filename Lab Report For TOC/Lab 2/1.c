// Write a C program to implement DFA over {0,1} that accepts all the strings starting with 01.
#include <stdio.h>
#include <string.h>

int dfa(char *str)
{
    int state = 0; // Initial state is q0
    // Iterate through the input string
    for (int i = 0; i < strlen(str); i++)
    {
        char c = str[i];
        switch (state)
        {
        case 0: // From q0
            if (c == '0')
            {
                state = 1;
            }
            else
            {
                return 0;
            }
            break;
        case 1: // From q1
            if (c == '1')
            {
                state = 2;
            }
            else if (c == '0')
            {
                state = 1;
            }
            break;
        case 2:
            if (c == '0' || c == '1')
            {
                state = 2;
            }
            break;
        default:
            return 0;
        }
    }
    return (state == 2);
}
int main()
{
    char str[100];
    printf("Enter a string:");
    scanf("%s", str);
    if (dfa(str))
    {
        printf("The string is accepted.\n");
    }
    else
    {
        printf("The string is rejected.\n");
    }
    return 0;
}