SinOsc s => dac.left;
SinOsc t => dac.right;

220.35 => s.freq;
330.67 => t.freq;

1::second => now;