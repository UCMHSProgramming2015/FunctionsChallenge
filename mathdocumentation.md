# Name: Math Quadratic Equation Function

## Examples:
```
float []quadratic(float a, float b, float c){    //declare function and variables
  float [] x = new float [2];
  x[0]=(-b + sqrt(sq(b)- 4*a*c))/(2*a);      
  x[1]=(-b - sqrt(sq(b)- 4*a*c))/(2*a);
  return x;
}
```

## Description:
Calculates x by using the quadratic equation. This function expects the values of x to be any real whole number. If the solution for x if is a decimal, no solution would appear in the command line.

## Syntax:
quadratic(coefficients a, b, c)

##Parameters: 
coefficient values in the quadratic equation ax^2+bx+c

##Returns:
floats; numbers

##Other notes:
incorporated the use of arrays
