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


//modes

int mode;
final int INTRO = 0;
final int GAME = 1;

//scoreboard
int scoreleft;
int scoreright;

//for players

float P1x, P1y, P1d, P2x, P2y, P2d; // vx's
float P1vx, P2vx, P1vy, P2vy;
float ballx, bally, balld;
float bvx, bvy;

void setup() {
  size(800, 800);

  mode = INTRO;
  scoreleft = 0;
  scoreright = 0;

  //player spawn

  P1x = 50;
  P1y = height/2;
  P1d = 100;

  P2x = 750;
  P2y = height/2;
  P2d = 100;

  //ball spawn

  bally = width/2;
  ballx = height/2;
  balld = 50;

  //keyboard setup

  wkey = skey = akey = dkey = false;
  upkey = downkey = leftkey = rightkey = false;
}

void draw() {

  if ( mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  }
}

void intro() {

  background(black);

  fill(white);
  textSize(48);
  text("MINI-SOCCER", 275, 200);

  text("Player 1 uses W A S D", 200, 300);
  text("Player 1 uses NUM PAD 1 2 3 5", 130, 400);
  text("First to 5 WINS!!", 240, 600);
  

  stroke(white);
  fill(black);
  rect(250, 440, 300, 100);
  fill(white);
  text("PLAY", 350, 500);
}

void game() {

  stroke(black);
  //score
  if (ballx < 50 && bally > 250 && bally < 500) {

    scoreleft++;
    ballx = 400;
    bally = 400;
    bvx = 0;
    bvy = 0;
    P1x = 50;
    P1y = height/2;
    P1d = 100;

    P2x = 750;
    P2y = height/2;
    P2d = 100;
  }

  if (ballx > 750 && bally > 250 && bally < 525) {

    scoreright++;
    ballx = 400;
    bally = 400;
    bvx = 0;
    bvy = 0;
    P1x = 50;
    P1y = height/2;
    P1d = 100;

    P2x = 750;
    P2y = height/2;
    P2d = 100;
  }



  if (dist(ballx, bally, P1x, P1y) <= 25+50) {
    bvx = (ballx - P1x)/10;
    bvy = (bally - P1y)/10;
  }

  if (dist(ballx, bally, P2x, P2y) <= 25+50) {
    bvx = (ballx - P2x)/10;
    bvy = (bally - P2y)/10;
  }


  //OUT OF BORDER BAN CODE BALL
  if (ballx > 800) {
    bvx = -abs(bvx);
  }
  if (bally > 800) {
    bvy = -abs(bvy);
  }
  if (ballx < 0) {
    bvx = abs(bvx);
  }
  if (bally < 0) {
    bvy = abs(bvy);
  }

  //player left code ban     not working rn
  if (P1x > 800) {
    P1x = 800;
  }
  if (P1y > 800) {
    P1y = 800;
  }
  if (P1x < 0) {
    P1x = 0;
  }
  if (P1y < 0) {
    P1y = 0;
  }

  //player right ban code    not working rn

  if (P2x > 800) {
    P2x = 800;
  }
  if (P2y > 800) {
    P2y = 800;
  }
  if (P2x < 0) {
    P2x = 0;
  }
  if (P2y < 0) {
    P2y = 0;
  }


  //score code





  //vel


  P1x = P1x + P1vx ;
  P1y = P1y + P1vy ;
  P2x = P2x + P2vx ;
  P2y = P2y + P2vy ;
  ballx = ballx + bvx;
  bally = bally + bvy;
  bvy = bvy *0.99;
  bvx = bvx *0.99;


 //end game
 
 if (scoreleft == 5){
   mode = INTRO;
   scoreleft = 0;
 
 }
  if (scoreright == 5){
   mode = INTRO;
   scoreright = 0;
 
 }


  background(green);


  //goal
  fill(white);
  strokeWeight(2);
  rect(0, 250, 75, 300);
  rect(725, 250, 75, 300);



  fill(white);
  strokeWeight(0);

  rect(375, 0, 50, 800);
  circle(400, 400, 200);
  //mid circle
  fill(green);
  circle(400, 400, 150);
  //player1
  fill(white);
  circle(P1x, P1y, P1d);
  fill(blue);
  rect(P1x-5, P1y-50, 10, 100);
  rect(P1x-50, P1y-5, 100, 10);
  fill(red);
  circle(P1x, P1y, 60);
  fill(#FAEF9C);
  circle(P1x, P1y, 45);


  //player2
  circle(P2x, P2y, P2d);
  fill(white);
  circle(P2x, P2y, P2d);
  fill(black);
  rect(P2x-5, P2y-50, 10, 100);
  rect(P2x-50, P2y-5, 100, 10);
  fill(red);
  circle(P2x, P2y, 60);
  fill(#FAEF9C);
  circle(P2x, P2y, 45);



  // ball
  fill(red);
  circle(ballx, bally, balld);



  //goal on top of ball to make it seem like it enters

  fill(white);
  strokeWeight(5);
  rect(50, 250, 25, 300);
  rect(725, 250, 25, 300);





  //text

  fill(white);
  textSize(48);
  text("Score: " + scoreleft, 500, 50);


  fill(white);
  textSize(48);
  text("Score: " + scoreright, 100, 50);

  fill(white);
  textSize(48);
  text("", 500, 50);




  //move player

  if (wkey == true) P1vy = - 5 ;
  if (skey == true) P1vy = 5;
  if (dkey == true) P1vx = 5;
  if (akey == true) P1vx = - 5;

  if (!wkey && !skey) {
    P1vy=0;
  }
  if (!dkey && !akey) {
    P1vx=0;
  }
  // p2

  if (upkey == true) P2vy = -5;
  if (downkey == true) P2vy = 5;
  if (leftkey == true) P2vx = -5;
  if (rightkey == true) P2vx = 5;

  if (!upkey && !downkey) {
    P2vy=0;
  }
  if (!rightkey && !leftkey) {
    P2vx=0;
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

  //-------------------------------------------------

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


void introClicks() {

  if (mouseX > 250 && mouseX < 550 && mouseY < 540 && mouseY > 440) {
    mode = GAME;
  }
}
void mouseClicked(){
  if(mode == INTRO){
    introClicks();
    
  }
}
