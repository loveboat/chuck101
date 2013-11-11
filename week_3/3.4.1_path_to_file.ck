// sound chain
SndBuf mySound => dac;

// directory of this file
me.dir() => string path;
//<<< path >>>;

"/audio/snare_01.wav" => string filename;
path + filename => filename;
<<< filename >>>;