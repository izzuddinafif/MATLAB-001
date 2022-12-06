% Maintenance Optimisation Model
% This model is a simple example of how to use the maintenance optimisation
clear
tc=2;
tp=1;
k=10;
t=1:10;
N=10;%input('Number of maintenance tasks: ');
tk=ones(1,100);
s=0;
for i=1:N
    for j=1:k
        ak=k+1;
        bk=k+2;
        s=1/(bk*0.00001*(ak+tk(j)));
    end
    av=s/((N-1)*(tc-tp)+s);
end