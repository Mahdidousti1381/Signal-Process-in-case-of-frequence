function [p]=coding_freq(y,bitrate,mapset)
x=[];
var=1.5;
a=length(y);
for i=1:length(y)
for j=1:32
    if strcmp(mapset(1,j),y(i))==1
    x(i)=j;
    end
end
end
ccp=31;
final='11111';
for s=1:length(x)
   final=append(final,dec2bin(x(s)-1,5));
end
tollpayam=length(final)-5;
signal= cell(1);
for h=1:bitrate:tollpayam
signal{(h-1)/bitrate +1}=bin2dec(extractBetween(final,5+h,4+h+bitrate));
end
signalf=cell(1);
for r=1:length(signal)
    signalf{r}=round((signal{r}+1)/(2^bitrate+1)*50);
end
k = linspace(0,1,100);
t=[];
p=[];
for m=1:length(signal)
temp = linspace(m-1,m,100);
temp2=sin(2*pi*signalf{m}*k);
random=var*randn(1,100);
temp2=temp2+random;
t =[t temp];
p=[p temp2];
end
plot(t,p)


