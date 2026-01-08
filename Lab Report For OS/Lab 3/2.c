// Write a c Program t0 create a process using system call.
#include<stdio.h>
#include<stdlib.h>

int main(){
	int return_value;
	return_value=system("ls -al");
	return return_value;
}