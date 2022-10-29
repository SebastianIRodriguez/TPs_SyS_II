%% Variables %%
J = 15;
b = 1.1;
L = 2.886e-3;
R = 50.296e-3;
K = 6.7628;

%% Funciones transferencia %%
s = tf([1,0],1);
G = 157.288/(s^2+17.62*s+1065);
Cont = 5*(s+16)/(s*16);

[A,B,C,D] = linmod('Diagrama_motor');

%% FT de U->w
[numu,denu] = ss2tf(A,B,C,D,1);

%% FT de T->w 
[numt,dent] = ss2tf(A,B,C,D,2);

%% Atovalores de A y polos (son iguales)
[autovect,lambda] = eig(A);
polesU = pole(tf(numu,denu));
polesT = pole(tf(numt,dent));

step(tf(440*numu,denu));

%% Plot de w/i
%figure
plot(w.data,i.data,'r'); %g,b
grid on;
xlabel('w [rad/s]');
ylabel('i [A]');
hold on

%% retrato 3D
ci = [65;10];
retrato3d(A,ci,1,10);

%% Diagonalización de A
U=[real(autovect(:,1)), imag(autovect(:,1))];
At = inv(U)*A*U;
cit = inv(U) * ci;
retrato3d(At,cit,1,10);

%% Realimentación
realimentado=feedback(Cont * G, 1);
denr = [16; 281.9 ; 1.783e04 ; 1.258e04];
polosRealimentados = roots(denr);

