//Library: use Sketch / Import Library / Add Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Global Variables
Minim minim;
int numberOfSongs = 4, currentSong=numberOfSongs-numberOfSongs;
AudioPlayer[] song = new AudioPlayer[numberOfSongs]; //creates a play list variable holding extesionn
AudioMetaData[] songMetaData= new AudioMetaData[numberOfSongs];
color black=#000000, purple=#2C08FF;
PFont titleFont;

void setup() 
{
  size(500, 600); //fullScreen(), displayWidth & displayHeight, leads to ScreenChecker()
  //Should declare landscape, portrait, or square
  minim = new Minim(this);//load from data directroy, loadFile should also load from project folder, like loadImage()
  song[currentSong] = minim.loadFile("MusicDownload/MusicProgram_MusicDownload_groove.mp3");//able to pass absolute pasths, file name & extension, and URL
  song[currentSong+=1] = minim.loadFile("MusicDownload/The_Simplest.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/Start_Your_Engines.mp3");
  song[currentSong+=1] = minim.loadFile("MusicDownload/Beat_Your_Competition.mp3");
  
  for(int i=currentSong; i<song.length; i++){songMetaData[i] = song[i].getMetaData();}//Meta Data
  //songMetaData[0] = song[0].getMetaData();
  //songMetaData[1] = song[1].getMetaData();
  //songMetaData[2] = song[2].getMetaData();
  //songMetaData[3] = song[3].getMetaData();
  //
  println("Start of Console");
  println("click the Console to Finish Starting this Program");
  println("Title", songMetaData[currentSong].title());
  titleFont=createFont("Arial", 10);
}

void draw()
{
  if ( song[currentSong].isLooping() &&song[currentSong].loopCount()!=-1) println("There are", song[currentSong].loopCount(), "loops left.");
  if ( song[currentSong].isLooping() &&song[currentSong].loopCount()==-1) println("Looping Infinitely1");
  if ( song[currentSong].isPlaying() && !song[currentSong].isLooping() ) println("Play Once");
  //
  println("Current Song:", currentSong);
  println("Song Position", song[currentSong].position(), "Song Length", song[currentSong].length());
  //
  background (black); // Reminder of os-Level Button
  rect(width*1/4, height*0, width*1/2, height*1/10);
  fill(purple); //Ink, hexidecimal copied from color selector
  textAlign (CENTER, CENTER);//Align X&Y, see Processing.org / Reference//Values: [LEFT | CENTER | RIGHT] &[TOP| CENTER | BOTTOM| BASELINE]
  textFont(titleFont,20);//Change the number until it fits, largest font size
  text(songMetaData[currentSong].title(),width*1/4, height*0, width*1/2, height*1/10);
  fill(255); //Reset to white for rest of the program

  //
}//End draw
//
void keyPressed()
{
  //First Play Button
  if (key=='p' || key=='P') 
    {if (song[currentSong].isPlaying()){song[currentSong].pause();} 
    else if(song[currentSong].position()+100>=song[currentSong].length())
    {song[currentSong].rewind();song[currentSong].play();} 
    else 
    {song[currentSong].play();}}//Play Pause
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
    song[currentSong].loop(loopNum); //Parameter is number of loops
    // if ( key=='l' || key=='L' ) song1.loop(loopNum); //Parameter is number of loops
  }
  if ( key=='i' || key=='I' ) song[currentSong].loop(); //Infinite Loop, no parameter OR -1
  if ( key>='2' && key!='9' ) println("I donot loop that much, press infinite loop.");
  //
  if ( key=='m' || key=='M' ) { //Mute Button
    //Note: Mute has built-in pause button
    if ( song[currentSong].isMuted() ) {
      song[currentSong].unmute();
    } else {
      song[currentSong].mute();
    }
  }//End Mute Button
  //
  //Built-in question: .isPlaying()
  if ( key=='f' || key=='F' ) song[currentSong].skip( 1000 ); //Skip forward 1 second (1000 milliseconds)
  if ( key=='r' || key=='R' ) song[currentSong].skip( -1000 ); //Skip backwards 1 second (1000 milliseconds)
  //
  if ( key=='s' || key=='S' ) { //Stop Button
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
    } else {
      song[currentSong].rewind();
    }
  }//End Stop Button
  //
  if( key=='n' || key=='N') {
    if (song[currentSong].isPlaying()) {}else
    {if( currentSong == numberOfSongs-1){//Throws Error
      currentSong = numberOfSongs-numberOfSongs;
      }else{currentSong++;}}
    //currentSong++;
  }//End Next
  //
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN
