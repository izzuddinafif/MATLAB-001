clear
close
i=4;
t=0.0001:0.0001:40;
tt=0.0001:0.0001:40;
for k=1:i
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(40*(((A(k)/40)^2.5-(log(0.9)/B(k)))^(1/2.5)))-A(k);
        T(k)=round(T(k), 4);
        continue
    end
    g=k-1;
    ak(k)=g/(3*g+1);
    A(k)=A(k-1)+(T(k-1)*ak(k));
    bk(k)=(4*g+1)/(3*g+1);
    B(k)=B(k-1)*bk(k);
    T(k)=(40*(((A(k)/40)^2.5-(log(0.9)/B(k)))^(1/2.5)))-A(k);
    T(k)=round(T(k), 4);
end
d=ones(1,5);
dd=ones(1,4);
flag=0;
f=zeros(1,4);
TT(1)=T(1);
for c=1:4
    if 1<c
        TT(c)=TT(c-1)+T(c);
        TT(c)=round(TT(c), 4);
    end
end
for c=1:4
    d(c+1)=TT(c)*10000;
    dd(c)=d(c)-T(c)*10000;
    if c==1
        dd(c)=1;
    end
end
h=ones(1,400000);
for c=1:4
    e=1;
    for j=d(c):400000
        flag=0;
        if t(j)==TT(c)  
            if c==4
                flag=1;
                continue;
            else
                h(j)=B(c)*h(e)*(A(c)+t(e));
                flag=1;
                break;
            end
        elseif t(j)~=TT(c)
            if flag==1
                break;
            end
        h(j)=(2.5/40)*((t(e)/40)^(1.5)); %problem is here
        e=e+1;
        end
    end
    e
    %if flag==1
    %    continue;
    %end
end
figure()
plot(t,h);
ylim([0 0.03]);