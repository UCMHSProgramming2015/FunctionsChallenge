# Name: 
Moving Circle

## Examples:
PVector loc;
PVector vel;

void setup(){
  loc= new PVector(width/2, height/2);
  vel = new PVector(5, 5);
}

void draw(){
  MovingCircle();
}


## Description:
Creates ellipse that bounces around the screen

## Syntax:
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

##Parameters: 
loc.x = x position
loc.y = y position
vel.x = x component of velocity
vel.y = y component of velocity

##Returns:
Returns no data

##Other notes:
None
