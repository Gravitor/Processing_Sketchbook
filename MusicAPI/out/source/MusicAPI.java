import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class MusicAPI extends PApplet {



Scale C = new Scale("C");
int index;
ArrayList<Note> toPlay = new ArrayList<Note>();

public void setup() {
  
  frameRate(2);

  for (Note note : C.notes) {
    toPlay.add(note);
  }
}      

public void draw() {

  if(index != 0){
    toPlay.get(index - 1).Stop();
  }
  toPlay.get(index).Play();
  
  index = (index + 1) % 7;
}
class Scale {
  int deg;
  String[] scaleDef;
  Note[] notes;

  Scale(String k) {
    scaleDef = getScaleFromKey(k);
    notes = notesFromDef(scaleDef, 0.1f, 4);
  }

  public String[] getScaleFromKey(String k) {
    int[] Is = new int[7];
    String[] scale_ = new String[7];
    int root = NoteRef.indexFromNote(k);

    Is[0] = root;
    Is[1] = (root + 2) % 12;
    Is[2] = (root + 4) % 12;
    Is[3] = (root + 5) % 12;
    Is[4] = (root + 7) % 12;
    Is[5] = (root + 9) % 12;
    Is[6] = (root + 11) % 12;

    for (int i = 0; i < Is.length; i++) {
      scale_[i] = NoteRef.noteFromIndex(Is[i]);
    }
    return scale_;
  }

  public Note[] notesFromDef(String[] def, float amp, int oct) {
    Note[] scale_ = new Note[7];

    for (int i = 0; i < 7; i++) {
      scale_[i] = new Note(def[i], amp, oct);
    }
    return scale_;
  }
}


class Chord {
  String note;
  String type;
  Chord(String note_, String type_) {
    note = note_;
    type = type_;
  }

  public void Play() {}
}

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

  public void Play() {
    sound.play();
  }
  public void Stop(){
    sound.stop();
  }

  public SinOsc waveConstructor() {
    SinOsc sin = new SinOsc(sketch);
    sin.freq(freq);
    sin.amp(amp);
    return sin;
  }
} 
static class NoteRef {
  //-----------------------------------------------------------
  public static float freqFromNote(String note_, int oct_) {
    switch(note_) {
    case "C":
      return(16.35f * pow(2, oct_));
    case "C#":
      return(17.32f * pow(2, oct_));
    case "D":
      return(18.35f * pow(2, oct_));
    case "D#":
      return(19.45f * pow(2, oct_));
    case "E":
      return(20.60f * pow(2, oct_));
    case "F":
      return(21.83f * pow(2, oct_));
    case "F#":
      return(23.12f * pow(2, oct_));
    case "G":
      return(24.50f * pow(2, oct_));
    case "G#":
      return(25.96f * pow(2, oct_));
    case "A":
      return(27.50f * pow(2, oct_));
    case "A#":
      return(29.14f * pow(2, oct_));
    case "B":
      return(30.87f * pow(2, oct_));
    default:
      return(0);
    }
  }
  //-----------------------------------------------------------
  public static int indexFromNote(String note_) {
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
  public static String noteFromIndex(int index_) {
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
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MusicAPI" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
