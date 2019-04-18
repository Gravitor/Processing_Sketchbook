import processing.sound.*;
MusicAPI sketch = this;

class Note {
  String note;
  float amp;
  float freq;
  int oct;
  int index;
  SinOsc sound; 

  Note(String note_, float amp_, int oct_) {
    amp = amp_;
    oct = oct_;
    note = note_;
    freq = NoteRef.freqFromNote(note, oct);
    sound = waveConstructor();
  }

  void Play() {
    sound.play();
  }
  void Stop(){
    sound.stop();
  }

  SinOsc waveConstructor() {
    SinOsc sin = new SinOsc(sketch);
    sin.freq(freq);
    sin.amp(amp);
    return sin;
  }
} 
static class NoteRef {
  //-----------------------------------------------------------
  static float freqFromNote(String note_, int oct_) {
    switch(note_) {
    case "C":
      return(16.35 * pow(2, oct_));
    case "C#":
      return(17.32 * pow(2, oct_));
    case "D":
      return(18.35 * pow(2, oct_));
    case "D#":
      return(19.45 * pow(2, oct_));
    case "E":
      return(20.60 * pow(2, oct_));
    case "F":
      return(21.83 * pow(2, oct_));
    case "F#":
      return(23.12 * pow(2, oct_));
    case "G":
      return(24.50 * pow(2, oct_));
    case "G#":
      return(25.96 * pow(2, oct_));
    case "A":
      return(27.50 * pow(2, oct_));
    case "A#":
      return(29.14 * pow(2, oct_));
    case "B":
      return(30.87 * pow(2, oct_));
    default:
      return(0);
    }
  }
  //-----------------------------------------------------------
  static int indexFromNote(String note_) {
    switch(note_) {
    case "C":
      return(0);
    case "C#":
      return(1);
    case "D":
      return(2);
    case "D#":
      return(3);
    case "E":
      return(4);
    case "F":
      return(5);
    case "F#":
      return(6);
    case "G":
      return(7);
    case "G#":
      return(8);
    case "A":
      return(9);
    case "A#":
      return(10);
    case "B":
      return(11);
    default:
      return(0);
    }
  }
  //-----------------------------------------------------------
  static String noteFromIndex(int index_) {
    switch(index_) {
    case 0:
      return("C");
    case 1:
      return("C#");
    case 2:
      return("D");
    case 3:
      return("D#");
    case 4:
      return("E");
    case 5:
      return("F");
    case 6:
      return("F#");
    case 7:
      return("G");
    case 8:
      return("G#");
    case 9:
      return("A");
    case 10:
      return("A#");
    case 11:
      return("B");
    default:
      return("");
    }
  }
  //-----------------------------------------------------------
}
