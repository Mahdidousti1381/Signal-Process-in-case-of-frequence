clear
clc
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=1; %length of the sampling area
Alpha=0.5;
Beta=0.3;
R=250 *1e3;
V=180 /3.6;
C=3*1e8;
P=2/C;
t_d=P*R;
f_s=100; %sampling frequence
f_c=5;
f_d=Beta*V;
t_s=1/f_s; %Time-distance between two samples
N=T/t_s;
t_start=0;
t_end= 1;
t=t_start:t_s:t_end-t_s;
f=-f_s/2:f_s/N:f_s/2-f_s/N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_3 =Alpha*cos(2*pi*(f_c + f_d)*(t-t_d));%recieving signal

figure 
y_F=fftshift(fft(y_3)); %Transforming to recieving signal to fourier form in frequence scale 
y_F=y_F/max(abs(y_F));
subplot(1,2,1)
plot(t,abs(y_3));
title("recieved signal")
subplot(1,2,2)
plot(f,abs(y_F));
title("recieved signal transformed to fourier space")

[M,i]=max(y_F);
f_d_match=abs(f(i)) - f_c;
V_match=(f_d_match/Beta)*3.6
t_d_match=angle(y_F(i))/(-2*pi*f(i));
R_match=t_d_match/P

