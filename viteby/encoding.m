function [x,y,z]=encoding(reg,X)
%%%%%%%%%%%参数设置%%%%%%%%%%%
%本函数计算[2,1,3]卷积码
%X为信息序列
%输出x为输出序列
%输出y为最终状态状态
%%%%%%%%%%%卷积编码%%%%%%%%%%%
    n=length(X);
    Y=reg;         %初始化移位寄存器
    for i=1:n
        Y(1)=Y(2);
        Y(2)=Y(3);
        Y(3)=X(i);
        x(2*(i-1)+1)=mod(sum(Y),2); 
        x(2*(i-1)+2)=mod((Y(1)+Y(3)),2);
    end
    y=[Y(2),Y(3)];
    z=Y;
end

