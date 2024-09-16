// movement keybinds
boolean wkey, dkey, akey, skey, upkey, downkey, leftkey, rightkey;
//colors
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color white  = color(255, 255, 255);
color black  = color(0, 0, 0);

//scoreboard
int scoreleft;
int scoreright;


void setup() {
  size(800,800);
  scoreleft = 0;
  scoreright = 0;

}


void draw() {
  
 // try to have instead of set velocity make like box move up or down then add collision code to make sure the ball can iteract with our player
 
 // player design will be big circle on bottom plus small circle on top like a head
 
 // Try to make key presses direct move the direction of the object/player
 
 // draw goal post using code similar to collision code  
 
 // remeber to add comment to make sure code is simple for me to understand and also include other things that can help me simplify the process
 
 // Ask Andy or mr P for assitence for some more difficult code.
  if (dkey) {
    player.setVelocity(200, pvy);
  }
  if (akey) {
    player.setVelocity(-200, pvy);
  }
  if (skey) {
    player.setVelocity(pvx, 400);
  }
  if (wkey) {
    player.setVelocity(pvx, -400);
  }
  if (rightkey) {
    player2.setVelocity(200, pvy2);
  }
  if (leftkey) {
    player2.setVelocity(-200, pvy2);
  }
  if (upkey) {
    player2.setVelocity(pvx2, -400);
  }
  if (downkey) {
    player2.setVelocity(pvx2, 400);
  }
  
  
  
  
  
}


void keyPressed() {



  if (key=='d') {
    dkey=true;
  }
  if (key=='a') {
    akey=true;
  }
  if (key=='w') {
    wkey=true;
  }
  if (key=='s') {
    skey=true;
  }//--------------------------------------------------------------------------p2

  if (key=='3') {

    rightkey=true;
  }
  if (key=='1') {

    leftkey=true;
  }
  if (key=='5') {

    upkey=true;
  }
  if (key=='2') {

    downkey=true;
  }
}
void keyReleased() {
  if (key=='d') {
    dkey=false;
  }
  if (key=='a') {
    akey=false;
  }
  if (key=='s') {
    skey=false;
  }
  if (key=='w') {
    wkey=false;
  }
  if (key=='1') {
    leftkey=false;
  }
  if (key=='5') {
    upkey=false;
  }
  if (key=='2') {
    downkey=false;
  }
  if (key=='3') {
    rightkey=false;
  }
}
  
 
