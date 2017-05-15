function x =distance(a,b)
%%%%%%%%比较汉明距%%%%%%%%
%a,b为要比较的码组
%距离为x
%%%%%%%%%%%%%%%%%%%%%%%%%%
 if length(a)~=length(b)
     error('两码组长度不相等！无法计算汉明距')
 else
     x=sum(abs(a-b));   %计算汉明距
 end

