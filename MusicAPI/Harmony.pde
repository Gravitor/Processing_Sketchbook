class Scale {
  int deg;
  String[] scaleDef;
  Note[] notes;

  Scale(String k) {
    scaleDef = getScaleFromKey(k);
    notes = notesFromDef(scaleDef, 0.1, 4);
  }

  String[] getScaleFromKey(String k) {
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

  Note[] notesFromDef(String[] def, float amp, int oct) {
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

  void Play() {}
}