import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;
Box box;
int j;
float ff;
final int WIDTH = 1920;
final int HEIGHT = 1080;
PImage bg;
int xi;
int yi;
void setup()
{
  fullScreen();
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448);
  //size(1920, 1080);
  bg = loadImage("nicePic.jpg");
  box = new Box(10, 295);
  rectMode(CENTER);
}

void draw()
{
  background(bg);
  xi = box.update(j, ff);  
  yi = box.show();
}
void oscEvent(OscMessage theOscMessage) {
 println("received message");
    if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
      if(theOscMessage.checkTypetag("ff")) {
      float i = theOscMessage.get(0).floatValue();
      float f = theOscMessage.get(1).floatValue();
      //println(f);
      //println("received1");
      j = (int)i;
      ff = (float)f;
      }
    }
 
}