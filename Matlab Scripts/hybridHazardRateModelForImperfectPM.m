i=4;
for(k=1:i)
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(40*(((A(k)/40)^2.5-(log(0.9)/B(k)))^(1/2.5)))-A(k);
        continue
    end
    ak=k/(3*k+1);
    A(k)=A(k-1)+(T(k-1)*ak);
    bk=(4*k+1)/(3*k+1);
    B(k)=B(k-1)*bk;
    T(k)=(40*(((A(k)/40)^2.5-(log(0.9)/B(k)))^(1/2.5)))-A(k);
end
T