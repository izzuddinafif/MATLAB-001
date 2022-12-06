% Hybrid Hazard Rate Model for Imperfect Preventive Maintenance
% This model is based on the hybrid hazard rate model for imperfect preventive maintenance
prompt="Input N: ";
r=0.9;
x=40;
y=2.5;
N=30%input(prompt)
for k=1:N
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(x*(((A(k)/x)^y-(log(r)/B(k)))^(1/y)))-A(k);
        T(k)=round(T(k), N);
        continue
    end
    g=k-1;
    ak(k)=g/(3*g+1);
    A(k)=A(k-1)+(T(k-1)*ak(k));
    bk(k)=(4*g+1)/(3*g+1);
    B(k)=B(k-1)*bk(k);
    T(k)=(x*(((A(k)/x)^y-(log(r)/B(k)))^(1/y)))-A(k);
    T(k)=round(T(k), N);
end
T