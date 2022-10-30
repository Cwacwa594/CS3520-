/*
Author:			Rammalane Emmanuel MOloli
Stundent ID:	202002098
Email:			rammalanemololi@gmail.com
Contacts:		63121094/ 53159035
Date:			October 27 2022
Task:			Finding reversible prime squares
*/

#include <stdio.h>


// The function reverses the number
int reverse(int num){
	int  reverse = 0, remainder;						//Initalizing values
	while(num != 0)										// Terminal condition
	{
		remainder = num % 10;
		reverse = reverse * 10 + remainder;				// reverse is stored in reverse variable
		num = num / 10;									// Changing num by taking quotient of it divide by 10
	}
 	return reverse;
}

// The function determines prime numbers
int is_prime(int num)
{
	// For every number less than 2 the function returns 0
	if(num < 2)
	{
		return 0;
	}
	
	for(int i = 2; i < num; i++)
	{
		if(num % i == 0)								// Checking whether num has factors 
		{
			return 0;									// If num has a factor the function returns 0
		}
	}
	return 1;
}

// Finds and displays reversible prime squares
void reversible_prime_sqrs()
{
	// Number and conut are initialised to zero
	for(int number = 0, count = 0; count < 10; number++){

		if(is_prime(number) == 1)						// Determining whether the "number" is prime or not
		{
			int square = number*number;					// Squaring prime number
			int reversed = reverse(square);				// Reversing the square of a prime
			if(square != reversed)						// Checking for Palindrome
			{
				for(int i = 0; i < reversed/2; i++)
				{
					if(i*i == reversed)					// Determining a square
					{
						if(is_prime(i) == 1)			// Checking whether i is prime or not 
						{
							printf("\n%d",square);		// Printing the reversible prime squares
							count ++;					// Increamneting the counter
						}
					}
				}
			}
		}
	}
}

int main()
{
    reversible_prime_sqrs();
    
    return 1;
}
