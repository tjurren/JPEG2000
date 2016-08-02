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
colorlist = {'R','G','B'};    
    subplot(3,2,4);
    imshow(I);
    %for k=1:3
    %    subplot(2,2,k+1);
    %    imshow( I(:,:,k));
    %    title(colorlist{k});
    %end
redChannel = I(:, :, 1);
    subplot(3,2,1);
    imshow(redChannel);
greenChannel = I(:, :, 2);
    subplot(3,2,2);
    imshow(greenChannel);
blueChannel = I(:, :, 3);
    subplot(3,2,3);
    imshow(blueChannel);
% Recombine separate color channels into an RGB image.
K = cat(3, redChannel, greenChannel, blueChannel);
subplot(3,2,6);
    imshow(K);title('herro');