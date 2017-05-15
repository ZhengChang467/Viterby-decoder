function Z=viterbisoft(X)
%%%%%%%%%%%%%%%%量化%%%%%%%%%%%%%%%
%X为输入序列
%Z为量化后结果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L=3;
temp=min(X);
    X=X+abs(temp)*ones(1,length(X));
temp1=max(X);
    Z=round((X/temp1)*(2^L-1));
end