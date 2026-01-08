// Write a c program for simple implementation of thread.
#include<stdio.h>
#include<pthread.h>

void *myThreadFunction(void *arg)
{
	int *val = (int *)arg;
	printf("Hello from the thread!. Value received: %d.\n", *val);
	return NULL;
}

int main()
{
	pthread_t thread;
	int value=42;
	//create a new thread
	if(pthread_create(&thread, NULL, myThreadFunction, &value) !=0)
	{
		perror("Failed to create thread.\n");
		return 1;
	}
	//wait for the thread to finish
	if(pthread_join(thread, NULL)!=0)
	{
		perror("Failed to join thread.\n");
		return 1;
	}
	printf("Thread has finished execution.\n");
	return 0;
}