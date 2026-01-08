// Write a c program to execute the ptoram and analyze the output; what changes will in your output when you remove last two line (pthread_join), if any change, give reason.
#include<stdio.h>
#include<pthread.h>

//thread function definition
void *threadFunction(void *args)
{
	while(1){
		printf("I am Thread Function.\n");
	}
}

int main()
{
	//create thread id
	pthread_t id;
	int ret;
	//create thread
	ret=pthread_create(&id, NULL, &threadFunction, NULL);
	if(ret==0)
	{
		printf("Thread created successfully.\n");
	}
	else{
		printf("Thread not created.\n");
	}
	while(1){
		printf("I am main Function.\n");
	}
	return 0;
}






























































































































