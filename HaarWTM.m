function W=HaarWTM(N) % Wavelet Transform Matrix
W=zeros(N);
for k=1:N/2
    W(k,2*k)=1/2;
    W(k,2*k-1)=1/2;
    W(N/2+k,2*k)=1/2;
    W(N/2+k,2*k-1)=-1/2;
end