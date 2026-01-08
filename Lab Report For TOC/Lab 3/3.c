// Write a C program to implement an NFA over {0,1} that accepts string having 01 as sub string.
#include <stdio.h>
// Function to simulate the NFA
int simulateNFA(char *input) 
{
    int currentState = 0;
    int i = 0;
    while (input[i] != '\0') 
    {
        char inputSymbol = input[i];
        switch (currentState) 
        {
            case 0:
                if (inputSymbol == '0') 
                {
                    currentState = 1;
                }
                break;
            case 1:
                if (inputSymbol == '1') 
                {
                    currentState = 2;
                } 
                else if (inputSymbol == '0') 
                {
                    currentState = 1;
                } 
                else 
                {
                    currentState = 0;
                }
                break;
            case 2:
                break;
        }
        i++;
    }
    if (currentState == 2) 
    {
        printf("String accepted\n");
        return 1;
    } 
    else 
    {
        printf("String rejected\n");
        return 0;
    }
}
// Main function
int main() 
{
    char input[100];
    printf("Enter input string: ");
    scanf("%s", input);
    simulateNFA(input);
    return 0;
}
