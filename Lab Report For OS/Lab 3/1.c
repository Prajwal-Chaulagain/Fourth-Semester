// Write a c Program to Print Process ID.
#include<stdio.h>
#include<unistd.h>

int main()
{
    pid_t pid;
    pid = getpid();
    printf("The process ID (PID) of this program is: %d\n", pid);
    return 0;
}