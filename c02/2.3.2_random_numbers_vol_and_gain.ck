SqrOsc s => dac;

while (true) {
    Math.random2(20, 500) => int i; 
    Math.random2f(.2, .9) => float v; // volume
    <<< i, v >>>;
    
    i => s.freq;
    v => s.gain;
    
    .5::second => now;
}