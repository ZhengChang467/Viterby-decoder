function [BERhard,BERsoft]=viterbi(X,N)%X为待编码的序列
reg=[0 0 0];
con_output=encoding(reg,X);
bpsk_output=bpskencode(con_output);
bpsk_awgn=awgn(bpsk_output,N);
bpskdecode_output=bpskdecode(bpsk_awgn);
vitebidecode=deconvolution(bpskdecode_output);
figure(1);
subplot(2,3,1);
stem(X);
title('原序列');
subplot(2,3,2);
stem(con_output);
title('卷积编码后的序列');
subplot(2,3,3);
stem(bpsk_output);
title('BPSK调制后的序列');
subplot(2,3,4);
stem(bpsk_awgn);
title('通过噪声后的序列');
subplot(2,3,5);
stem(bpskdecode_output);
title('BPSK解调后的序列');
subplot(2,3,6);
stem(vitebidecode);
title('维特比硬判决译码后的序列');
softbpskdecode=viterbisoft(bpsk_awgn);
viterdecodesoft=deconvolutionsoft(softbpskdecode);
figure(2);
subplot(2,3,1);
stem(X);
title('原序列');
subplot(2,3,2);
stem(con_output);
title('卷积编码后的序列');
subplot(2,3,3);
stem(bpsk_output);
title('BPSK调制后的序列');
subplot(2,3,4);
stem(bpsk_awgn);
title('通过噪声后的序列');
subplot(2,3,5);
stem(softbpskdecode);
title('BPSK软解调后的序列');
subplot(2,3,6);
stem(viterdecodesoft);
title('维特比软判决译码后的序列');
BERhard=distance(vitebidecode,X)/length(X)
BERsoft=distance(viterdecodesoft,X)/length(X)
end