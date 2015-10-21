// Question 6 of Midterm

#include <stdio.h>

main() {

  int num = 1;
  int max = 1000;
  int sum = 0;


  while (num <= max) {
      sum = sum + num;
      num = num+1;
  }   
  printf("Sum of integers 1-1000 = %d\n", sum);

}
