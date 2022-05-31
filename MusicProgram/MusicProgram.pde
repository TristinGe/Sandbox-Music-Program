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
  song1 = minim.loadFile("MusicDownload/ヒグチアイ - 悪魔の子.mp3");//able to pass absolute pasths, file name & extension, and URL
  
}

void draw() 
{
  if(song1.isLooping() )println("There are", song1.loopCount(), "loops left.");
}//End draw()

void keyPressed() 
{
  //Another Play Button
  String keystr = String.valueOf(key);//Must press a number
  println("Number of Repeats is", keystr);
  int loopNum = 0; //Local Variable plays once and loops loopNum of times
  if( key=='l' || key=='L') song1.loop(loopNum);//Parameter is number of loops
  //
  //song1.play();//Parameter is milli-seconds from start of audio file to start playing
  //
}//End keyPressed()

void mousePressed() 
{
  
}//End mousePressed()
