%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%   Programmers:  Milen Rashkov										   %
%   Assignment:   Homework Set #2:  Picture Haar Wavelet Transform     %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;              % Clears any previous work done in Matlab.
import HaarWTM.m.*  % Imports HWT function.

fprintf('///////////////////////////////////////////////////////////// \n');
fprintf('//     Welcome to the Picture Compression Test Program.    // \n');
fprintf('///////////////////////////////////////////////////////////// \n');
pict=input('//       Which picture would you prefer to work with?      //\n','s');
threshold=input('//       What threshold would you like to implement?       //\n');
iteration=input('// Finally, how many times should we compress the picture? //\n');
J=imread(pict);                 % Puts image in matrix form.
I=J;                            % 
subplot(4,(iteration),2);
imshow(I,[0,255]);title('Original Picture');


for i=1:iteration
    if i==1
        [M,N]=size(I);
        M=2*fix(M/2);                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        N=2*fix(N/2);                   %    Making the Haar Wavelet            %
        Wm=HaarWTM(M);                  %    Transform Matrices for M,N lengths %
        Wn=HaarWTM(N);                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ResizeI=double(I(1:M,1:N));     %    This is the new picture matrix,    %
    else
        
    end
    CompI=Wm*ResizeI*Wn';           % <- after HWT is applied.              %
    subplot(4,(iteration),(i+iteration)); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    imshow(CompI,[0,255]);title('Haar Transform of Picture');
    I=CompI;
end

for i=1:iteration                   % Reconstruction sequence.
    ReconstrI=Wm'*I*Wn*4;
    subplot(4,(iteration),(i+2*iteration));
    imshow(ReconstrI,[0,255]);title('Lossless reconstruction ');
    I=ReconstrI;
end
%Channel = mat2cell(I, size(I,1), [size(I,2)/3 size(I,2)/3 size(I,2)/3]);
%R = imadjust(Channel{1,1},[0 1],[1 0]);

%ca = cat(3, Channel{1,1}, Channel{1,2}, Channel{1,3});
%subplot(4,(iteration),3);
%imshow(R);title('Testing. Testing');

[R,T]=size(J);
for i=1:iteration
    R=2*fix(R/2);                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    T=2*fix(T/2);                   % Making the Haar Wavelet            %
    Wr=HaarWTM(R);                  % Transform Matrices for M,N lengths %
    Wt=HaarWTM(T);                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ResizeJ=double(J(1:M,1:N));         % This is the new picture matrix,%
    CompJ=Wm*ResizeJ*Wn';               % <- after HWT is applied.       %
   for k=1:M                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if k>M/2                            %                                %
        for j=1:N                       %  We're applying the            %
          if CompJ(k,j) < threshold     %  threshold to the compressed   %
                CompJ(k,j)=0;           %  image.  By that we mean that  %
          end                           %  here we're getting rid of all %
        end                             %  of the half-differences.      %
    else                                %                                %
        for j=N/2:N                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          if CompJ(k,j) < threshold     %                                %
                CompJ(k,j)=0;           %  Also, need to take M,N into   %
          end                           %  account when doing the two    %
        end                             %  reconstruction matrices.      %
    end                                 %                                %
   end                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    J=CompJ;
end
for i=1:iteration                       % Reconstruction sequence.
    ReconstrJ=Wm'*J*Wn*4;
    subplot(4,(iteration),(i+3*iteration));
    imshow(ReconstrJ,[0,255]);title('Lossy reconstruction ');
    J=ReconstrJ;
end




