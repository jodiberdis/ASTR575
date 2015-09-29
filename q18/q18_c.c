// Question 18 code for C language

#include <stdio.h>

int recurse = 0;
int result = 0;
int n = 0;


  int factorial(int n) {
      if (n == 0)
          return 1;
      else {
          recurse = factorial(n-1);
          result = n * recurse;
          return result;
      }
  }

main() {

  int var = 1;
  int maxvar = 100;
  int fac_maxvar = 20;
  int sumfac = 0;
  int facvar = 0;
  int count = 0


  while (var <= maxvar) {
      if (var < fac_maxvar) {
          facvar = factorial(var);
          printf("factorial of %d is: %d\n", var, facvar);
          sumfac = sumfac+facvar;
      }
      count = count+1;
      var = (2*var)+1;
      printf("variable: %d\n", var);
  }   
  printf("number of iterations = %d\n", count);
  printf("sum of factorials: %d\n", sumfac);

}
