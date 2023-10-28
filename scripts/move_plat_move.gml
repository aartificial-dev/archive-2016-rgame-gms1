///left_or_right, up_or_down, can_wall_jump
if (argument0 = 1) {

    if (xspd < maxXspd) {
        xspd += accel;
    }
    sprDir = 1;
    //Give our player the ability to wall jump
   if(collision_rectangle(x+(sprite_width/2)+1,y-sprite_height/2,x+(sprite_width/2)+1,y+sprite_height/2,Obj_BlocksParent,false,false)) {
        canWallJump = -1;
    } else {
        canWallJump = 0;
    }
}

if (argument0 = -1) {

    if (xspd > -maxXspd) {
        xspd -= accel;
    }
    sprDir = -1;
    if(collision_line(x-(sprite_width/2)-1,y-sprite_height/2,x-(sprite_width/2)-1,y+sprite_height/2,Obj_BlocksParent,false,false)) {
        canWallJump = 1;
    } else {
        canWallJump = 0;
    }
}



//If we aren't pressing the left and right keys, slow down
if (argument0 = 0) {
    if (xspd > 0) {
        xspd -= decel;
        if (xspd < 0) {
            xspd = 0;
        }
    } else {
        xspd += decel;
        if (xspd > 0) {
            xspd = 0;
        }
    }
}


///Jump
if (argument1 = 1){
if (grnd) {
    grnd = false;
    yspd = -7;
}
    //Only give our players the ability to wall jump if they aren't on the ground
    if (argument2 == 1) {
        if (canWallJump != 0){
        yspd = -wallJumpYSpd;
        xspd = wallJumpXSpd*canWallJump;
        canWallJump = 0;
    }
}
}
