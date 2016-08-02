%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%   Programmers:  Milen Rashkov										   %
%   Assignment:   Homework Set #2:  Picture Haar Wavelet Transform     %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;              % Clears any previous work done in Matlab.
import HaarWTM.m.*  % Imports HWT function.
import Transform.m.*
import LossyTransform.m.*
import TransformReconstr.m.*

fprintf('///////////////////////////////////////////////////////////// \n');
fprintf('//     Welcome to the Picture Compression Test Program.    // \n');
fprintf('///////////////////////////////////////////////////////////// \n');
pict=input('//       Which picture would you prefer to work with?      //\n//               ','s');
color=input('//   And is this picture in color? (a yes/no question)\n//               ','s');
choice=input('// Would you like to use the default values for threshold, iteration? \n//               ','s');

if strcmpi(choice,'yes')
    threshold=20;
    iteration=3;
else
    threshold=input('//       What threshold would you like to implement?       \n//        ');
    iteration=input('// Finally, how many times should we compress the picture? \n//        ');
end
fprintf('//      Almost forgot - you need to choose a transform.      //\n');
fprintf('//      This is what you can choose:                         //\n');
fprintf('//                   [1] Haar                                //\n');
fprintf('//                   [2] DaubechiesFour                      //\n');
fprintf('//                   [3] DaubechiesSix                       //\n');
fprintf('//                   [4] Coiflet                             //\n');
fprintf('//                   [5] Spline35                            //\n');
fprintf('//                   [6] Spline48                            //\n');
fprintf('//                   [7] Spline57                            //\n');
fprintf('//                   [8] Spline79                            //\n');
fprintf('//                   [9] CDF79                               //\n');
transform=input('//        So, what transform do you want to use?             //\n//               ','s');
J=imread(pict);                 % Puts image in matrix form.
I=J;                            % 
subplot(4,(iteration),1);
imshow(I,[0,255]);title('Original Picture');
if strcmpi(color,'yes')
    I = double(I)/255;
    redChannel = I(:, :, 1);
    [A,B]=size(redChannel);
    greenChannel = I(:, :, 2);
    [C,D]=size(redChannel);
    blueChannel = I(:, :, 3);
    [E,F]=size(redChannel);
    L = cat(3, redChannel, greenChannel, blueChannel);
    subplot(1,4,1);
    imshow(L);title('Original Picture');
    
    redChannel=Transform(redChannel,A,B,iteration,transform,1,color);
    greenChannel=Transform(greenChannel,C,D,iteration,transform,2,color);
    blueChannel=Transform(blueChannel,E,F,iteration,transform,3,color);
    K = cat(3, redChannel, greenChannel, blueChannel);
    subplot(1,4,2);
    imshow(K,[0,255]);title('Transformation');
    
    redChannel=TransformReconstr(redChannel,A,B,iteration,transform,4,color);
    greenChannel=TransformReconstr(greenChannel,C,D,iteration,transform,5,color);
    blueChannel=TransformReconstr(blueChannel,E,F,iteration,transform,6,color);
    L = cat(3, redChannel, greenChannel, blueChannel);
    subplot(1,4,3);
    imshow(L);title('Reconstructed Picture');
    redChannel=LossyTransform(redChannel,A,B,iteration,transform,threshold);
    greenChannel=LossyTransform(greenChannel,C,D,iteration,transform,threshold);
    blueChannel=LossyTransform(blueChannel,E,F,iteration,transform,threshold);
    
    redChannel=TransformReconstr(redChannel,A,B,iteration,transform,4,color);
    greenChannel=TransformReconstr(greenChannel,C,D,iteration,transform,5,color);
    blueChannel=TransformReconstr(blueChannel,E,F,iteration,transform,6,color);
    L = cat(3, redChannel, greenChannel, blueChannel);
    subplot(1,4,4);
    imshow(L);title('Lossy Picture');
else if strcmpi(color,'no')
        I = double(I)/255;
        [M,N]=size(I);
        % Compression
        I=Transform(I,M,N,iteration,transform,1,color);
        I=TransformReconstr(I,M,N,iteration,transform,2,color);
        % Lossy Compression
        I=LossyTransform(I,M,N,iteration,transform,threshold);
        I=TransformReconstr(I,M,N,iteration,transform,3,color);
    end
end