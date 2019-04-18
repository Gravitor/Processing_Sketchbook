import processing.sound.*;

Scale C = new Scale("C");
int index;
ArrayList<Note> toPlay = new ArrayList<Note>();

void setup() {
  size(800, 600);
  frameRate(2);

  for (Note note : C.notes) {
    toPlay.add(note);
  }
}      

void draw() {

  if(index != 0){
    toPlay.get(index - 1).Stop();
  }
  toPlay.get(index).Play();
  
  index = (index + 1) % 7;
}
