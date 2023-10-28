//Local variables needed to make the platform engine work right
xspd = 0; //How fast we move along the x-axis
yspd = 0; //How fast we move along the y-axis
grnd = false; //Are we on the ground?
grav = 0.70; //The force of gravity
maxYspd = 20; //How fast we keep falling
maxXspd = 4; //How fast we can run 4
normAccel = 1; //Acceleration when not affected by terrain .2
normDecel = 1; //Deceleration .35 "                           "
iceAccel = .1; //Acceleration when affected by Ice .078
iceDecel = .1; //Deceleration "                  " .071
canWallJump = 0; //Is it alright to wall jump?
wallJumpXSpd = 6; //How fast do we bounce off the wall on the x-axis
wallJumpYSpd = 7; //Same except for y-axis
accel = normAccel; //Set up our acceleration
decel = normDecel; //Set up decel
canclimb = 5; //Set how up can us player climb
