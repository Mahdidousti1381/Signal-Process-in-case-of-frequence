clc
close all;
clear;
f_s=8000;
ts=1/f_s;
tonn=[0.25 0.5];
toff=0.025;
N=8000;
f=-f_s/2:f_s/(N):f_s/2-f_s/N;
[y,fs]=audioread('a.wav');
x=find(y==0);
z=[1];
for r=1:length(x)
   c=mod(x(r),200);
       if c==1 && y(x(r)+1)==0 && y(x(r)+2)==0
        z=[z x(r)];
       end
end
flag1=[];
anstime=[];
   RR=y(z(1):z(1+1)-1);
   tt=fftshift(fft(y(z(1):z(1+1)-1)));
 [o,flag1(1)]=max(abs(tt));
 flag1(1)=flag1(1)*(8000/(z(2)-z(1)));
 anstime(1)=(z(2)-z(1))/2000;
for u=2:length(z)-1
   RR=y(z(u):z(u+1)-1);
   tt=fftshift(fft(y(z(u)+200:z(u+1)-1)));
 [o,flag1(u)]=max(abs(tt));
 flag1(u)=flag1(u)*(8000/(z(u+1)-z(u)-200));
 anstime(u)=(z(u+1)-z(u)-200)/2000;
end
ansnote=-f(flag1);
for i=1:length(ansnote)
    if ansnote(i)>515 && ansnote(i)<540
        fprintf('C');
    elseif ansnote(i)>540 && ansnote(i)<570
        fprintf('C#');
        elseif ansnote(i)>570 && ansnote(i)<600
        fprintf('D');
        elseif ansnote(i)>600 && ansnote(i)<640
        fprintf('D#');
        elseif ansnote(i)>640 && ansnote(i)<680
        fprintf('E');
        elseif ansnote(i)>680 && ansnote(i)<720
        fprintf('F');
        elseif ansnote(i)>720 && ansnote(i)<760
        fprintf('F#');
        elseif ansnote(i)>760 && ansnote(i)<800
        fprintf('G');
        elseif ansnote(i)>800 && ansnote(i)<840
        fprintf('G#');
        elseif ansnote(i)>840 && ansnote(i)<900
        fprintf('A');
        elseif ansnote(i)>900 && ansnote(i)<950
        fprintf('A#');
        elseif ansnote(i)>950 && ansnote(i)<1000
        fprintf('B');
    end
    fprintf(' %d ',anstime(i))
end