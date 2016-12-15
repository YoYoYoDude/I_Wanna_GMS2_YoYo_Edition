/// @description Handle player movement

// Check left/right button presses
var L = (scrButtonCheck(global.leftButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.leftButton)));
var R = (scrButtonCheck(global.rightButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.rightButton)));

var h = 0; //Keeps track if the player is moving left/right

if (!frozen) { // Don't move if frozen
    if (R)
        h = 1;
    else if (L)
        h = -1;
}

// Check if on a slip block
var slipBlockTouching = instance_place(x,y+(global.grav),objSlipBlock);

// Vine checks
var notOnBlock = (place_free(x,y+(global.grav)));
var onVineR = (place_meeting(x+1,y,objWalljumpR) && notOnBlock);
var onVineL = (place_meeting(x-1,y,objWalljumpL) && notOnBlock);

if (h != 0) { // Player is moving
	//TODO: add vine check back here?
	xScale = h; // Set the direction the player is facing
	
	if ((h == -1 && !onVineR) || (h == 1 && !onVineL)) { // Make sure we're not moving off a vine (that's handled later)
	    if (slipBlockTouching == noone) { // Not touching a slip block, move immediately at full speed
	        hspeed = maxHSpeed * h;
	    } else { // Touching a slip block, use acceleration
			hspeed += (slipBlockTouching.slip) * h;
		
			if (abs(hspeed) > maxHSpeed)
				hspeed = maxHSpeed * h;
	    }
	}
	
    sprite_index = sprPlayerRun;
} else { // Player is not moving
    if (slipBlockTouching == noone) { // Not touching a slip block, stop immediately
        hspeed = 0;
    } else { // Touching a slip block, slow down
        if (hspeed > 0) {
            hspeed -= slipBlockTouching.slip;
            
            if (hspeed <= 0)
                hspeed = 0;
        } else if (hspeed < 0) {
            hspeed += slipBlockTouching.slip;
            
            if (hspeed >= 0)
                hspeed = 0;
        }
    }
  
    sprite_index = sprPlayerIdle;
}

// Check if standing on a platform
if (!onPlatform) {
    if ((vspeed * global.grav) < -0.05)
		sprite_index = sprPlayerJump;
    else if ((vspeed * global.grav) > 0.05)
		sprite_index = sprPlayerFall;
} else {
	//TODO: change this to y+1?
	//TODO: check if onPlatform even works correctly and is needed
    if (!place_meeting(x,y+(4*global.grav),objPlatform))
		onPlatform = false;
}

// Check if on a slide block
var slideBlockTouching = instance_place(x,y+(global.grav),objSlideBlock);

if (slideBlockTouching != noone) // On a slide block, start moving with it
    hspeed += slideBlockTouching.slide;

// Check if moving faster vertically than max speed
if (abs(vspeed) > maxVSpeed)
	vspeed = sign(vspeed) * maxVSpeed;

// Check buttons for player actions
if (!frozen) { // Check if frozen before doing anything
    if (scrButtonCheckPressed(global.jumpButton))
        scrPlayerJump();
    if (scrButtonCheckReleased(global.jumpButton))
        scrPlayerVJump();
    if (scrButtonCheckPressed(global.shootButton))
        scrPlayerShoot();
    if (scrButtonCheckPressed(global.suicideButton))
        scrKillPlayer();
}

// A/D align
if (global.adAlign && place_meeting(x,y+(global.grav),objBlock) && !frozen) {
    if (scrButtonCheckPressed(global.alignLeftButton))
		hspeed -= 1;
    if (scrButtonCheckPressed(global.alignRightButton))
		hspeed += 1;
}

// Handle walljumps
if (onVineL || onVineR) {
    if (onVineR)
        xScale = -1;
    else
        xScale = 1;
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSlide;
    
    // Check if moving away from the vine
	if (onVineL && scrButtonCheckPressed(global.rightButton)) || (onVineR && scrButtonCheckPressed(global.leftButton)) {
        if (scrButtonCheck(global.jumpButton)) { // Jumping off vine
            if (onVineR)
                hspeed = -15;
            else
                hspeed = 15;
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = sprPlayerJump;
        } else { // Moving off vine
			if (onVineR)
                hspeed = -3;
            else
                hspeed = 3;
            
            sprite_index = sprPlayerFall;
        }
    }
}


