function W=DaubechiesSix(N)
W=zeros(N);
for k=0:(N/2-1)
    W(k+1,mod((2*k  ),N)+1)=sqrt(2)/(32)*(1+sqrt(10)-   sqrt(5+2*sqrt(10) ) );
    W(k+1,mod((2*k+1),N)+1)=sqrt(2)/(32)*(5+sqrt(10)- 3*sqrt(5+2*sqrt(10) ) );
    W(k+1,mod((2*k+2),N)+1)=sqrt(2)/(32)*(10-2*sqrt(10)-2*sqrt(5+2*sqrt(10)));
    W(k+1,mod((2*k+3),N)+1)=sqrt(2)/(32)*(10-2*sqrt(10)+2*sqrt(5+2*sqrt(10)));
    W(k+1,mod((2*k+4),N)+1)=sqrt(2)/(32)*(5+sqrt(10)+ 3*sqrt(5+2*sqrt(10) ) );
    W(k+1,mod((2*k+5),N)+1)=sqrt(2)/(32)*(1+sqrt(10)+   sqrt(5+2*sqrt(10) ) );
    
    W(N/2+k+1,mod((2*k+5),N)+1)= sqrt(2)/(32)*(1+sqrt(10)-   sqrt(5+2*sqrt(10) ) );
    W(N/2+k+1,mod((2*k+4),N)+1)=-sqrt(2)/(32)*(5+sqrt(10)- 3*sqrt(5+2*sqrt(10) ) );
    W(N/2+k+1,mod((2*k+3),N)+1)= sqrt(2)/(32)*(10-2*sqrt(10)-2*sqrt(5+2*sqrt(10)));
    W(N/2+k+1,mod((2*k+2),N)+1)=-sqrt(2)/(32)*(10-2*sqrt(10)+2*sqrt(5+2*sqrt(10)));
    W(N/2+k+1,mod((2*k+1),N)+1)= sqrt(2)/(32)*(5+sqrt(10)+ 3*sqrt(5+2*sqrt(10) ) );
    W(N/2+k+1,mod((2*k  ),N)+1)=-sqrt(2)/(32)*(1+sqrt(10)+   sqrt(5+2*sqrt(10) ) );
end