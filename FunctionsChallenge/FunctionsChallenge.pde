PVector loc;
PVector vel;

void setup(){
  size(800, 600);
  loc = new PVector(width/2, height/2);
  vel = new PVector(5, 5);
}

void draw(){
  background(0);
  MovingCircle();
  float d = Displacement(8, 2, -2);
  float m = Slope(400, 398, 1000, 300);
  fill(random(255), random(255), random(255));
  rect(d, height/2, 50, 50);
  ellipse(m, m, 50, 50);
  println(d);
  println(m);
 }

float Displacement(float vi, float t, float a){
  float d = (vi*t)+(0.5*a*sq(t));
  return d;
}

float Slope(float x2, float x1, float y2, float y1){
  float m = (y2-y1)/(x2-x1);
  return m;
}

void MovingCircle(){
  ellipse(loc.x, loc.y, 45, 45);
  loc.add(vel);
  if (loc.x > width){
    vel.x = -vel.x;
  }
  if(loc.y > height){
    vel.y = -vel.y;
  }
  if (loc.x < 0){
    vel.x = -vel.x;
  }
  if (loc.y < 0){
    vel.y = -vel.y;
  }
}

   