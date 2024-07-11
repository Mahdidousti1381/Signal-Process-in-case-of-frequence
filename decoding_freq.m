function decoding_freq(p,bitrate,mapset,f)
flag1=[];
tollpayam=length(p)*bitrate/100;
for u=1:length(p)/100
   y=[];
   y=fftshift(fft(p(:,100*(u-1)+1:100*u)));
    y=y/max(abs(y));
 [o,flag1(u)]=max(abs(y));
end
anssss=-f(flag1);
bedunenoise=[];
for u=1:2^bitrate
bedunenoise(u)=round(50/(2^bitrate+1)*u);
end
for k=1:length(anssss)
    for j=1:length(bedunenoise)
        if anssss(k)>bedunenoise(j)-25/(2^bitrate+1)+1  && anssss(k)<bedunenoise(j)+25/(2^bitrate+1)+-1
            anssss(k)=bedunenoise(j);
        end
    end
end
decoding ='11111';
for s=1:length(p)/100
    decoding=append(decoding,dec2bin(round(anssss(s)*(2^bitrate+1)/50-1),bitrate));
end
payam=cell(2,tollpayam/5);
for w=1:tollpayam/5
  payam{1,w} = extractBetween(decoding,6+(w-1)*5,10+(w-1)*5);
end
for q=1:size(payam,2)
    for z=1:32
        if strcmp(payam{1,q},mapset{2,z})==1
            payam{2,q}=mapset{1,z};
        end
    end
end
fprintf('payam=\n %s','');
for s=1:size(payam,2)
fprintf('%s',payam{2,s})
end