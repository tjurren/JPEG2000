function W=CoifletSix(N)
W=zeros(N);
for k=0:(N/2-1)
    W(k+1,mod((2*k  ),N)+1)=1/(16*sqrt(2))*(-3+sqrt(7));
    W(k+1,mod((2*k+1),N)+1)=1/(16*sqrt(2))*(1-sqrt(7));
    W(k+1,mod((2*k+2),N)+1)=1/(8 *sqrt(2))*(7-sqrt(7));
    W(k+1,mod((2*k+3),N)+1)=1/(8 *sqrt(2))*(7+sqrt(7));
    W(k+1,mod((2*k+4),N)+1)=1/(16*sqrt(2))*(5+sqrt(7));
    W(k+1,mod((2*k+5),N)+1)=1/(16*sqrt(2))*(1-sqrt(7));
    
    W(N/2+k+1,mod((2*k+5),N)+1)= 1/(16*sqrt(2))*(-3+sqrt(7));
    W(N/2+k+1,mod((2*k+4),N)+1)= 1/(16*sqrt(2))*(1-sqrt(7));
    W(N/2+k+1,mod((2*k+3),N)+1)= 1/(8 *sqrt(2))*(7-sqrt(7));
    W(N/2+k+1,mod((2*k+2),N)+1)= 1/(8 *sqrt(2))*(7+sqrt(7));
    W(N/2+k+1,mod((2*k+1),N)+1)= 1/(16*sqrt(2))*(5+sqrt(7));
    W(N/2+k+1,mod((2*k  ),N)+1)= 1/(16*sqrt(2))*(1-sqrt(7));
end