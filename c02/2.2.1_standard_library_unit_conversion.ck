TriOsc s => dac;

for (0 => int i; i <= 127; ++i) {
    // midi note to float
    Std.mtof(i) => float hz;
    <<< i, hz >>>;
    hz => s.freq; // set the freq from the conversion
    200::ms => now;
}