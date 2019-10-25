
class Something {

  int x, y, z;

  int boxx  ;
  int boxy ;
  int boxz ;
  int dz  ;


  Something() {
    this.x = (int) random(10, 20);
    this.y = (int) random(10, 20) ;
    this.z=  (int )random(20, 30) ; 


    this.boxx =(int) random(-40, 40 );
    this.boxy =(int) random(10, -20 );
    this.boxz = -400;
    this.dz = 3;
  }


  void create() {


    pushMatrix();
    translate(boxx, boxy, boxz);
    fill(100);
    stroke(255);
    strokeWeight(0.5);
    box(x, y, z);
    popMatrix();

    //println( boxz ) ;
  }

  void reset() {
    x= (int)random(10, 30);
    y= (int)random(10, 30);
    z= (int)random(20, 40);
    boxx =(int) random(-40, 40 );
    boxy =(int) random(-20, 10 );
    boxz = -400;
  }

  void move(float speed) {
    boxz += speed;
  }

  void check() {
    if (boxz >100) reset();
    
    if ( Math.abs(boxz ) <4  ) {

      if ( Math.abs(boxx - planex) < (x/2) + 15  && Math.abs(boxy - planey -2) < y/2 + 1 ) {
        scene=3;
        refrsh();
      }
    }
  }
}
