m = open('musica_tp3.mat');

%fs = 44100 Hz 
%Para DSP: fs_max = 11500 Hz

soundsc(m.musica,m.fs,m.nbits)

%Detener reproduccion con: clear sound