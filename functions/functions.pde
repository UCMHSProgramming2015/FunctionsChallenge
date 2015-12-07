void setup() {
  size(100,100);
}

void draw() {
  float physicsResult = solveFinalVelocity(6,2,1); //declare variable and set it equal to result of function given parameters
  println(physicsResult); //print out result

  float[] quadraticResult = quadraticEquation(10, 1, 100);
  println(quadraticResult[0] + " || " + quadraticResult[1]); //print out solutions
  
  displaySinMovement(); //call the function and display stuff
}

//physics function
float solveFinalVelocity(float a, float v0, float t) {
  float finalvelocity = v0 + a*t; //the result is set to the equation with the numbers as variables
  return finalvelocity;
}

//math function
float[] quadraticEquation(float a, float b, float c){
  float result1 = (-b+sqrt(sq(b)-4*a*c))/(2*a); //the result is set to the equation with the numbers as variables
  float result2 = (-b-sqrt(sq(b)-4*a*c))/(2*a); //the result is set to the equation with the numbers as variables, this time minu the sqrt
  float[] result = {result1, result2}; //set an array with two values
  return result; //return the array
}

void displaySinMovement() {
  float angleadd = radians(2)*frameCount; //for each framecount add more to the existing angle
  float angle[] = new float[3]; //declare global variable
  angle[0] = 0 + angleadd; //assign variables
  angle[1] = 80 + angleadd;
  angle[2] = 150 + angleadd;
  background(0); //set background to black
  for(int i = 0; i < angle.length; i++) { //for each ellipse
    ellipse(width/2, abs(80*sin(angle[i])), 10, 10); //display ellipse
  }
}