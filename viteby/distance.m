function x =distance(a,b)
%%%%%%%%�ȽϺ�����%%%%%%%%
%a,bΪҪ�Ƚϵ�����
%����Ϊx
%%%%%%%%%%%%%%%%%%%%%%%%%%
 if length(a)~=length(b)
     error('�����鳤�Ȳ���ȣ��޷����㺺����')
 else
     x=sum(abs(a-b));   %���㺺����
 end

