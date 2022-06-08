void playlistArrayErrorN()
{
  if ( currentSong == numberOfSongs - 1 ) { //Throws error: ArrayIndexOutOfBounds
        currentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong++;
      }//End Catch "ArrayIndexOutOfBounds"
}
//
void playlistArrayErrorB()
{
  if ( currentSong == numberOfSongs - numberOfSongs ) { //Throws error: ArrayIndexOutOfBounds
        currentSong = numberOfSongs - 1;
      } else {
        currentSong--;
      }//End Catch "ArrayIndexOutOfBounds"
}
