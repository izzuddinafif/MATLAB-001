prompt="Input N: ";
N=input(prompt)
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
T