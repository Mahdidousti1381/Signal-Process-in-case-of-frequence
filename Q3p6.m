clear
clc
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=1; %length of the sampling area
Alpha_1=0.5;
Alpha_2=0.6;
Beta=0.3;
R_1=250 *1e3;
R_2=200 *1e3;
V_1=180 /3.6;
V_2=216 /3.6;
C=3*1e8;
P=2/C;
t_d1=P*R_1;
t_d2=P*R_2;
f_s=100; %sampling frequence
f_c=5;
f_d1=Beta*V_1;
f_d2=Beta*V_2;
t_s=1/f_s; %Time-distance between two samples
N=T/t_s;
t_start=0;
t_end= 1;
t=t_start:t_s:t_end-t_s;
f=-f_s/2:f_s/N:f_s/2-f_s/N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_1 =Alpha_1*cos(2*pi*(f_c + f_d1)*(t-t_d1));
y_2 =Alpha_2*cos(2*pi*(f_c + f_d2)*(t-t_d2));
y_3=y_1 + y_2;%y_3 is receiving signal

figure 
y_F=fftshift(fft(y_3)); %Transforming to recieving signal to fourier form in frequence scale 
y_F=y_F/max(abs(y_F));
[M,i]=maxk(y_F,4);
f_d_match1=abs(f(i(1,3))) - f_c;
f(i(1,3))
V_match1=(f_d_match1/Beta)*3.6
t_d_match1=angle(y_F(i(1,3)))/(-2*pi*f(i(1,3)));
R_match1=t_d_match1/P

f_d_match2=abs(f(i(1,1))) - f_c;
f(i(1,1))
V_match2=(f_d_match2/Beta)*3.6
t_d_match2=angle(y_F(i(1,1)))/(-2*pi*f(i(1,1)));
R_match2=t_d_match2/P

subplot(1,2,1)
plot(t,abs(y_3));
title("recieved signal")
subplot(1,2,2)
plot(f,abs(y_F));
title("recieved signal transformed to fourier space")