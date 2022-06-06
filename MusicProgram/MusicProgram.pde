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
AudioMetaData songMetaData1;
color black=#000000, purple=#2C08FF;
PFont titleFont;

void setup() 
{
  size(500, 600); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  //Should declare landscape, portrait, or square
  minim = new Minim(this);//load from data directroy, loadFile should also load from project folder, like loadImage()
  song1 = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3");//able to pass absolute pasths, file name & extension, and URL
  songMetaData1 = song1.getMetaData();
  //
  println("Start of Console");
  println("click the Console to Finish Starting this Program");
  println("Title", songMetaData1.title());
  titleFont=createFont("Arial", 10);
}

void draw()
{
  if ( song1.isLooping() &&song1.loopCount()!=-1) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isLooping() &&song1.loopCount()==-1) println("Looping Infinitely1");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  println("Song Position", song1.position(), "Song Length", song1.length());
  //
  background (black); // Reminder of os-Level Button
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //Ink, hexidecimal copied from color selector
  textAlign (CENTER, CENTER);//Align X&Y, see Processing.org / Reference//Values: [LEFT | CENTER | RIGHT] &[TOP| CENTER | BOTTOM| BASELINE]
  textFont(titleFont,20);//Change the number until it fits, largest font size
  text(songMetaData1.title(),width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program

  //
}//End draw
//
void keyPressed()
{
  //First Play Button
  if (key=='p' || key=='P') 
    {if (song1.isPlaying()){song1.pause();} 
    else if(song1.position()+100>=song1.length())
    {song1.rewind();song1.play();} 
    else 
    {song1.play();}}//Play Pause
  //Parameter is milli-seconds from start of audio file to start playing
  //Another Play Button, as a finite loop()
  //Only press a number for this code below
  println(key);
  if ( key=='1' || key=='9' ) {
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    if ( key=='1' ) println("Looping Once");
    if ( key=='9' ) println("Looping 9 times."); //Simulate Infinity
    String keystr = String.valueOf(key); //Must press a number
    println("Number of Repeats is", keystr); 
    int loopNum = int(keystr); //Local Variable plays once and loops loopNum of times
    song1.loop(loopNum); //Parameter is number of loops
    // if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
  }
  if ( key=='i' || key=='I' ) song1.loop(); //Infinite Loop, no parameter OR -1
  if ( key>='2' && key!='9' ) println("I donot loop that much, press infinite loop.");
  //
  if ( key=='m' || key=='M' ) { //Mute Button
    //Note: Mute has built-in pause button
    if ( song1.isMuted() ) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End Mute Button
  //
  //Built-in question: .isPlaying()
  if ( key=='f' || key=='F' ) song1.skip( 1000 ); //Skip forward 1 second (1000 milliseconds)
  if ( key=='r' || key=='R' ) song1.skip( -1000 ); //Skip backwards 1 second (1000 milliseconds)
  //
  if ( key=='s' || key=='S' ) { //Stop Button
    if ( song1.isPlaying() ) {
      song1.pause();
      song1.rewind();
    } else {
      song1.rewind();
    }
  }//End Stop Button
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
