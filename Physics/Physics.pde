float vo = 5;
float a = 2;
float d = 2;
float vf;

void setup(){
  background(0);
  size(800,600);
  textAlign(CENTER, BOTTOM);
}

void draw(){
 vf = kinematic(vo, a, d);
 text("Kinematic Equation Solver", width/2, 50);
 text("Use when Vo, a, and d are given and Vf needs to be calculated", width/2, 100);
 text("Initial velocity (Vo): " + vo, width/2, 150);
 text("Acceleration (a): " + a, width/2, 200);
 text("Distance (d): " + d, width/2, 250);
 text("Calculated final velocity (vf): " + vf, width/2, 300);
}

float kinematic(float vo, float a, float d){
  float vf = sqrt(sq(vo) + 2*a*d);
  return vf;
}