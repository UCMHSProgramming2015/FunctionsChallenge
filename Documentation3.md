# Name: 
drawCursor();

## Examples:
void drawCursor(){ 
   cursor.resize(50,50); 
   image(cursor, mouseX-25, mouseY-25); 
 } 

## Description:
Use an image as a second cursor

## Syntax:
void drawCursor(){ 
  image(cursor, mouseX-i, mouseY-j); 
  } 

##Parameters: 
cursor is name of image;
i is half of image's width;
j is half of image's height;

##Returns:
void
