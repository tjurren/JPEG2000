function W=DaubechiesFour(N)
W=zeros(N);
for k=0:(N/2-1)
    W(k+1,mod((2*k  ),N)+1)=1/(4*sqrt(2))*(1-sqrt(3));
    W(k+1,mod((2*k+1),N)+1)=1/(4*sqrt(2))*(3-sqrt(3));
    W(k+1,mod((2*k+2),N)+1)=1/(4*sqrt(2))*(3+sqrt(3));
    W(k+1,mod((2*k+3),N)+1)=1/(4*sqrt(2))*(1+sqrt(3));
    
    W(N/2+k+1,mod((2*k+3),N)+1  )= 1/(4*sqrt(2))*(1-sqrt(3));
    W(N/2+k+1,mod((2*k+2),N)+1)=-1/(4*sqrt(2))*(3-sqrt(3));
    W(N/2+k+1,mod((2*k+1),N)+1)= 1/(4*sqrt(2))*(3+sqrt(3));
    W(N/2+k+1,mod((2*k  ),N)+1)=-1/(4*sqrt(2))*(1+sqrt(3));
    %k=k+1;
end