// Handle slopes
if (instance_exists(objSlope) && hspeed != 0) { // Make sure slopes exist in the current room and the player is moving horitontally before doing checks
    var moveLimit = abs(hspeed); // Sets how far the player can go up/down to snap onto a slope, this can be increased to make the player able to run over steeper slopes (ie setting it to abs(hspeed)*2 allows the player to run over slopes twice as steep)
    
    var slopeCheck; // Keeps track of whether we're still checking the current slope loop
    var hTest; // Keeps track of how far horizontally we're currently checking
    var vTest; // Keeps track of how far vertically we're currently checking
    
    // Check for falling onto a slope
    if (place_meeting(x+hspeed,y+vspeed+gravity,objSlope) && (vspeed+gravity)*global.grav > 0 && notOnBlock) {
        // Store previous coordinates in case snapping onto the slope fails
		var xLast = x;
        var yLast = y;
        var hLast = hspeed;
        var vLast = vspeed;
		
		vspeed += gravity; // Apply gravity to current vspeed to check where the player will be
        
        x += hspeed; // Move the player to the next position horizontally
        hspeed = 0;
        
		// Snap the player to any solids in the way
        if (!place_free(x,y+vspeed)) {
            if (global.grav == 1)
                move_contact_solid(270,abs(vspeed));
            else
                move_contact_solid(90,abs(vspeed));
            vspeed = 0;
        }
        
        y += vspeed; // Move the player to the next position vertically
        
        if (!place_free(x,y+(global.grav)) && place_free(x,y)) { // Check if we snapped onto the slope properly
            djump = 1;
            notOnBlock = false;
        } else { // Did not snap onto the slope, return to previous position
            x = xLast;
            y = yLast;
            hspeed = hLast;
            vspeed = vLast;
        }
    }
    
    // Check for moving down a slope
    if (!notOnBlock) {
        var onSlope = (place_meeting(x,y+(global.grav),objSlope)); // Check if we're standing on slope, treat normal blocks the same as slopes if we are
        
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck) {
            vTest = 0;
            // Check how far we should move down for this check
            while ((!place_meeting(x+hTest,y-vTest+(global.grav),objSlope) || (onSlope && !place_meeting(x+hTest,y-vTest+(global.grav),objBlock))) && (vTest*global.grav > -floor(moveLimit*(hTest/hspeed)))) {
                vTest -= global.grav;
            }
            
            // Check if we there's a slope close enough to fall down onto
            if (place_meeting(x+hTest,y-vTest+(global.grav),objSlope) || (onSlope && place_meeting(x+hTest,y-vTest+(global.grav),objBlock))) {
                if (vTest != 0 && !place_meeting(x+hTest,y-vTest,objBlock)) { // Check if we are moving and not stuck in any blocks
                    y -= vTest;
                    
                    x += hTest;
                    hspeed = 0;
                    
                    slopeCheck = false;
                } else { // Did not snap onto the slope, lower horizontal movement and check again
                    if (hTest > 0) {
                        hTest -= 1;
                        if (hTest <= 0)
                            slopeCheck = false;
                    } else if (hTest < 0) {
                        hTest += 1;
                        if (hTest >= 0)
                            slopeCheck = false;
                    } else {
                        slopeCheck = false;
                    }
                }
            } else { //Not close enough to any slopes, cancel check
                slopeCheck = false;
            }
        }
    }
    
    // Check for moving up a slope
    if (place_meeting(x+hspeed,y,objSlope)) {
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck) {
            vTest = 0;
            
            // Check how far we have to move up for this check
            while (place_meeting(x+hTest,y-vTest,objSlope) && vTest*global.grav < floor(moveLimit*(hTest/hspeed))) {
                vTest += global.grav;
            }
            
            // Check if we can move without hitting any solids
            if (place_free(x+hTest,y-vTest)) {
                y -= vTest;
                
                x += hTest;
                hspeed = 0;
                
                slopeCheck = false;
            } else { // Something is in the way, lower horizontal movement and check again
                if (hTest > 0) {
                    hTest -= 1;
                    if (hTest <= 0)
                        slopeCheck = false;
                } else if (hTest < 0) {
                    hTest += 1;
                    if (hTest >= 0)
                        slopeCheck = false;
                } else {
                    slopeCheck = false;
                }
            }
        }
    }
    
    // Set the xprevious/yprevious coordinates to the current x/y for future solid collisions
    xprevious = x;
    yprevious = y;
}