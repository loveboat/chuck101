<<< "assignment_2_better_late_than_never" >>>;

[50, 52, 53, 55, 57, 59, 60, 62] @=> int notes[]; // D Dorian scale

// setup oscillators
SinOsc s => Gain g => dac;
SqrOsc sq => Pan2 p_sq => g;
//0.1 => sq.gain;
TriOsc t => Pan2 p_t => g;
SawOsc sw => Pan2 p_sw => g;
//0 => sw.gain;
0.25 => g.gain;

Math.srandom(5); // seed with an arbitary number for repeat playthrough

//FIXME make this 30 seconds for submission
//30::second => dur duration;
5::second => dur duration;
2::second => dur fade_length;
.25::second => dur quarter_note;

4 => int count;

now => time start;
while ((start + duration) > now) {
    0 => sw.gain; // silence the buzz saw!
    
    if (start + fade_length > now) {
        <<< "FADE IN" >>>;
        
        fade_length / quarter_note => float steps;
        g.gain() / steps => float gain_increment;
        
        
        <<< "gain inc", gain_increment >>>;
        
    }
    else if (start + (duration - fade_length) < now) {
        <<< "FADE OUT" >>>;
    }
    else {
           
          // pick a random note from the array    
          Math.random2(0, notes.cap() - 1) => int note_index; 
          Std.mtof(notes[note_index]) => float note_freq;
          <<< "note index:", note_index, "midi note:", notes[note_index] >>>;   
          note_freq => s.freq;
           
          // assign the same to the square but down two octaves
          note_freq / 4 => sq.freq;
          // and pan that around
          Math.sin(now / 1::second * 0.2 * pi) => float pan;
     pan => p_sq.pan;
     <<< "pan:", pan >>>;
           
     // assign the original (but up an octave) to the triangle
          note_freq * 2 => t.freq;
          // and modulate the gain (volume) using a sine wave
          Math.fabs(Math.sin(now / 1::second * 0.25 * pi)) => float gain;
     gain => t.gain;
     <<< "t gain:", gain >>>;
       
     // pulse the saw wave every 'bar'
     ++count;
     if (count > 3) {
         0 => count;
         note_freq / 2 => sw.freq;
         
         // use a random gain level to add variation
         Math.random2f(.1, .25) => float sw_gain;
         sw_gain => sw.gain;
         <<< "saw gain:", sw_gain >>>;
     }     
  }        
    
    quarter_note => now;   
}