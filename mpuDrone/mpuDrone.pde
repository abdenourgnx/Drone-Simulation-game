import processing.serial.*;
import toxi.geom.*;
import toxi.processing.*;


boolean dor = false;
float planex = 0, planey = 0, planez = 0;


boolean realGame = false ;
boolean detect = false ;


int groundx = 0;

float speed  = 3 ; 
PShape ds;
PShape rwa7a ;
float rotat = 0;


ArrayList<Something> boxes = new ArrayList<Something>();
Something[] objects = new Something[4] ;

int scene = 0 ;


void setup() {


  size(1366, 760, P3D);


  gfx = new ToxiclibsSupport(this);

  String prtname = Serial.list()[0];
  port = new Serial(this, prtname, 115200);

  ds=loadShape("drone.obj");
  rwa7a=loadShape("rwa7a.obj");

  smooth();
  imageMode(CENTER);
  
  
  initCamera();



  surface.setResizable(true);

  port.write('r');
  
}


void draw() {    
  if (scene == 0 ) {
    cursor();
    hello();
  } else if (scene == 1 ) {
    cursor();
    vis();
  } else if (scene == 2) {
    noCursor();
    game();
  } else {
    cursor();
    gameOver();
  }

  //}
}




void hello() {


  pushMatrix();
  background(20);
  stroke(255);
  strokeWeight(3);



  textAlign(CENTER);

  line(width/3, 0, width/3, height) ;
  line(2*width/3, 0, 2*width/3, height) ;

  if (mouseX < width/3) {

    fill(50);
    rect(0, 0, width/3, height );
    fill(255);
    textSize(width/17);
    text("Game", width/6, height/3 );
    textSize(width/49);
    text("Using the mouse \n try to avoid objects \n (Sensor controle COMING SOON ..)", width/6, height/2);

    textSize(width/19);
    text("Simulation", width/2, height/3) ;
    textSize(width/52);
    text("Simulating drone movement \n MPU6050 sensor data \n Click SPACE to ON/OFF fanes", width/2, height/2);


    textSize(width/19);
    text("Hybrid", 5*width/6, height/3) ;
    textSize(width/52);
    text("Playing the game using \n MPU6050 sensor data \n ENJOY :D", 5*width/6, height/2);
  } else if ( mouseX>width/3 && mouseX< 2*width/3) {

    fill(50);
    rect(width/3, 0, width/3, height );
    fill(255);
    textSize(width/19);
    text("Game", width/6, height/3 );
    textSize(width/52);
    text("Using the mouse \n try to avoid objects \n (Sensor controle COMING SOON ..)", width/6, height/2);

    textSize(width/17);
    text("Simulation", width/2, height/3) ;
    textSize(width/49);
    text("Simulating drone movement \n MPU6050 sensor data \n Click SPACE to ON/OFF fanes", width/2, height/2);


    textSize(width/19);
    text("Hybrid", 5*width/6, height/3) ;
    textSize(width/52);
    text("Playing the game using \n MPU6050 sensor data \n ENJOY :D", 5*width/6, height/2);
  } else {

    fill(50);
    rect(2*width/3, 0, width, height );
    fill(255);
    textSize(width/19);
    text("Game", width/6, height/3 );
    textSize(width/52);
    text("Using the mouse \n try to avoid objects \n (Sensor controle COMING SOON ..)", width/6, height/2);

    textSize(width/19);
    text("Simulation", width/2, height/3) ;
    textSize(width/52);
    text("Simulating drone movement \n MPU6050 sensor data \n Click SPACE to ON/OFF fanes", width/2, height/2);


    textSize(width/17);
    text("Hybrid", 5*width/6, height/3) ;
    textSize(width/49);
    text("Playing the game using \n MPU6050 sensor data \n ENJOY :D", 5*width/6, height/2);
  }

  popMatrix();
}

void gameOver() {

  background(20);
  textAlign(CENTER);
  
  int highScore = Integer.parseInt(loadStrings("score.txt")[0]);
  
  if(score > highScore){
    String[] i = new String[1] ;
    i[0]= String.valueOf(score);
    saveStrings("score.txt",i);
    highScore = score;
  }

  textSize(width/12);
  text("YOU ARE A LOSER :P", width/2, height/2 );

  textSize(width/32) ;
  text("Score :" + score, 1.3*width/8, height/8 );
  text("Level :" + level, 6.5*width/8, height/8 );
  text("CLICK ANYWHERE TO TRY AGAIN", width/2, 6*height/8 );
  text("HIGH SCORE :" + highScore, width/2, 2*height/8 );
  textSize(width/45) ;
  text("CLICK (M) TO GO main menu", width/2, 7.5*height/8 );
}


void refrsh() {
  surface.setSize(1366, 761);
  surface.setSize(1366, 760);
}




void mousePressed() {

  if (scene == 0 ) {
    if (mouseX>width/3 && mouseX< 2*width/3) {
      resetGame();
      cursor();
      scene =1 ;
      
    } else if ( mouseX < width/3 ) {
      
      noCursor();
      realGame = false ;
      resetGame();
      scene = 2;
      
    } else {
      
      noCursor();
      realGame = true ;
      resetGame();
      scene = 2;
      
    }
    
  } else if ( scene == 3) {
    resetGame();
    noCursor();
    scene = 2;
  }
}


void captureEvent(Capture video){
  video.read();
}
