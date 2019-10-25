
float mouseSpeedx= 0;
float smoothedSpeedx = 0;
float mappedx = 0;

float mouseSpeedy= 0;
float smoothedSpeedy = 0;
float mappedy = 0;

float pPlanex , pPlaney ;

float smoothedx =0, smoothedy =0;


void drawPlane() {

  pushMatrix();

  if (scene == 2) {

    if (realGame) {
      rotateZ(-ypr[2]);
      rotateX(ypr[1]);
    } else {

      if (detect) {
        
        smoothedx = lerp( smoothedx , planex- pPlanex ,0.05);
        smoothedy = lerp( smoothedy , planey- pPlaney ,0.05);
        
        pPlanex = planex;
        pPlaney = planey;
        
        rotateZ( map(smoothedx, -2, 2, -PI/6, PI/6));
        rotateX( map(smoothedy, -2, 2, -PI/6, PI/6));
        
        
      } else {
        mouseSpeedx = mouseX - pmouseX ;
        smoothedSpeedx = lerp(smoothedSpeedx, mouseSpeedx, 0.05);
        mappedx = map(smoothedSpeedx, -20, 20, -PI/6, PI/6);


        mouseSpeedy = mouseY - pmouseY ;
        smoothedSpeedy = lerp(smoothedSpeedy, mouseSpeedy, 0.05);
        mappedy = map(smoothedSpeedy, -20, 20, -PI/6, PI/6);


        rotateZ(mappedx);
        rotateX(mappedy);
      }
    }

    scale(1.7);
  } else {
    scale(2.7);
  }
  //rotateY(rotat);


  pushMatrix();

  translate(-7.6, -2, -4.3);
  rotateY(to);
  shape(rwa7a);
  popMatrix();

  pushMatrix();

  translate(-7.3, -2, 6.5);
  rotateY(to);
  shape(rwa7a);
  popMatrix();



  pushMatrix();

  translate(7.9, -2, 5.7);
  rotateY(to);
  shape(rwa7a);
  popMatrix();


  pushMatrix();

  translate(7.8, -2, -4.2);
  rotateY(to);
  shape(rwa7a);
  popMatrix();



  rotateX(PI);
  shape(ds);
  noFill();
  imageMode(CENTER);

  //scale(0.58);
  //translate(0 ,3 , 0 ) ;
  //box(28,6,5);

  popMatrix();
}

void drawLines() {
  for (int i = -800; i<800; i+=20) {
    stroke(map(groundx +i, 0, 400, 60, 255));
    strokeWeight(0.5);

    pushMatrix();
    line(-800, 10, groundx + i, 800, 10, groundx + i);

    popMatrix();
    int j = i/2;
    line(j, 10, -800, j, 10, 800);
  }

  stroke(255, 0, 0, 100);
  strokeWeight(0.5);
  line(0, 10, -800, 0, 10, 800);

  //stroke(0, 255, 0, 100);
  //strokeWeight(0.5);
  //line(-800, 10, 0, 800, 10, 0);

  //stroke(0, 0, 255, 50);
  //strokeWeight(0.5);
  //line(0, 800, 0, 0, -800, 0);



  if (scene == 1) {

    stroke(0, 255, 0, 100);
    strokeWeight(0.5);
    line(-800, 10, 0, 800, 10, 0);

    stroke(0, 0, 255, 50);
    strokeWeight(0.5);
    line(0, 800, 0, 0, -800, 0);
  } else {


    for (int i = 0; i <3; i++) {
      stroke(255, 0, 0);
      strokeWeight(1);
      line(60, -i *13, -500, 60, - i *13, 100);
      line(-60, -i *13, -500, -60, - i *13, 100);
    }

    groundx += 1 ;

    if (groundx > 200) {
      groundx = 0;
    }

    if (detect) {

      pushMatrix();
      //rectMode(CENTER);
      translate(0, -10, -500);
      noFill();
      //noStroke();
      //stroke(255);
      //strokeWeight(0.5);
      box(120, 40, 0);
      translate(planex, planey, +2);
      fill(255, 0, 0);
      stroke(255, 0, 0);
      strokeWeight(0.5);
      box(4, 4, 0);
      popMatrix();
    }
  }
}


void drawTexts() {
  //textSize(12);
  //stroke(255);
  //text("axis 1: " + euler[0]*180/PI,-120,-15,-400);
  //text("axis 2: " + euler[1]*180/PI,-120,4,-400);
  //text("axis 3: " + euler[2] *180/PI,50,-15,-400);
  //text("axis 4: " + axis[3] *180/PI,50,3,-400);
}


void reset() {
  translate(0, 0, 0);
  scale(1);
}


void drawScore() {
  pushMatrix();
  fill(255);
  textSize(12);
  stroke(255);
  text("score : " + score, -120, -15, -400);
  text("level : " + level, 120, -15, -400);
  
  if (detect) {
    textSize(15);
    text("Detection mode ON", 0, -70, -500);
    textSize(7);
    text("(C) to switch", 0, -60, -500);
  }else{
    textSize(15);
    text("Detection mode OFF", 0, -70, -500);
    textSize(7);
    text("(C) to switch", 0, -60, -500);
  }

  popMatrix();
}


void drawInfo() {

  pushMatrix();

  fill(255);
  textSize(12);
  stroke(255);
  textAlign(CENTER);
  if (dor) {
    text("Fanes are ON ", 0, -15, -400);
  } else {
    text("Fanes are OFF", 0, -30, -400);
  }

  textSize(6);
  text("Click SPACE", 0, -23, -400);

  textSize(8);
  text("axis 1: " + nf(ypr[0]*180/PI, 3, 0), -150, 5, -400);
  text("axis 2: " + nf(ypr[1]*180/PI, 3, 0), 0, 5, -400);
  text("axis 3: " + nf(ypr[2]*180/PI, 3, 0), 150, 5, -400);
  //text("axis 4: " + axis[3] *180/PI, 50, 3, -400);




  popMatrix();
}
