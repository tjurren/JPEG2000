

function W=TransformAlg(I,iteration) % Wavelet Transform Matrix
import HaarWTM.m.*  % Imports HWT function.
[M,N]=size(I);
for i=1:iteration
    M=2*fix(M/2);                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    N=2*fix(N/2);                   %    Making the Haar Wavelet            %
    Wm=HaarWTM(M);                  %    Transform Matrices for M,N lengths %
    Wn=HaarWTM(N);                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ResizeI=double(I(1:M,1:N));     %    This is the new picture matrix,    %
    W=Wm*ResizeI*Wn';           % <- after HWT is applied.              %
    subplot(4,(iteration),(i+iteration)); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    imshow(W,[0,255]);title('Haar Transform of Picture');
    I=W;
end