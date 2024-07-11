clc
clear
close all
%Giving input
f_s=8000;
ts=1/f_s;
tonn=[0.25 0.5];
toff=0.025;
N=8000;
f=-f_s/2:f_s/(N):f_s/2-f_s/N;
prompt = "Enter note then time and press enter: \n";
txt = input(prompt,"s");
inputstr=txt;
number=[];
time=[];
%Reading input and saving data as numeric values
for i=1:4:length(inputstr)
if inputstr(i)=='A'
 number((i-1)/4+1,1)=1;
elseif inputstr(i)=='B'
 number((i-1)/4+1,1)=2;
elseif inputstr(i)=='C'
 number((i-1)/4+1,1)=3;
 elseif inputstr(i)=='D'
 number((i-1)/4+1,1)=4;
 elseif inputstr(i)=='E'
 number((i-1)/4+1,1)=5;
 elseif inputstr(i)=='F'
 number((i-1)/4+1,1)=6;
 elseif inputstr(i)=='G'
 number((i-1)/4+1,1)=7;
 elseif inputstr(i)=='a'
 number((i-1)/4+1,1)=8;
 elseif inputstr(i)=='c'
 number((i-1)/4+1,1)=9;
 elseif inputstr(i)=='d'
 number((i-1)/4+1,1)=10;
elseif inputstr(i)=='f'
 number((i-1)/4+1,1)=11;
 elseif inputstr(i)=='g'
 number((i-1)/4+1,1)=12;
end
end
for u=1:4:length(inputstr)
    if inputstr(u+2)=='1'
 time((u-1)/4+1,1)=1;
elseif inputstr(u+2)=='2'
 time((u-1)/4+1,1)=2;
    end
end
tedadnote=length(number);
fff=[880 987.77 523.25 587.33 659.25 698.46 783.99 932.33 554.37 622.25 739.99 830.61];
t1=0:ts:tonn(time(1))-ts;
t2=0:ts:toff-ts;

y=sin(2*pi*fff(number(1))*t1);
temp0=0*t2;
for q=2:tedadnote 
t11=0:ts:tonn(time(q))-ts;
temp2=sin(2*pi*fff(number(q))*t11);
y=[y temp0];
y=[y temp2];
end
y=[y temp0];

sound(y,f_s)
filename = 'mysong.wav';
audiowrite(filename,y,f_s);