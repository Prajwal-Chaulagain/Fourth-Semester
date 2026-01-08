// Write a c Program  to create a Process using Fork.
#include<stdio.h>
#include<unistd.h>

int main()
{
	printf("Childl process creation initiated....\n");
	fork();
	fork();
	fork();
	printf("Child process created....\n");
	return 0;
}