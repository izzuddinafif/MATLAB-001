% Hybrid Hazard Rate Model for Imperfect Preventive Maintenance
% This model is based on the hybrid hazard rate model for imperfect preventive maintenance
clc; clear; close all;
prompt="Input N: ";
x=350;
y=3.85;
r=0.01:0.01:1;
drp=10;
dcp=2;
Tc=4;
Tp=2;
N=30;%input(prompt)
h=@(zs) (y/x)*(zs/x).^(y-1);
datetime
for i=1:100
    for k=1:N
        if k==1
            A(k)=0;
            B(k)=1;
            T(k)=(x*(((A(k)/x)^y-(log(r(i))/B(k)))^(1/y)))-A(k);
            R=@(t) exp(-B(k)*integral(h,A(k),t+A(k),'ArrayValued',true));
            ss(k)=integral(R,0,T(k),'ArrayValued',true);
            av(i,k)=ss(k)/((k-1)*dcp+drp+ss(k));
            %av(i,k)=ss(k)/(((k-1)*(Tc*(1-r(i))+Tp*r(i)))+drp+ss(k));
            continue
        end
        g=k-1;
        ak(k)=g/(3*g+2);
        A(k)=A(k-1)+(T(k-1)*ak(k));
        bk(k)=(2*g+3)/(g+2);
        B(k)=B(k-1)*bk(k);
        T(k)=(x*(((A(k)/x)^y-(log(r(i))/B(k)))^(1/y)))-A(k);
        R=@(t) exp(-B(k)*integral(h,A(k),t+A(k),'ArrayValued',true));
        ss(k)=ss(k-1)+integral(R,0,T(k),'ArrayValued',true);
        av(i,k)=ss(k)/((k-1)*dcp+drp+ss(k));
        %av(i,k)=ss(k)/(((k-1)*(Tc*(1-r(i))+Tp*r(i)))+drp+ss(k));
    end
    [Av(i),n(i)]=max(av(i,:));
end
datetime
[A,I]=max(Av);
disp(A*100)
disp(I)