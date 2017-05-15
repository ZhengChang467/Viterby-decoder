% X=round(rand(1,20000));
% m=0;
% %hardber=zeros(1,m);
% softber=zeros(1,m);
% i=1;
% for N=-6:6
%     [soft]=viterbi(X,N);
%     %hardber(i)=hard;
%     softber(i)=soft;
%     i=i+1;
% end
time=zeros(1,100);
i=1;
for N=100:100:5000
    tic;
    X=round(rand(1,N));
    [hard,soft]=viterbi(X,1);
    time(i)=toc;
    i=i+1;
end