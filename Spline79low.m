function W=Spline79low(N)
W=zeros(N);
for k=0:(N/2-1)
    [rf,rd] = biorwavf('boir4.4');
    W(N/2+k+1,mod((N-3+2*k  ),N)+1)=-sqrt(2)*rd(1);
    W(N/2+k+1,mod((N-3+2*k+1),N)+1)= sqrt(2)*rd(2);
    W(N/2+k+1,mod((N-3+2*k+2),N)+1)=-sqrt(2)*rd(3);
    W(N/2+k+1,mod((N-3+2*k+3),N)+1)= sqrt(2)*rd(4);
    W(N/2+k+1,mod((N-3+2*k+4),N)+1)=-sqrt(2)*rd(5);
    W(N/2+k+1,mod((N-3+2*k+5),N)+1)= sqrt(2)*rd(6);
    W(N/2+k+1,mod((N-3+2*k+6),N)+1)=-sqrt(2)*rd(7);
    W(N/2+k+1,mod((N-3+2*k+7),N)+1)= sqrt(2)*rd(8);
    W(N/2+k+1,mod((N-3+2*k+8),N)+1)=-sqrt(2)*rd(9);
    
    W(k+1,mod((N-3+2*k+6),N)+1)=sqrt(2)*rf(1);
    W(k+1,mod((N-3+2*k+5),N)+1)=sqrt(2)*rf(2);
    W(k+1,mod((N-3+2*k+4),N)+1)=sqrt(2)*rf(3);
    W(k+1,mod((N-3+2*k+3),N)+1)=sqrt(2)*rf(4);
    W(k+1,mod((N-3+2*k+2),N)+1)=sqrt(2)*rf(5);
    W(k+1,mod((N-3+2*k+1),N)+1)=sqrt(2)*rf(6);
    W(k+1,mod((N-3+2*k  ),N)+1)=sqrt(2)*rf(7);
end