SinOsc s => Pan2 p => dac;

1.0 => float pan_position;

while (pan_position > -1.0) {
    
    pan_position => p.pan;
    <<< pan_position >>>;
    
    pan_position -.01 => pan_position;
    .01::second => now;    
}
