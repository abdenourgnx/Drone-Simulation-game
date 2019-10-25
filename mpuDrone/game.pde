int time = 0;
int time2 = 0;
int score = 0 ;
int level = 0 ;

void game() { 




  background(30);


  if (realGame) {
    //ypr[1] = map(mouseX,0,width,-PI/6,PI/6);
    //ypr[2] = map(mouseY,0,height,-PI/6,PI/6);

    planex += map(ypr[2], -PI/6, PI/6, 4, -4);
    planey += map(ypr[1], -PI/6, PI/6, -4, 4);

    if (planex >50) planex=50; 
    if (planex <-50) planex = -50;
    if (planey >10) planey=10; 
    if (planey <-20) planey = -20;
  } else {

    if (detect) {

      detect(trackColor, blobs );
      if (blobs.size()!= 0 ){
        planex = lerp(planex ,  map(blobs.get(0).getX(), 0, 640, 50, -50) ,0.12);
        planey = lerp ( planey ,map(blobs.get(0).getY(), 0, 480, -20, 10) , 0.12);
      }
    } else {

      planex= map(mouseX, 0, width, -50, 50);
      planey = map(mouseY, 0, height, -20, 10);
    }
  }


  if (mouseY<height-2) {
    to += PI/10;
  }


  check();

  rotat += PI/100;



  pushMatrix();

  lights();

  camera(planex, planey - 20, planez + 150, planex, planey, planez, 
    0, 1, 0);   
  perspective(PI/6, float(width)/float(height), 10, 700);

  pushMatrix();
  translate(planex, planey, planez);

  //float[] axis = quat.toAxisAngle();
  //rotate(axis[0], axis[1], -axis[3], axis[2]);
  //rotate(axis[0], -axis[1], axis[3], axis[2]);  
  //rotateX(euler[1]);
  //rotateY(euler[0]);
  //rotateZ(euler[2]);

  drawPlane();
  popMatrix();


  drawLines();

  imageMode(CENTER);


  for (int i = 0; i< boxes.size(); i++) {
    boxes.get(i).create();
    boxes.get(i).move(speed);
    boxes.get(i).check();
  }




  if ( millis()- time >10000 ) {
    boxes.add(new Something());
    print("add") ;
    time = millis();
    level ++ ;
  }

  if ( millis()- time2 >1000 ) {
    score ++ ;
    time2= millis();
  }
  speed = 2+ score*0.08;


  drawScore();

  popMatrix();

  //println(millis());
}

void keyPressed() {
  if (key == 'm') {   
    //frame.setSize(500, 500);
    //frame.setSize(1366 , 760);
    cursor();
    scene = 0;
    refrsh();
  } else if (keyCode == 32) {
    println("sent");
    //port.write('a');
    dor = !dor ;
  } else if (key == 'c') {
    detect =! detect;
  }
}


void resetGame() {

  boxes.clear();
  score = 0 ;
  level = 0;

  planex = 0;
  planey = 0;
  planez= 0;

  refrsh();
}
