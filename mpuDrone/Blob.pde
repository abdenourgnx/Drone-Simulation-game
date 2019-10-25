class Blob {
  float minx;
  float miny;
  float maxx;
  float maxy;

  ArrayList<PVector> points;


  Blob(float x, float y) {
    minx = x;
    miny = y;
    maxx = x;
    maxy = y;
    points = new ArrayList<PVector>();
    points.add(new PVector(x, y));
  }

  void show() {
    //stroke(0);
    //noFill();
    //strokeWeight(2);
    //rectMode(CORNERS);
    //rect(minx, miny, maxx, maxy);

    //for (PVector v : points) {
    //  //stroke(0, 0, 255);
    //  //point(v.x, v.y);
    //}


    //noStroke(); 
    //fill(255, 0, 0);
    //ellipse(getX(), getY(), 10, 10);
  }


  void add(float x, float y) {
    points.add(new PVector(x, y));
    minx = min(minx, x);
    miny = min(miny, y);
    maxx = max(maxx, x);
    maxy = max(maxy, y);
  }

  float size() {
    return (maxx-minx)*(maxy-miny);
  }

  float getX() {
    return maxx - (maxx-minx)/2;
  }

  float getY() {
    return maxy - (maxy-miny)/2;
  }


  boolean isNear(float x, float y) {


    float d = 10000000;


    for (PVector v : points) {
      float tempD = distSq(x, y, v.x, v.y);
      if (tempD < d) {
        d = tempD;
      }
    }

    if (d < distThreshold*distThreshold) {
      return true;
    } else {
      return false;
    }
  }
}
