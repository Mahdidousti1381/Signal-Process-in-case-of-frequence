clc 
clear all
close all
n=10000;
n1=9;
n2=1;
Tale=zeros(n,50);
seke=zeros(n,50);
natije=0;
Win=0;
number_Of_CoinToss=zeros(1,n);
ExperimentNum=1:1:n;
for i=1:n
    Win=0;
    n1=9;
    n2=1;
    for j=1:50
        if Win ==0 
      Tale(i,j)=floor(rand/0.45);
      if(Tale(i,j) >= 1)
          n1=n1-1;
          n2=n2+1;
      else
          n2=n2-1;
          n1=n1+1;
      end
      if (n2 ==0 )
          Win=1;
          number_Of_CoinToss(i)=j;
      end
        end
    end
end
TossNumAVG=sum(number_Of_CoinToss)/n
plot(ExperimentNum,number_Of_CoinToss);
hold on
legend("Number Of CoinToss");
plot([1,n],[TossNumAVG,TossNumAVG],"r--",'LineWidth',3,'DisplayName',"Average of coin toss number");
xlabel("Experiment");
ylabel("Number Of CoinToss");