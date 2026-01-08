// Write a c program that have two threads, one reads a word from keywords and another checks for valid word ( you can use your own word list, at least 10, to check validity).
#include<stdio.h>
#include<pthread.h>
#include<string.h>
#include<unistd.h>

const char *valid_words[]={
	"apple", "banana", "grape", "orange", "melon", "kiwi", "mango", "lemon", "peach", "berry"
};

int is_valid_word(const char *word){
	for(int i=0;i<10;i++)
	{
		if(strcmp(word, valid_words[i])==0)
			return 1;
	}
	return 0;
}

//reader thread
char input[100];
void *readerThread(void *args)
{
	printf("Enter the word:");
	scanf("%s", input);
	sleep(1);//simulate delay
	return NULL;
}

//checker thread
void *checkerThread(void *args)
{
	if(is_valid_word(input))
		printf("VALID....\n");
	else
		printf("INVALID....\n");
	return NULL;
}

int main(){
	pthread_t reader, checker;
	pthread_create(&reader, NULL, readerThread, NULL);
	pthread_join(reader, NULL);
	pthread_create(&checker, NULL, checkerThread, NULL);
	pthread_join(checker,NULL);
	return 0;
}
