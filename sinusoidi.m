%%Programma utile al plot di una terna sinusoidale di tensioni
%
clear; close all; clc; %precaricamento programma
%PARAMETRI RETE
periodi = 1; %Definisci il numero di periodi da rappresentare
f = 50;  %Frequenza di rete
Vrms = 220; %Valore efficace tensione stellata

%PARAMETRI TRASFORMATORE
V1n = 400; %Tensioni nominali primario e secondario
V2n = 42;
N = V2n/V1n; %Rapporto di trasformazione definito al contrario per comodità

%PARAMETRI PLOT
plot_width = 2;
size = 100;

%CALCOLO
t = linspace(0,periodi/f,size);
omega = 2*pi*f;
Vp = sqrt(2)*Vrms;
V1 = Vp*sin(omega*t);
V2 = Vp*sin(omega*t-2*pi/3);
V3 = Vp*sin(omega*t-4*pi/3);
figure();
hold on; grid on;
set(gca,'LineWidth',plot_width-1);
x = t*1000; %Ai fini della rappresentazione dei tempi
q = plot(x,V1,x,V2,x,V3);
plot([0 x(end)],[0 0],'Color','k');
legend('R','S','T');
ylabel('Tensione [V]');
xlabel('Tempo [ms]');

for n = 1:3
q(n).LineWidth = plot_width;
end
%xlim([0 x(end)]);
%% Part 2
%close all;
figure(2); %Plot concatenate raddrizzate in uscita dal trasformatore
hold on; grid on;
set(gca,'LineWidth',plot_width-1);
V12 = N*(V1-V2);
V13 = N*(V1-V3);
V23 = N*(V2-V3);

V21 = N*(V2-V1);
V31 = N*(V3-V1);
V32 = N*(V3-V2);
%x = x*omega/1000/pi;

p = plot(x,V12,x,V13,x,V23,x,V21,x,V31,x,V32);
%ylim([49 57]);
ylabel('Tensione [V]');
xlabel('Tempo [ms]');
plot([0 x(end)],[0 0],'Color','k');
legend('V_{12}','V_{13}','V_{23}','V_{21}','V_{31}','V_{32}');

%Costrutto per modificare lo spessore delle linee
for n = 1:6
p(n).LineWidth = plot_width;
end

%% plot coppolette

 alpha = 0; %angolo in gradi
 alpha = alpha*pi/180; %passo in radianti
 T = 1/f*1000;

xx = zeros(7,size);
 a = alpha*T/2/pi;
for k=1:7
    if k == 1
       xx(k,:) = linspace(0+a,T/12+a,size);    
    elseif k == 7
       xx(k,:) = linspace(11/12*T+a,T+a,size);
    else
        xx(k,:) = linspace(xx(k-1,end),xx(k-1,end)+T/6+a,size);
    end
end
%vabbè faccio prima a ridefinire tutto :)

figure(); hold on; grid on;
xlim([0 20]);
yy = zeros(7,size);
for k=1:7
    if k ==1
        yy(k,:) = N*sqrt(3)*Vp*cos(omega*xx(k,:)/1000);
        plot(xx(k,:),yy(k,:));
    else
        yy(k,:) = N*sqrt(3)*Vp*sin(omega*xx(2,:)/1000);
        plot(xx(k,:),1);
    end
end


% for k=1:7
%    plot (xx(k),Vp*sqrt(3)*cos(xx(k)));
% end
