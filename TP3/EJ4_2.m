% 4. Diseno de un ecualizador basico mediante filtros digitales
% Una vez obtenida la senal adecuadamente muestreada a la frecuencia fs
% se desea dividirla en 3 bandas:
% de 0 a 600 Hz, de 600 a 1500 Hz y de 1500 Hz en adelante. 
% Se pide disenar entonces el ecualizador basico mediante
% filtros FIR y filtros IRR.

%2. Filtros IIR.
%% a.
% Disenar filtros IIR para obtener la separacion en bandas deseada,
% mediante el diseno de filtros analogicos y aplicacion de la transformacion
% bilineal.
fs = 11025;
at_max = 1;
at_min = 20;

%% Pasabajo: 0-600 Hz
wp_pb = 600 / (fs / 2);
wa_pb = 650 / (fs / 2);

[n_pb,wn_pb] = cheb1ord(wp_pb, wa_pb, at_max, at_min);
[num_pb,den_pb] = cheby1(n_pb, at_max, wn_pb);

freqz(num_pb, den_pb, 512, fs); 

%% Pasabanda: 600-1500 Hz
wa_pbn = [500 1600] ./ (fs / 2);
wp_pbn = [600 1500] ./ (fs / 2);

[n_pbn,wn_pbn] = cheb1ord(wp_pbn, wa_pbn, at_max, at_min);
[num_pbn,den_pbn] = cheby1(n_pbn, at_max, wn_pbn);

freqz(num_pbn, den_pbn, 512, fs); 

%% Pasaaltos: 1500+ Hz
wa_pa = 1400 / (fs / 2);
wp_pa = 1500 / (fs / 2);

[n_pa,wn_pa] = cheb1ord(wp_pa, wa_pa, at_max, at_min);
[num_pa,den_pa] = cheby1(n_pa, at_max, wn_pa, 'high');

freqz(num_pa, den_pa, 512, fs); 

%% b.
% Filtrar la senal de audio mediante cada uno de los filtros disenados y
% escuchar las senales resultantes.

%% Escuchar Pasabajo
filtrada_pb = filter(num_pb, den_pb, sound3.Data);
soundsc(filtrada_pb, 11025, 16)

%% Escuchar Pasabanda
filtrada_pbn = filter(num_pbn, den_pbn, sound3.Data);
soundsc(filtrada_pbn, 11025, 16)

%% Escuchar Pasaalto
filtrada_pa = filter(num_pa, den_pa, sound3.Data);
soundsc(filtrada_pa, 11025, 16)
