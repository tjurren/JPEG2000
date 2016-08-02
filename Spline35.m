function W=Spline35(N)
W=zeros(N);
for k=0:(N/2-1)
    W(k+1,mod((N-2+2*k  ),N)+1)=-sqrt(2)/(8);
    W(k+1,mod((N-2+2*k+1),N)+1)= sqrt(2)/(4);
    W(k+1,mod((N-2+2*k+2),N)+1)= (3*sqrt(2))/(4);
    W(k+1,mod((N-2+2*k+3),N)+1)= sqrt(2)/(4);
    W(k+1,mod((N-2+2*k+4),N)+1)=-sqrt(2)/(8);
    
    W(N/2+k+1,mod((2*k+2),N)+1)= sqrt(2)/(4);
    W(N/2+k+1,mod((2*k+1),N)+1)=-sqrt(2)/(2);
    W(N/2+k+1,mod((2*k  ),N)+1)= sqrt(2)/(4);
    %k=k+1;
end