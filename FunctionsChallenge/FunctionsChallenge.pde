
void setup() {
  size(800, 600);
  textAlign(CENTER);
  textSize(16);
}

void draw() {
  background(0);

  //solveQuadratic() test
  text(solveQuadratic(9, 0, -2, true), width/2, 400);  //solution example
  text(solveQuadratic(9, 0, -2, false), width/2, 450);  //solution example

  text(solveQuadratic(10, 3, 5, true), width/2, 500);  //no solution example
  text(solveQuadratic(10, 3, 5, false), width/2, 550);  //no solution example

  println(solveQuadratic(1, 2, -3, true));  //no solution example

  //work test
  text(solveWork(3.74, 5.68, 0), width/2, 300);  

  //shapes test
  shapes(60, 80, 0, 255);  //draw heart
  shapes(mouseX, mouseY, 1, 200);  //draw star
  shapes(400, 100, 2, 100);  //draw flower
}


float solveQuadratic(float a, float b, float c, boolean plus) {
  float x;
  float fourAC;
  //negative b plus-minus the square root of b-squared minus 4ac over 2a

  fourAC = 4*a*c;

  if (plus) {
    x = (-b + sqrt(sq(b) - fourAC)) / (2*a);  //the addition of the plus-minus sign
  } else {
    x = (-b - sqrt(sq(b) - fourAC)) / (2*a);  //the subtraction of the plus-minus sign
  }

  if (fourAC > sq(b)) {
    println("The squares mean that this has no solution.");
  }

  return x;
}


float solveWork(float force, float dist, float theta) {
  float work;
  float angle = cos(theta);
  work = force*dist*angle;
  return work;
}


void shapes(float x, float y, int typeOfShape, color c) {
  //draw a heart
  if (typeOfShape == 0) {
    noStroke();
    fill(c);
    ellipse(x, y, 30, 30);
    ellipse(x + 29, y, 30, 30);
    triangle(x - 15, y + 5, x + 15, y + 40, x + 44, y + 5);
  }

  //draw a star
  if (typeOfShape == 1) {
    noStroke();
    triangle(x - 15, y + 20, x, y, x + 15, y + 20);
    triangle(x - 15, y + 5, x, y + 25, x + 15, y + 5);
  }

  //draw a flower
  if (typeOfShape == 2) {
    float sz = 40;
    noStroke();

    ellipse(x, y, sz, sz);

    ellipse(x + 30, y, sz/2, sz/2);
    ellipse(x - 30, y, sz/2, sz/2);

    ellipse(x, y + 30, sz/2, sz/2);
    ellipse(x, y - 30, sz/2, sz/2);

    ellipse(x + 20, y + 20, sz/2, sz/2);
    ellipse(x + 20, y - 20, sz/2, sz/2);
    ellipse(x - 20, y + 20, sz/2, sz/2);
    ellipse(x - 20, y - 20, sz/2, sz/2);
  }
}