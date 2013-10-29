// assign audio to each channel
SinOsc s => dac.chan(0);
SinOsc t => dac.chan(1);

// NullPointerException if the channel doesn't exist
//SinOsc u => dac.chan(2);
//SinOsc v => dac.chan(3);

