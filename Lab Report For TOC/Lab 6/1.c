// Write a C program to implement PDA to accept the language given by l={0^n.1^n:n>0}.
#include <stdio.h>
#include <string.h>
int main() 
{
    char input[100];
    char stack[100];
    int top = -1; 
    int i;
    printf("Enter a string: ");
    scanf("%s", input);
    i = 0;
    while (input[i] == '0') 
    {
        stack[++top] = '0';
        i++;
    }
    while (input[i] == '1') {
        if (top == -1) 
        { 
            printf("The string is not accepted.\n");
            return 0;
        }
        top--;
        i++;
    }
    if (input[i] == '\0' && top == -1)
        printf("The string is accepted.\n");
    else
        printf("The string is not accepted.\n");

    return 0;
}
