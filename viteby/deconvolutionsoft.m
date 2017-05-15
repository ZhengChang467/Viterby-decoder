function Z = deconvolutionsoft(X)
n=length(X);
L=n/2;
Z=zeros(1,L);
M1=zeros(4,L+1);
M2=zeros(4,L+1);
Y1=zeros(4,L*2);
Y2=zeros(4,L*2);
R1=zeros(4,3);
R2=zeros(4,3);
sta1=zeros(4,2);
sta2=zeros(4,2);
reg=[0 0 0];
stafind=zeros(4,2);
for i=1:4
    M1(i,2:3)=de2bi(i-1,2);
    M1(i,1)=1;
    M2(i,2:3)=de2bi(i-1,2);
    M2(i,1)=1;
    [Y1(i,1:4),sta1(i,:),R1(i,:)]=encoding(reg,M1(i,2:3));
    [Y2(i,1:4),sta2(i,:),R2(i,:)]=encoding(reg,M2(i,2:3));
end
for m=1:L-2
    for j=1:4
        M1(j,m+3)=1;
        M2(j,m+3)=0;
        [x1,sta1(j,:),R1(j,:)]=encoding(R1(j,:),1);
        Y1(j,1:2*(2+m))=[Y1(j,1:2*(m+1)),x1];
        [x2,sta2(j,:),R2(j,:)]=encoding(R2(j,:),0);
        Y2(j,1:2*(2+m))=[Y2(j,1:2*(m+1)),x2];
    end
    sta=[sta1;sta2];
    for i=1:8
        if sta(i,1)==0&&sta(i,2)==0&&stafind(1,1)==0
            stafind(1,1)=i;
        elseif sta(i,1)==0&&sta(i,2)==0&&stafind(1,1)~=0
            stafind(1,2)=i;
        elseif sta(i,1)==0&&sta(i,2)==1&&stafind(2,1)==0
            stafind(2,1)=i;
        elseif sta(i,1)==0&&sta(i,2)==1&&stafind(2,1)~=0
            stafind(2,2)=i;
        elseif sta(i,1)==1&&sta(i,2)==0&&stafind(3,1)==0
            stafind(3,1)=i;
        elseif sta(i,1)==1&&sta(i,2)==0&&stafind(3,1)~=0
            stafind(3,2)=i;
        elseif sta(i,1)==1&&sta(i,2)==1&&stafind(4,1)==0
            stafind(4,1)=i;
        elseif sta(i,1)==1&&sta(i,2)==1&&stafind(4,1)~=0
            stafind(4,2)=i;
        end
    end
    for i=1:4
        if stafind(i,1)<=4&&stafind(i,2)<=4
            if distancesoft(Y1(stafind(i,1),1:2*(2+m)),X(1:2*(2+m)))>=distancesoft(Y1(stafind(i,2),1:2*(2+m)),X(1:2*(2+m)))
                M1(stafind(i,1),1)=0;
            else
                M1(stafind(i,2),1)=0;
            end
        elseif stafind(i,1)>4&&stafind(i,2)>4
            if distancesoft(Y2(stafind(i,1)-4,1:2*(2+m)),X(1:2*(2+m)))>=distancesoft(Y2(stafind(i,2)-4,1:2*(2+m)),X(1:2*(2+m)))
                M2(stafind(i,1)-2^2,1)=0;
            else
                M2(stafind(i,2)-2^2,1)=0;
            end
        elseif stafind(i,1)<=4&&stafind(i,2)>4
            if distancesoft(Y1(stafind(i,1),1:2*(2+m)),X(1:2*(2+m)))>=distancesoft(Y2(stafind(i,2)-4,1:2*(2+m)),X(1:2*(2+m)))
                M1(stafind(i,1),1)=0;
            else
                M2(stafind(i,2)-2^2,1)=0;
            end
        elseif stafind(i,1)>4&&stafind(i,2)<=4
            if distancesoft(Y2(stafind(i,1)-4,1:2*(2+m)),X(1:2*(2+m)))>=distancesoft(Y1(stafind(i,2),1:2*(2+m)),X(1:2*(2+m)))
                M2(stdfind(i,1)-2^2,1)=0;
            else
                M1(stdfind(i,2),1)=0;
            end
        end
    end
    Mnew=[M1;M2];
    R=[R1;R2];
    Y=[Y1;Y2];
    j=1;
    for i=1:8
        if Mnew(i,1)==1
            M1(j,:)=Mnew(i,:);
            R1(j,:)=R(i,:);
            Y1(j,:)=Y(i,:);
            j=j+1;
        end
    end
    M2=M1;
    R2=R1;
    Y2=Y1;
end
Mdistancesoft=zeros(4,1);
for i=1:4
    Mdistancesoft(i,1)=distancesoft(Y1(i,:),X);
end
[~,index]=min(Mdistancesoft);
Z=M1(index,2:L+1);
end

