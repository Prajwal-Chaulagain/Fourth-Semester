// Write a c Program to create a process using fork and print process id. 
#include<stdio.h>
#include<unistd.h>
#include<sys/wait.h>
int main()
{
	pid_t pid;
	pid=fork();
	if(pid<0){
		printf("Fork failed");
		return 1;
	} else if(pid==0){
		printf("Child process: PID = %d\n", getpid());
		printf("Child process: My parent's PID = %d\n", getppid());
	} else {
		printf("Parent process: PID = %d\n", getpid());
		printf("Parent process: My child's PID = %d\n", pid);
		wait(NULL);//wait child process to terminate
		printf("Parent process: Child process terminated.\n");
	}
	return 0;
}
