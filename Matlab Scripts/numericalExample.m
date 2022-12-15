% Numerical Example
N=30;%=input('Enter the value of N: ');
x=350;
y=3.85;
dcp=2;
t=0.0001:0.0001:400;
drp=[10,50,100,500];
Rth=[0.313,0.289,0.277,0.265];
no=2; % !!!!!!!!! ganti ini untuk pilih drp (1-4; 1=10, 2=50, dst)
% Step 1: Compute solutions Tk of Equation (11). Theses solutions are functions of reliability threshold Rth
Rrth=0.31;
for k=1:N
    g=k-1;
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(x*(((A(k)/x)^y-(log(Rrth)/B(k)))^(1/y)))-A(k);
        continue
    end
    a(k)=g/(3*g+2);
    A(k)=A(k-1)+(T(k-1)*a(k));
    b(k)=(2*g+3)/(g+2);
    B(k)=B(k-1)*b(k);
    T(k)=(x*(((A(k)/x)^y-(log(Rrth)/B(k)))^(1/y)))-A(k);
end
% Step 2: Use solutions in Step 1 to solve Equation (23) with respect to Rth
drp=drp(no);
for i=1:N
    for j=1:N
        if j==1
            s(j)=1/(B(j)*0.00001*(A(j)+T(j)));
            continue
        end
        s(j)=s(j-1)+(1/(B(j)*0.00001*(A(j)+T(j))));
    end  
    av(i)=s(i)/((i-1)*dcp+drp+s(i));
end
[M,I] = max(av);
disp("Availability = %");
disp(M*100);
disp("Number of maintenance = ");
disp(I);
disp("Rth = %")
disp(Rth(no)*100);
% Step 3: Based on Steps 1 & 2, choose N to maximise the function given by Equation (24). From the plot, N=7 is the optimal value of N.
plot(1:30,av)
grid on
% Step 4: From results of Steps 1 & 2 together with the optimal number N from Step 3, compute Tk (k = 1, . . . , N),
clear T A a B b
Rth=Rth(no);
for k=1:I
    g=k-1;
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(x*(((A(k)/x)^y-(log(Rth)/B(k)))^(1/y)))-A(k);
        continue
    end
    a(k)=g/(3*g+2);
    A(k)=A(k-1)+(T(k-1)*a(k));
    b(k)=(2*g+3)/(g+2);
    B(k)=B(k-1)*b(k);
    T(k)=(x*(((A(k)/x)^y-(log(Rth)/B(k)))^(1/y)))-A(k);
end
disp("T1, ... , Tk = ")
disp(T(1:I))