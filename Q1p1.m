clear
clc
close all
N=100;
t_s=0.02;
f_s=1/t_s;
t_start=-1;
t_end= 1;
t=t_start:t_s:t_end-t_s;
f=-f_s/2:f_s/N:f_s/2-f_s/N;
x=cos(10*pi*t);
figure
plot(t,x);
title("Part 1-1-A")
figure
subplot(1,2,1)
y=fftshift(fft(x));
y=y/max(abs(y));
plot(f,abs(y));
title("Part 1-1-B (Amplitude)")
subplot(1,2,2)
plot(f,angle(y));
title("Part 1-1-B (Phase)")
