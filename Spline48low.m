function W=Spline48low(N)
W=zeros(N);
for k=0:(N/2-1)
    W(k+1,mod((N-1+2*k  ),N)+1)= sqrt(2)/(8);
    W(k+1,mod((N-1+2*k+1),N)+1)= (3*sqrt(2))/(8);
    W(k+1,mod((N-1+2*k+2),N)+1)= (3*sqrt(2))/(8);
    W(k+1,mod((N-1+2*k+3),N)+1)= sqrt(2)/(8);
    
    W(N/2+k+1,mod((N-3+2*k+7),N)+1)= (3*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+6),N)+1)= (9*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+5),N)+1)=-(7*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+4),N)+1)=-(45*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+3),N)+1)= (45*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+2),N)+1)= (7*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k+1),N)+1)=-(9*sqrt(2))/(64);
    W(N/2+k+1,mod((N-3+2*k  ),N)+1)=-(3*sqrt(2))/(64);
    %k=k+1;
end