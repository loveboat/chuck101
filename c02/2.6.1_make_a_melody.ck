[54, 56, 62, 54, 48, 50, 52] @=> int a[];
[.5, .2, .4, .6, .5, .3, .4] @=> float notes[];

SqrOsc s => dac;
0.05 => s.gain;

for (0 => int i; i < a.cap(); ++i) {
    <<< i, a[i] >>>;          // print index and value
    Std.mtof(a[i]) => s.freq; // convert note to freqency
    notes[i]::second => now;  // use time array to drive melody
}