% Numerical Example
N=100;%=input('Enter the value of N: ');
x=350;
y=3.85;
dcp=2;
drp=[10,50,100,500];

% Step 1: Compute solutions Tk of Equation (11). Theses solutions are functions of reliability threshold Rth
Rth=0.277;
drp=drp(3);
for k=1:30
    g=k-1;
    if k==1
        A(k)=0;
        B(k)=1;
        T(k)=(x*(((A(k)/x)^y-(log(Rth)/B(k)))^(1/y)))-A(k);
        continue
    end
    a(k)=g/(3*g+2);
    A(k)=A(k-1)+(T(k-1)*a(k));
    bk(k)=(2*g+3)/(g+2);
    B(k)=B(k-1)*bk(k);
    T(k)=(x*(((A(k)/x)^y-(log(Rth)/B(k)))^(1/y)))-A(k);
end

% Step 2: Use solutions in Step 1 to solve Equation (23) with respect to Rth
t=1:1:10;
N=30;%input('Number of maintenance tasks: ');
h1a=(y/x)*((t(1)/x)^(y));
h1b=(t(1)/x)^(y);
s=zeros(1,30);
av=zeros(1,30);
for i=1:N
    for j=1:N
        if j==1
            s(j)=1/(B(j)*0.00001*(A(j)+T(j)));
            continue
        end
        s(j)=s(j-1)+(1/(B(j)*0.00001*(A(j)+T(j))));
    end  
    av(i)=s(i)/((i-1)*1+drp+s(i));
end

% Step 3: Based on Steps 1 & 2, choose N to maximise the function given by Equation (24). From the plot, N=7 is the optimal value of N.
plot(1:30,av)

% Step 4: From results of Steps 1 & 2 together with the optimal number N from Step 3, compute Tk (k = 1, . . . , N),
disp("T1, T2, T3, T4, T5, T6, T7 :")
disp(T(1:7))