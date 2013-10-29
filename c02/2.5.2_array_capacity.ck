[54, 56, 62, 54, 48, 50, 52] @=> int a[];

// capacity (length) of 'a'
<<< a.cap() >>>;

SqrOsc s => dac;
0.05 => s.gain;

for (0 => int i; i < a.cap(); ++i) {
    <<< i, a[i] >>>; // print index and value
    Std.mtof(a[i]) => s.freq; // convert note to freqency
    .5::second => now;
}