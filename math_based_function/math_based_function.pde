
void draw(){
  println(quadratic(1,6,9));      //print return value for x in quadratic equation
}

float []quadratic(float a, float b, float c){    //create function and array
  float [] x = new float [2];    //initialize
  x[0]=(-b + sqrt(sq(b)- 4*a*c))/(2*a);      //equation of the quadratic function
  x[1]=(-b - sqrt(sq(b)- 4*a*c))/(2*a);
  return x;    //return value
}


  