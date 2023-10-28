///platform_id, ground_id, ice_id
colLine = collision_rectangle(x-sprite_width/2+1,y+sprite_height/2,x+sprite_width/2-1,y+(sprite_height/2)+ceil(yspd),argument0,1,1);
i = 0;
while(i < ceil(abs(xspd))) { //Check collisions relative to the speed of the player
    //This checks if the player should move down slopes
    if (grnd && !place_meeting(x+sign(xspd),y,argument1) && !place_meeting(x+sign(xspd),y+1,argument1) && place_meeting(x,y+1,argument1)) {
        x += sign(xspd);
        y += 1;
    } else if (place_meeting(x+sign(xspd),y,argument1) && !place_meeting(x+sign(xspd),y-canclimb ,argument1)) { //If there's an upward slope, move up
        x += sign(xspd);
        y -= canclimb ;
    } else if (place_meeting(x+sign(xspd),y,argument1) && place_meeting(x+sign(xspd),y-canclimb ,argument1)) { //If there aren't any slopes, and the wall object is in front of us, stop moving
        xspd = 0;
    } else { //Otherwise, just move horizontally
        x += sign(xspd);
    }
    i += 1;
}
j = 0;
while(j < ceil(abs(yspd))) {
    //Checks to see if our Jumpthrough box hit a platform
    if (colLine && yspd > 0) {
        yspd = 0; //Stop falling
        if (y < colLine.y + sprite_height/2) { //This checks if the player needs to be realigned after a collision with the jumpthrough platform
            y = colLine.y - (sprite_height/2)
        }
    } else
    //Simple enough. If there's no ground beneath the player, fall.
    if (!place_meeting(x,y+sign(yspd),argument1)) {
            y += sign(yspd);
    } else
    //If there's a jumpthrough platform or a regular block, stop fallin
    if (place_meeting(x,y+sign(yspd),argument1) || (yspd >= 0 && colLine > 0)) {
        yspd = 0;
    } else { //Otherwise, fall.
        y += sign(yspd);
    }
    j += 1;
}
//Just checkin to see if we're on the ground
if (place_meeting(x,y+1,argument1) || (colLine && yspd == 0)) {
    grnd = true;
} else { //And if we're not, increase the yspeed by our gravity variable
    grnd = false;
    if (yspd < maxYspd) {
        yspd += grav;
    }
}
//Check for ice below the player and change the accel and decel values accordingly
if (place_meeting(x,y+1,argument2)) {
    accel = iceAccel;
    decel = iceDecel;
} else {
    accel = normAccel;
    decel = normDecel;
}

