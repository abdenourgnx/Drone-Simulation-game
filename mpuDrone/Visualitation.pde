

void vis() {
  background(30);

  //planex= map(mouseX, 0, width, -40, 40);
  planey = map(mouseY, 0, height, -20, 10);

  if (dor) {
    to += PI/10;
  }


  check();

  rotat += PI/100;


  pushMatrix();
  lights();

  camera( 0, planey - 20, planez + 150, planex, planey, planez, 
    0, 1, 0);   
  perspective(PI/6, float(width)/float(height), 10, 600);

  pushMatrix();
  translate(planex, planey, planez);

  float[] axis = quat.toAxisAngle();
  
  //rotate(axis[0], axis[1], -axis[3], axis[2]);
  //rotate(axis[0], -axis[1], axis[3], axis[2]);  
  rotateY(-ypr[0] + map(mouseX , 0 , width , -PI , PI) ) ;
  pushMatrix();
  rotateX(ypr[1]);
  pushMatrix();
  rotateZ(-ypr[2]);
  
 

  drawPlane();
  popMatrix();

  popMatrix();
  popMatrix();
  drawLines();

  imageMode(CENTER);
  
  drawInfo();
  
  popMatrix();
}
