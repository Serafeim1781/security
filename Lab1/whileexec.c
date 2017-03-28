#include <stdio.h>
#include <unistd.h>

void main(){
	int i=0;
	
	while(1) {
		if(fork())
			execve("./stack",NULL,NULL);
		printf("%d",i++);
		wait(NULL);
	}
}
