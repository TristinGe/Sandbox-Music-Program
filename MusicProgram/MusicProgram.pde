//Library: use Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim;
AudioPlayer song1; //creates a play list variable holding extesionn

void setup() 
{
  size(500, 600); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  //Should declare landscape, portrait, or square
  minim = new Minim(this);//load from data directroy, loadFile should also load from project folder, like loadImage()
  song1 = minim.loadFile();//able to pass absolute pasths, file name & extension, and URL
}

void draw() 
{
  
}//End draw()

void keyPressed() 
{
  
}//End keyPressed()

void mousePressed() 
{
  
}//End mousePressed()
