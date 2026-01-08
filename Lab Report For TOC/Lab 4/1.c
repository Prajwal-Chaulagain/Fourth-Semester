// Write a C program to check whether the given input is a valid identifiers or keywords.
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#define MAX_LENGTH 100
// Function to check if a string is a keyword
int isKeyword(char str[])
{
    const char *keyword[] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double", "else", "enum", "extern", "float", "for", "goto", "if", "inline", "int,", "long", "register", "restrict", "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "unsigned", "void", "volatile", "while", NULL};
    for (int i = 0; keyword [i] != NULL; i++)
    {
        if (strcmp(str, keyword [i]) == 0)
        {
            return 1;
        }
    }
    return 0;
}
int isValidIdentifier(char str[])
{
    int len = strlen(str);
    if (len == 0 || isdigit(str[0]))
    {
        return 0;
    }
    for (int i = 0; i < len; i++)
    {
        if (!isalnum(str[i]) && str[i] != '_')
        {
            return 0;
        }
    }
    return 1;
}
int main()
{
    char str[MAX_LENGTH];
    printf("Enter a string to check if it's a valid identifier or keyword:");
    scanf("%s", str);
    if (isKeyword(str))
    {
        printf("'%s' is a C keyword.\n", str);
    }
    else if (isValidIdentifier(str))
    {
        printf("'%s' is a valid C identifier.\n", str);
    }
    else
    {
        printf("'%s' is not a valid C identifier or keyword.\n", str);
    }
    return 0;
}
