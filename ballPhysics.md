# Name: ballPhysics

## Examples:
for(int i = 0; i < num; i++){
	ballPhysics(ball_pos[i], ball_vel[i]);
}

## Description:
Adds a small acceleration to the object to simulate gravity, some air resistance, and bounces the ball off of the
walls.Finally, velocity is added to position.

## Syntax:
void ballPhysics(pos, vel)

##Parameters: 
pos: PVector, The position of the ball to be modified.
vel: PVector, The velocity of the ball to be modified.

##Returns:
This function does not return a value.
