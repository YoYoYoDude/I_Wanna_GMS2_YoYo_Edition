/// @description Draw menu and save file info

for(var i = 0; i < 3; i += 1) {
    draw_set_color(c_black);
    draw_set_halign(fa_left);
	draw_set_valign(fa_top);
    draw_set_font(fDefault30);
    
    draw_text(x+(i*xSeperation)+2,y,str[i]);
    
    draw_set_font(fDefault12);
    
    draw_text(x+(i*xSeperation)+10,y+70,"Deaths: "+string(deaths[i]));
    draw_text(x+(i*xSeperation)+10,y+90,"Time: "+timeStr[i]);
    
    draw_set_halign(fa_center);
    
    if (difSelectMode && i == fileSelect) { // Draw difficulty select text
        if (!warnText) {
			var difSelectText;
			
            if (difSelect == -1) {
				difSelectText = "< Load game >";
            } else if (difSelect == 0) {
				difSelectText = "< Medium >";
            } else if (difSelect == 1) {
				difSelectText = "< Hard >";
            } else if (difSelect == 2) {
				difSelectText = "< Very Hard >";
            } else {
				difSelectText = "< Impossible >";
			}
			
			draw_text(x+(i*xSeperation)+65,y+49,difSelectText);
        } else {
            draw_text(x+(i*xSeperation)+63,y-100,"Are you sure\nyou want to\noverwrite this save?");
			
			var warnSelectText;
			
            if (warnSelect) {
				warnSelectText = "< Yes >";
            } else {
				warnSelectText = "< No >";
			}
			
			draw_text(x+(i*xSeperation)+65,y+49,warnSelectText);
        }
    }
    
    if (exists[i]) { // Draw save file info
        if ((!difSelectMode) || (difSelectMode && i != fileSelect)) {
			var difficultyText;
			
            if (difficulty[i] == 0) {
				difficultyText = "Medium";
            } else if (difficulty[i] == 1) { 
				difficultyText = "Hard";
            } else if (difficulty[i] == 2) { 
				difficultyText = "Very Hard";
            } else {
				difficultyText = "Impossible";
			}
			
			draw_text(x+(i*xSeperation)+65,y+49,difficultyText);
        }
        
        draw_set_font(fDefault24);
        
        if (clear[i]) { 
			draw_text(x+(i*xSeperation)+63,y+215,"Clear!!");
		}
		
		var bossArray = boss[i];
        
        if (bossArray[0]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation),y+128);
		}
        if (bossArray[1]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+32,y+128);
		}
        if (bossArray[2]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+64,y+128);
		}
        if (bossArray[3]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+96,y+128);
		}
        if (bossArray[4]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation),y+160);
		}
        if (bossArray[5]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+32,y+160);
		}
        if (bossArray[6]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+64,y+160);
		}
        if (bossArray[7]) {
			draw_sprite(sprBossItem,-1,x+(i*xSeperation)+96,y+160);
		}
    } else {
        if ((!difSelectMode) || (difSelectMode && i != fileSelect)) {
            draw_text(x+(i*xSeperation)+65,y+49,"No Data");
        }
    }
    
    if (i == fileSelect) {
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+5,y+310);
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+25,y+310);
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+45,y+310);
        draw_sprite(sprPlayerIdle,playerIndex,x+(i*xSeperation)+65,y+310);
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+85,y+310);
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+105,y+310);
        draw_sprite(sprCherry,appleIndex,x+(i*xSeperation)+125,y+310);
    }
}

scrDrawButtonInfo(true); // Draw menu button text