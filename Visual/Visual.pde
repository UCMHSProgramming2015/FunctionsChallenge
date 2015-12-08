PVector loc, vel, acc;
PImage bg, wanderer;

void setup(){
    //set size of canvas
  size(800, 600);
  //initialize variables
  loc = new PVector(width/2, height/2);
  vel = new PVector(0,0);
  colorMode(HSB, 800, 600, 100);
}

void draw(){
  wanderer();
}

void wanderer(){ //reuse code from wanderer
  background(0);
  acc = PVector.random2D();  
  acc.mult(0.9);
  
  //draw ball
  ellipse(loc.x, loc.y, 25, 25);
  
  //fill with color
  fill(loc.x, loc.y, 100);
  
  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;
  vel.x += acc.x;
  vel.y += acc.y;
  
  //wrap the ball's position
  if (loc.x  >= width) {
    vel.x = -abs(vel.x);     
  } else if (loc.x <= 0) {
    vel.x = abs(vel.x);
  }
  if (loc.y >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y <= 0) {
    vel.y = abs(vel.y);
  }
  
}