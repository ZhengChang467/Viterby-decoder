function Y=bpskdecode(X)
%%%%%%%%%%%硬判决解调bpsk%%%%%%%%%%%%%%%
%X为输入序列
%Y为解调后的序列
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 Y=ceil(X/max(abs((X))));  %先对X进行归一化处理，之后向上取整，X>0则为1，X<0则Y=0；
end