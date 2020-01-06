%%Programma utile al plot di una terna sinusoidale di tensioni
%
clear; close all; clc; %precaricamento programma
%PARAMETRI RETE
periodi = 2; %Definisci il numero di periodi da rappresentare
f = 50;  %Frequenza di rete
Vrms = 220; %Valore efficace tensione stellata

%PARAMETRI TRASFORMATORE
V1n = 400; %Tensioni nominali primario e secondario
V2n = 42;
N = V2n/V1n; %Rapporto di trasformazione definito al contrario per comodità


%CALCOLO
t = linspace(0,periodi/f,1000);
omega = 2*pi*f;
Vp = sqrt(2)*Vrms;
V1 = Vp*sin(omega*t);
V2 = Vp*sin(omega*t-2*pi/3);
V3 = Vp*sin(omega*t-4*pi/3);
figure();
hold on; grid on;
x = t*1000; %Ai fini della rappresentazione dei tempi
plot(x,V1,x,V2,x,V3);
plot([0 x(end)],[0 0],'Color','k');
legend('R','S','T');
ylabel('Tensione [V]');
xlabel('Tempo [ms]');
%xlim([0 x(end)]);

figure(); %Plot concatenate raddrizzate in uscita dal trasformatore
hold on; grid on;
V12 = N*(V1-V2);
V13 = N*(V1-V3);
V23 = N*(V2-V3);
%x = x*omega/1000/pi;
plot(x,V12,x,V23,x,V13);
%ylim([49 57]);
ylabel('Tensione [V]');
xlabel('Tempo [ms]');


