//name variables
PImage art;
PImage art1;
PImage art2;
PImage art3;
PImage art4;
PImage art5;
PImage art6;
PImage cursor;
float A;
float a;
float mode;

//set canvas and mode and load images
void setup(){
  size(600,600);
  art = loadImage("art.jpg");
  art1 = loadImage("art1.jpg");
  art2 = loadImage("art2.jpg");
  art3 = loadImage("art3.jpg");
  art4 = loadImage("art4.jpg");
  art5 = loadImage("art5.jpg");
  art6 = loadImage("art6.jpg");
  cursor = loadImage("cursor.png");
  mode = 0;
}

void draw(){
  //change background according to mode
  setBackground();
  
  //make special cursor
  drawCursor();
  
  //set text preference
  textSize(40);
  textAlign(CENTER, CENTER);
  
  //calculate area of a circle
  A = areaOfCircle();
  text("Area of circle =" + A, 300, 150);

  //calculate acceleration
  a = kinematicAcceleration();
  text("Acceleration =" + a, 300, 300);
  
  //give user option to change background
  text("Not your aesthetic?", 300, 450);
  text("Click to change background!", 300, 500);
}
  
//enter values to be calculated
float areaOfCircle(){
  float r= 6;
  float A= PI*sq(r);
  return A;
}
  
float kinematicAcceleration(){
  float v0 = 0;
  float vf = 5;
  float t = 10;
  float a = (vf - v0)/t;
  return a;
}

//change mode when key pressed
void mouseClicked(){
  if (mode == 0){
    mode = 1;
    setBackground();
  }
  else if (mode == 1){
    mode = 2;
    setBackground();
  }
  else if (mode == 2){
   mode = 3;
   setBackground();
  }
  else if (mode == 3){
   mode = 4;
   setBackground();
  }
  else if (mode == 4){
   mode = 5;
   setBackground();
  }
  else if (mode == 5){
   mode = 6;
   setBackground();
  }
  else if (mode == 6){
   mode = 0;
   setBackground();
  }
}

//change background with mode
void setBackground(){
  if (mode == 0){
    background(art);
  }
  if (mode == 1){
    background(art1);
  }
  if (mode == 2){
   background(art2);
  }
  if (mode == 3){
   background(art3);
  }
  if (mode == 4){
   background(art4);
  }
  if (mode == 5){
   background(art5);
  }
  if (mode == 6){
   background(art6);
  }
}

//draw cursor by mouse
void drawCursor(){
  cursor.resize(50,50);
  image(cursor, mouseX-25, mouseY-25);
}