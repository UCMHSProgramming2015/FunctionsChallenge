//define and declare vectors of points of surface line
PVector p1 = new PVector(-100, -100);
PVector p2 = new PVector(-100, -100);

//define and declare vectors for position, velocity, and acceleration
PVector pos = new PVector(0, 0);
PVector vel = new PVector(0, 0);
PVector acc = new PVector(0, 0);

//define and declare booleans for whether the surface is defined or not and whether the object is on the ramp or not
boolean surface = false;
boolean onRamp = true;

//define and declare speed of replay and initial stroke color
float time = 0.01;
float str = 255;

//define and declare spring variables: whether it is activated, the distance it is stretched (m), inital length of spring (m), actual length of spring(m), and the spring constant (N/m)
boolean spring;
float x = 0;
float l0 = 100;
float l = l0;
float k = 100000;

//define and declare mass (kg), density (kg/m^3), diameter (based on the mass and density based on the volume of a sphere, m), gravitational acceleration (m/s^2), and work (J)
float m = 1000;
float dens = 0.3;
float diam = 2*pow(3*m/(4*dens*PI), 0.333333333333333);
float g = 9.8;
float w = 0;

//define and declare the coefficients of restitution and kinetic friction and the kinetic friction force
float coRest = 0.9;
float coKFric = 0.01;
float kFric = 0;

void setup() {
  //set size, fill color, and stroke weight
  size(500, 500);
  fill(255);
  strokeWeight(1);
}

//define function y to return y coordinate of a line including points (x1,y1) and (x2, y2) where x runs right and y runs down
float y(float x1, float y1, float x2, float y2, float xPos) {
  return y1+(y2-y1)/(x2-x1)*(xPos-x1);
}

//define function angle to return the angle that the line including points (x1,y1) and (x2,y2) deviates from the horizontal
float angle(float x1, float y1, float x2, float y2) {
  return atan((y2-y1)/(x2-x1));
}

//define function for work
float work(float kinetic_friction, float xPos, float yPos, float xPos0, float yPos0) {
  return -kinetic_friction*dist(xPos0, yPos0, xPos, yPos);
}

void mouseClicked() {
  //define 2 points of the line of a surface if not defined
  if (surface == false) {
    if (p1.x == -100) {
      p1.set(mouseX, mouseY);
    } else {
      if (mouseX != p1.x && (mouseY-p1.y)/(mouseX-p1.x) > 0) {
        p2.set(mouseX, mouseY);
        pos.set(diam/2, y(p1.x, p1.y, p2.x, p2.y, diam/2));
        surface = true;

        //create a velocity based on the acceleration to make sure vel.x/abs(vel.x) is not undefined
        acc.set(g*time*sin(angle(p1.x, p1.y, p2.x, p2.y))*cos(angle(p1.x, p1.y, p2.x, p2.y)), g*time*sq(sin(angle(p1.x, p1.y, p2.x, p2.y))));
        vel.add(acc);
      }
    }
  }
}

void keyPressed() {
  //redefine surface, ramp, points, stroke color, and velocity if backspace is pressed
  if (key == BACKSPACE) {
    surface = false;
    onRamp = true;
    str = 255;
    p1.set(-100, -100);
    p2.set(-100, -100);
    vel.set(0, 0);
    spring = false;
    w = 0;
  }

  //remove ramp if 0 is pressed
  if (key == '0') {
    onRamp = false;
  }

  //activate or deactivate spring
  if (key == 's' && surface == true && y(p1.x, p1.y, p2.x, p2.y, width) <= height) {
    if (spring == false && pos.x < width-(l+diam/2)*cos(angle(p1.x, p1.y, p2.x, p2.y))) {
      spring = true;
    } else {
      spring = false;
    }
  }
}

