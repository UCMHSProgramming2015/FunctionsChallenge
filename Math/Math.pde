float value = PI/2; //set value of trig function to calculate in radians


void setup(){
  textAlign(CENTER, BOTTOM);
  size(800,600);
  background(0);
}

void draw(){

  //store result of trig function
  float[] result = trig(value);
  
  //Display trig functions
  text("Value: " + value, width/2, 50);
  text("Sine: " + result[0], width/2, 100);
  text("Cosine: " + result[1], width/2, 150);
  text("Tangent: " + result[2], width/2, 200);
  text("Arc Sine: " + result[3], width/2, 250);
  text("Arc Cosine: " + result[4], width/2, 300);
  text("Arc Tangent: " + result[5], width/2, 350);  
  
}

float[] trig(float value){
  float[] result = new float[6];
  result[0] = sin(value);
  result[1] = cos(value);
  result[2] = tan(value);
  result[3] = acos(value);
  result[4] = asin(value);
  result[5] = atan(value);
  return result;
}