import processing.video.*;

import java.util.*;

Capture video ;

PImage demo;

color trackColor;
float threshold = 40;
float distThreshold = 50;


ArrayList<Blob> blobs = new ArrayList<Blob>();

String[] devices;

void initCamera() {

  devices= Capture.list();
  video = new Capture(this, 640, 480, devices[0]);
  video.start();

  imageMode(CENTER);

  trackColor= color(164, 23, 25);
}
