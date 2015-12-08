PVector ball_pos[], ball_vel[];
float ball_width[];

int num = 10;

float radius = 10;

void setup(){
  size(640, 480);
  frameRate(60);
  colorMode(HSB, width);
  
  ball_pos = new PVector[num];
  ball_vel = new PVector[num];
  ball_width = new float[num];
  
  for(int i = 0; i < num; i++){
    ball_pos[i] = new PVector(0,0);
    ball_vel[i] = new PVector(i, 0);
    ball_width[i] = radius*2;
  }
}

void draw(){
  for(int i = 0; i < num; i++){
    ballPhysics(ball_pos[i], ball_vel[i]);
    ball_width[i] = ballMath(ball_pos[i]);
    ballDraw(ball_pos[i], ball_width[i]);
  }
}

void ballPhysics(PVector pos, PVector vel){
  //add a small amount of gravity
  vel.y += 0.98;

  //bounce ball if it hits walls
  if (pos.x + radius >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
    pos.x = width - radius;    
  } 
  else if (pos.x - radius <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    pos.x = radius;
  }
  if (pos.y + radius >= height) {
    vel.y = -abs(vel.y);
    pos.y = height - radius;
  }
  else if (pos.y - radius <= 0) {
    vel.y = abs(vel.y);
    pos.y = radius;
  }
  
  //small air resistance in the y direction
  vel.y *= 0.99;
  
  //add position to velocity
  pos.add(vel);
}

float ballMath(PVector pos){
  float wid = radius*3*sin(pos.y);
  
  if(wid < radius)
    wid = radius;

  return wid;
}

void ballDraw(PVector pos, float ball_width){
  //set a fill based on position
  fill(pos.x, pos.y, width);
  
  ellipse(pos.x, pos.y, radius*2, ball_width);
}