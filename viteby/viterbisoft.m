function Z=viterbisoft(X)
%%%%%%%%%%%%%%%%����%%%%%%%%%%%%%%%
%XΪ��������
%ZΪ��������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L=3;
temp=min(X);
    X=X+abs(temp)*ones(1,length(X));
temp1=max(X);
    Z=round((X/temp1)*(2^L-1));
end