void draw() {
  //set background to 0
  fill(0, 64);
  rect(-1, -1, width+2, height+2);

  fill(255);

  if (surface == false) {
    //write "Set Surface" in the center
    textAlign(CENTER);
    textSize(20);
    text("Set Surface", width/2, height/2);
    stroke(255);

    //indicate point1 with line
    if (p1.x != -100 && p2.x == -100) {
      line(0, p1.y, width, p1.y);
    }
  } else {
    //write instructions to redraw the surface
    textAlign(RIGHT);
    textSize(10);
    text("Press BACKSPACE to redraw surface", width-10, 20);
    text("Press '0' to turn off the ramp", width-10, 40);
    text("Press 's' to activate or deactivate a spring", width-10, 60);
    fill(128);
    textSize(8);
    text(" (spring constant " + round(k/1000) + " kN/m, initial length " + round(l0) + " m)", width-10, 76);

    if (onRamp == false) {
      //fade the ramp
      str -= 3;
    }
    stroke(255, str);

    //draw the ramp
    line(0, y(p1.x, p1.y, p2.x, p2.y, 0), width, y(p1.x, p1.y, p2.x, p2.y, width));

    //draw the ball
    fill(255);
    ellipse(pos.x+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2, pos.y-diam*cos(angle(p1.x, p1.y, p2.x, p2.y))/2, diam, diam);

    //if the object is still on the ramp, bounce the object off the wall along the ramp
    if (onRamp == true) {
      if (pos.x+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2+diam/2 >= width || pos.x+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2-diam/2 <= 0 && onRamp == true) {
        pos.sub(vel);
        vel.mult(-coRest);
      }

      //if the spring is activated and compressed, sets distance from equilibrium
      if (spring == true && pos.x >= width-(l0+diam/2)*cos(angle(p1.x, p1.y, p2.x, p2.y))) {
        x = dist(width-(l0+diam/2)*cos(angle(p1.x, p1.y, p2.x, p2.y)), y(p1.x, p1.y, p2.x, p2.y, width)-(l0+diam/2)*sin(angle(p1.x, p1.y, p2.x, p2.y)), pos.x, pos.y);
        l = l0-x;
      } else {
        x = 0;
      }

      //draws spring
      if (spring == true) {
        for (float i = 0; i <= l; i += l/30) {
          stroke(255);
          noFill();
          ellipse(width-i*cos(angle(p1.x, p1.y, p2.x, p2.y))+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2, y(p1.x, p1.y, p2.x, p2.y, width)-i*sin(angle(p1.x, p1.y, p2.x, p2.y))-diam*cos(angle(p1.x, p1.y, p2.x, p2.y))/2, diam/2, diam/2);
        }
      }

      //set the acceleration based on gravity and the net force equation (normal force, gravity, friction, and optional spring force)
      acc.set(sin(angle(p1.x, p1.y, p2.x, p2.y))*cos(angle(p1.x, p1.y, p2.x, p2.y))-vel.x*coKFric*sq(cos(angle(p1.x, p1.y, p2.x, p2.y)))/abs(vel.x)-k*x*time*cos(angle(p1.x, p1.y, p2.x, p2.y))/m, sq(sin(angle(p1.x, p1.y, p2.x, p2.y)))-vel.y*coKFric*cos(angle(p1.x, p1.y, p2.x, p2.y))*sin(angle(p1.x, p1.y, p2.x, p2.y))/abs(vel.y)-k*x*time*sin(angle(p1.x, p1.y, p2.x, p2.y))/m);
      acc.mult(g*time);

      //bounce ball off the ground
      if (pos.y-diam*cos(angle(p1.x, p1.y, p2.x, p2.y))/2+diam/2 >= height) {
        pos.sub(vel);
        vel.y *= -coRest;

        //set the ball as off the ramp
        onRamp = false;

        //set the acceleration as friction in the x direction and g in the y direction
        acc.set(-coKFric*g*time*vel.x/abs(vel.x), g*time);
      }
    } else {
      //bounce ball off the wall when the ball is not against the ramp
      if (pos.x+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2+diam/2 >= width || pos.x+diam*sin(angle(p1.x, p1.y, p2.x, p2.y))/2-diam/2 <= 0) {
        pos.sub(vel);
        vel.x *= -coRest;
      }

      //bounce ball off the ground
      if (pos.y-diam*cos(angle(p1.x, p1.y, p2.x, p2.y))/2+diam/2 >= height) {
        pos.sub(vel);
        vel.y *= -coRest;

        //set the acceleration as friction in the x direction and g in the y direction
        acc.set(-coKFric*g*time*vel.x/abs(vel.x), g*time);
      } else {
        //set the g in the y direction
        acc.set(0, g*time);
      }
    }

    //add acceleration to velocity, add velocity to position
    vel.add(acc);
    pos.add(vel);

    //add work done by kinetic friction if the object moves a significance distance
    if (onRamp == true) {
      kFric = m*coKFric*g*cos(angle(p1.x, p1.y, p2.x, p2.y));
      if (abs(dist(pos.x-vel.x, pos.y-vel.y, pos.x, pos.y)) >= 1) {
        w += work(kFric, pos.x, pos.y, pos.x-vel.x, pos.y-vel.y);
      }
    } else if (pos.y-diam*cos(angle(p1.x, p1.y, p2.x, p2.y))/2+diam/2 >= height) {
      kFric = m*coKFric*g;
      if (abs(dist(pos.x-vel.x, pos.y-vel.y, pos.x, pos.y)) >= 1) {
        w += work(kFric, pos.x, pos.y, pos.x-vel.x, pos.y-vel.y);
      }
    }
  }

  //print work
  println("Work by Kinetic Friction: " + round(w/1000000) + " MJ,     " + round(w/1000) + " kJ,     " + round(w) + " J");
}