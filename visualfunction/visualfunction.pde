
void draw(){
  BlurAImage(2); 
}

void BlurAImage(float blurintensity){  //declare function and variables
  PImage vacation;    
  vacation = loadImage("vacation spot.jpg");   //load image
  image(vacation,0,0,width,height);            //size and position of image
  filter(BLUR,blurintensity);                  //filter blur image
}

  