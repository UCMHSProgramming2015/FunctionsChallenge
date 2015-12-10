# Name: Visual BlurAImage Function

## Examples:
```
void BlurAImage(float blurintensity){
  PImage vacation;
  vacation = loadImage("vacation spot.jpg");
  image(vacation,0,0,width,height);
  filter(BLUR,blurintensity);
```

## Description:
Allow user to change blur intensity of an image and blur image.

## Syntax:
BlurAImage(blurintensity);

##Parameters: 
value of intensity of blur; the larger the value, the blurrier the image is.

##Returns:
void

##Other notes:

