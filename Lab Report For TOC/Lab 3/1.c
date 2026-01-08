// Write a C program to implement NFA over {0,1} that accepts all the strings starting with 01.
#include <stdio.h>
#define max 15

int main()
{
    char str[max], f = 'a';
    int i;
    int flag = 0;
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
                flag = 1;
            break;
        case 'b':
            if (str[i] == '0')
                flag = '1';
            if (str[i] == '1')
                f = 'c';
            break;
        case 'c':
            if (str[i] == '0')
                f = 'c';
            if (str[i] == '1')
                f = 'c';
            break;
        }
        if (flag)
            break;
    }
    if (f == 'c')
        printf("String %s is accepted", str);
    else
        printf("String %s is not accepted", str);
    return 0;
}