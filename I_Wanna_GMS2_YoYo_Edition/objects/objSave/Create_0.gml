/// @description Initialize variables

canSave = true; // Sets whether the player can currently use this save
grav = 1; // Sets which way the gravity has to be for this save to work

// Destroy self if currently on a higher difficulty than hard
if (global.difficulty > 1)
    instance_destroy();