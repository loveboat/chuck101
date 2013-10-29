Noise n => Pan2 p => dac;

while (true) {
    // use math.sin to control parameters - here the panning position
    Math.sin(now / 1::second * 2 * pi) => p.pan;
    10::ms => now;     
}