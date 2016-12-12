/// @description Destroy self if the current difficulty is too high

if (global.difficulty > maxDifficulty)
    instance_destroy();