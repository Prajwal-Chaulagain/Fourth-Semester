// Write a C program to implement DFA over {0,1} that accepts all the strings ending with 01.
#include <stdio.h>
#define max 15

int main()
{
    char str[max], f = 'a';
    int i;
    printf("Enter the string to be checked:");
    scanf("%s", str);
    for (i = 0; str[i] != '\0'; i++)
    {
        switch (f)
        {
        case 'a':
            if (str[i] == '0')
                f = 'b';
            if (str[i] == '1')
                f = 'a';
            break;
        case 'b':
            if (str[i] == '0')
                f = 'b';
            if (str[i] == '1')
                f = 'c';
            break;
        case 'c':
            if (str[i] == '0')
                f = 'b';
            if (str[i] == '1')
                f = 'a';
            break;
        }
    }
    if (f == 'c')
        printf("String %s is accepted", str);
    else
        printf("String %s not accepted", str);
    return 0;
}