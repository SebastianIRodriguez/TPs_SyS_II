%% Varaibles %%
J = 15;
b = 1.1;
L = 2.886e-3;
R = 50.296e-3;
K = 6.7628;

%% Señales de entrada %%
U = frest.createStep('StepTime',0,'StepSize',440,'FinalTime',1);
T = frest.createStep('StepTime',0,'StepSize',0,'FinalTime',1);

%% Funciones transferencia %%
s = tf([1,0],1);
G = 157.288/(s^2+17.62*s+1065);
C = 5*(s+16)/(16*s);

[A,B,C,D] = linmod('Diagrama_motor');

%% FT de U->w
[numu,denu] = ss2tf(A,B,C,D,1);

%% FT de T->w 
[numt,dent] = ss2tf(A,B,C,D,2);

%% Atovalores de A y polos (son iguales)
lambda = eig(A);
polesU = pole(tf(numu,denu));
polesT = pole(tf(numt,dent));

step(tf(440*numu,denu));

figure
plot(i);
grid on;
xlabel('Tiempo [s]');
ylabel('Corriente');

hold;

plot(w * 100);
grid on;
xlabel('Tiempo [s]');
ylabel('Velocidad angular');