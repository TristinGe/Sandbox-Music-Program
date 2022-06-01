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
  if ( song1.isLooping() ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
}//End draw
//
void keyPressed()
{
  //Another Play Button, as a finite loop()
  //Only press a number for this code below
  println(key);
  if ( key=='1' || key=='9' ) {
    if (key=='1') println("Looping Once");
    if (key=='9') println("Looping nine times"); //Simulate Infinity
    String keystr = String.valueOf(key); //Must press a number
    println("Number of Repeats is", keystr); 
    int loopNum = int(keystr); //Local Variable plays once and loops loopNum of times
    song1.loop(loopNum); //Parameter is number of loops
    // if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
  }
  //if ( key>='2' && key!='9') println("I donot loop that much, press infinite loop.");
  //
  //First Play Button
  //song1.play(); //Parameter is milli-seconds from start of audio file to start playing
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
