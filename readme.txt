Thank you for downloading I Wanna Be The GMS2 Engine YoYoYo Edition v0.9!
If you want to report bugs, request features, ask any questions, or check to make sure this is the most recent version, you can check my thread on the I Wanna Community forums here: http://bit.ly/GMS2EngineYoYoYo
If you want to contact me more directly, you can add me on Discord "YoYoYoDude#4708" or find me on Twitter @YoYoYoDude2

About
- This is an engine specifically made for GameMaker Studio 2 with everything revised to work with the new features.
- This engine assumes you have a reasonable amount of experience with GameMaker and requires some GML knowledge for things like playing music.
- This version of the engine requires the full version of GMS2 and will not work with the trial.

Features
- Works the same as other standard engines, with cleaner code and various bugs like dying through platforms fixed
- Includes a main menu system with file select and options menus
- Includes gravity flipping, vines, jump refreshers, and other frequently used gimmicky objects
- Includes slopes that support any shape
- Includes native controller support
- Built-in save verification system with MD5 hash checks to make saves harder to hack
- Mute/unmute music with Ctrl+M
- Stretchable window size
- Pause screen that shows deaths/time with volume controls
- Includes toggleable debug keys ("Tab" to drag player to mouse, "Backspace" to toggle debug overlay, "Ins" to save, "Del" to toggle showing the hitbox, "Home" to toggle god mode, "End" to toggle infinite jump, "Page Up" to go to next room, "Page Down" to go to previous room)
- Several engine options for things you might want to customize for your game (such as enabling/disabling death music) in the "scrInitEngineOptions" script

Important notes
- To set what music you want a room to play, change the "scrGetMusic" script. If you want something to stop music, use the "scrStopMusic" script.
- Make sure when making new rooms that they all include "World" and "Player" layers as there are objects that require these layers to exist.
- A template room with all of the correct layer and view settings is included which can be duplicated and modified.
- If you're using slopes, it's possible that certain gimmicks such as ice blocks might not work properly with them because of how they're coded.
- Because of how GMS2 saves files, all game saves are stored in "%localappdata%\<GameName>" instead of inside the folder where the game is located. Therefore, it is very important to change your game/project name to something unique before releasing your game to ensure there aren't save conflicts with other games.
- Make sure to set the "global.debugMode" variable in the "scrInitEngineOptions" script to "false" before releasing your game, otherwise debug keys will still work.
- Make sure to set the "MD5_STR_ADD" string in the "scrInitEngineOptions" script to something unique to your game to make saves harder to modify. This can be set to anything you want it to be, but it should be pretty hard to predict as it's kind of similar to a password.
- When creating new objects, the order of the objects in the Objects list matters for collision/event order. Therefore, when making new objects try to keep the type of object in the corresponding folder to prevent collision issues (ie put block objects in the Blocks folder, player killers in the Killers folder, etc).
- This version of the engine was made and tested in GMS2 v2.0.5.76. If you are using a different version of GMS2, there could be potential bugs as they sometimes tweak how things work in certain versions.

Special thanks
- yuuutu for creating the fangame engine this engine was originally based off of
- Patrick for giving a lot of feedback on engine structure and features