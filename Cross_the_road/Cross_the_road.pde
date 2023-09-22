void setup() {
  size(600, 545);
  if (title==0) { //title screen
    background(0, 150, 200);
    textAlign(CENTER);
    textSize(24);
    fill(255);
    text("Click to Play!", width/2, height/2);
  }
}
int playerX =0;
int playerY = 0; 
int title = 0;

//wasd movement
void keyPressed() {
  //horizontal movement
  if (playerX>0 && key == 'a'  || key == 'A' ) {
    playerX= playerX -10;
  }
  if (playerX<570 && key == 'd' || key == 'D') {
    playerX=playerX+10;
  }
  //vertical movement
  if (key == 'w' || key == 'W') {
    playerY = playerY-10;
  }
  if (key == 's' || key == 'S') {
    playerY = playerY+10 ;
  }
}

//game starts when title is clicked
void mousePressed() {
  if (title == 0 || title == 2 || title == 3) {
    title = 1;
    playerX=285;
    playerY=505;
  }
  //doesn't reset when clicked during game
  else if (title==1) {
  }
}
//blue car variables
float blueX=0;
float blueY=30;
float blueXspeed=5;
//red car variables
float redX=0;
float redXspeed=0;
//orange car variables
float orangeX=200;
float orangeXspeed=0;

void draw() {
  if (title == 1) { //game start
    background(255, 215, 0);
    fill(150);
    //background design
    //grey roads
    for (int roadY=45; roadY<=450; roadY+=90) {
      rect(0, roadY, width, 45);
    }
    //safe grass
    int grassY=90;
    while (grassY<460) {
      fill(0, 150, 0);
      rect(0, grassY, width, 45);
      grassY=grassY+90;
    }
    //player
    fill(255, 0, 0);
    rect(playerX, playerY, 30, 30);//player

    //blue rectangle obstacles
    fill(0, 0, 200);
    //first blue car
    blueY=50; 
    rect(blueX, blueY, 100, 35);
    if (playerX >=blueX && playerX<=blueX+100 && playerY>=blueY && playerY<=blueY+35) {
      title =2;
    } else if (playerX+30 >=blueX && playerX+30<=blueX+100 && playerY+30>=blueY && playerY+30<=blueY+35) {  
      title =2;
    }
    //second blue car
    blueY=blueY+180;
    rect(blueX, blueY, 100, 35);
    //collision
    //left side
    if (playerX >=blueX &&playerX<=blueX+100 && playerY>=blueY && playerY<=blueY+35) {
      title =2;
    }
    //right side
    else if (playerX+30 >=blueX &&playerX+30<=blueX+100 && playerY+30>=blueY && playerY+30<=blueY+35) {  
      title =2;
    }
    //third blue car- must be seperate so collision can work using rectX and rectY
    blueY=blueY+180;
    rect(blueX, blueY, 100, 35);
    //collision
    //left side
    if (playerX >=blueX &&playerX<=blueX+100 && playerY>=blueY && playerY<=blueY+35) {
      title =2;
    }
    //right side
    else if (playerX+30 >=blueX &&playerX+30<=blueX+100 && playerY+30>=blueY && playerY+30<=blueY+35) {  
      title =2;
    }

    //object movement- changing rectX values
    blueX=blueX+blueXspeed;
    if (blueX>width-100) {
      blueXspeed=-5;
    }
    if (blueX<0) {
      blueXspeed=5;
    }
    //red and oranges cars- (flowing traffic)
    //red car 
    fill(255, 0, 0);
    for (int redY=140; redY<400; redY+=180) {
      rect(redX, redY, 100, 35);
      redX=redXspeed+redX;
      redXspeed=2;
      if (redX>width) {
        redX=-105;
      }
      if (playerX >=redX &&playerX<=redX+100 && playerY>=redY && playerY<=redY+35) {
        title =2;
      }
    }

    //orange car
    for (int orangeY=140; orangeY<400; orangeY+=180) {
      fill(255, 69, 0);
      rect(orangeX, orangeY, 100, 35);
      orangeX=orangeXspeed+orangeX;
      orangeXspeed=2;
      if (orangeX>width) {
        orangeX=-105;
      }
      if (playerX >=orangeX &&playerX<=orangeX+100 && playerY>=orangeY && playerY<=orangeY+35) {
        title =2;
      }
    }

    if (playerY<=25) {
      title=3;
    }
  }

  //game over screen
  else if (title==2) {
    background(200, 0, 0);
    textAlign(CENTER);
    textSize(24);
    fill(255);
    text("You lose! Click to try again!", width/2, height/2);
  }
  //win screen
  else if (title==3) {
    background(255, 215, 0);
    textAlign(CENTER);
    textSize(24);
    fill(255);
    text("Congratulations, you won! Click to play again!", width/2, height/2);
  }
}
