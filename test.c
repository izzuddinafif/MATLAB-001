#include<math.h>
#include<stdio.h>
int main(void)
{
    int i=4;
    double A[4], B[4], T[4], ak[4], bk[4], h[400], t[400]={0};
    t[0]=0.1;    
    for(int j=0; j<400; j++)
    for(int k=0; k<i; k++)
        {
            double g=k;
            if (k==0)
            {
                A[k]=0;
                B[k]=1;
                T[k]=(40*(pow((pow((A[k]/40),2.5)-(log(0.9)/B[k])),(1/2.5))))-A[k];
                continue;
            }
            ak[k]=g/(3*g+1);
            A[k]=A[k-1]+(T[k-1]*ak[k]);
            bk[k]=(4*g+1)/(3*g+1);
            B[k]=B[k-1]*bk[k];
            T[k]=(40*(pow((pow((A[k]/40),2.5)-(log(0.9)/B[k])),(1/2.5))))-A[k];
        }
        for(int k=0; k<i; k++)
        {
            printf("%g %g %g %g %g\n", T[k], A[k], B[k], ak[k], bk[k]);
        } /* 
        int c=0;
        for(int j=0; j<400; j++)
        {
            t[j]+=0.1;
            if(t[j]==T[c])
            {
                h[j]=B[c]*h[1]*(A[c]+t[j]);
                c=c+1;
                continue;
            }
            h[j]=(2.5/40)*pow(t[j]/40,1.5);
        } */
}