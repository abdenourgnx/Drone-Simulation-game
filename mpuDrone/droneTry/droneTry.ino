#include <Servo.h> 

Servo esc1;
Servo esc2;
Servo esc3;
Servo esc4;
int escPin1 = 6;
int escPin2 = 9;
int escPin3 = 10;
int escPin4 = 11;
int minPulseRate        = 1000;
int maxPulseRate        = 2000;
int throttleChangeDelay = 50;

void setup() {
  //Serial.setTimeout(500);
  initEscs();
}
void loop() {
}
void writeTo4Escs(int throttle) {
  esc1.write(throttle);
  esc2.write(throttle);
  esc3.write(throttle);
  esc4.write(throttle);
}
void initEscs() {
  esc1.attach(escPin1, minPulseRate, maxPulseRate);
  esc2.attach(escPin2, minPulseRate, maxPulseRate);
  esc3.attach(escPin3, minPulseRate, maxPulseRate);
  esc4.attach(escPin4, minPulseRate, maxPulseRate);
  writeTo4Escs(0);
  writeTo4Escs(100);
  delay(10000);
  writeTo4Escs(160);
}
