function W=CDF79(N)
W=zeros(N);
for k=0:(N/2-1)
    W(N/2+k+1,mod((N-2+2*k  ),N)+1)=-0.064539;
    W(N/2+k+1,mod((N-2+2*k+1),N)+1)= 0.040689;
    W(N/2+k+1,mod((N-2+2*k+2),N)+1)= 0.418092;
    W(N/2+k+1,mod((N-2+2*k+3),N)+1)=-0.788486;
    W(N/2+k+1,mod((N-2+2*k+4),N)+1)= 0.418092;
    W(N/2+k+1,mod((N-2+2*k+5),N)+1)= 0.040689;
    W(N/2+k+1,mod((N-2+2*k+6),N)+1)=-0.064539;
    
    W(k+1,mod((N-4+2*k+8),N)+1)= 0.037829;
    W(k+1,mod((N-4+2*k+7),N)+1)=-0.023850;
    W(k+1,mod((N-4+2*k+6),N)+1)=-0.110624;
    W(k+1,mod((N-4+2*k+5),N)+1)= 0.377403;
    W(k+1,mod((N-4+2*k+4),N)+1)= 0.852699;
    W(k+1,mod((N-4+2*k+3),N)+1)= 0.377403;
    W(k+1,mod((N-4+2*k+2),N)+1)=-0.110624;
    W(k+1,mod((N-4+2*k+1),N)+1)=-0.023850;
    W(k+1,mod((N-4+2*k  ),N)+1)= 0.037829;
    %k=k+1;
end