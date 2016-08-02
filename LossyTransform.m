function W = LossyTransform(I,M,N,iteration,transform,threshold)
import HaarWTM.m.*  % Imports HWT function.
import DaubechiesFour.m.*
import DaubechiesSix.m.*
import CoifletSix.m.*
import Spline35.m.*
import Spline35low.m.*
import Spline48.m.*
import Spline57.m.*
import Spline79.m.*
import CDF79.m.*


for i=1:iteration
    
    switch transform
    case {'Haar','haar'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=HaarWTM(M/(2^(i-1))); 
        Wn=HaarWTM(N/(2^(i-1)));  
    case {'DaubechiesFour','daubechiesfour'}
        fprintf('DaubechiesFour done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=DaubechiesFour(M/(2^(i-1)));
        Wn=DaubechiesFour(N/(2^(i-1))); 
    case {'DaubechiesSix','daubechiessix'}
        fprintf('DaubechiesSix done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=DaubechiesSix(M/(2^(i-1)));
        Wn=DaubechiesSix(N/(2^(i-1))); 
    case {'Coiflet','coiflet'}
        fprintf('Coiflet done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=CoifletSix(M/(2^(i-1)));      
        Wn=CoifletSix(N/(2^(i-1))); 
    case {'Spline35','spline35'}
        fprintf('Spline35 done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline35(M/(2^(i-1)));
        Wn=Spline35low(N/(2^(i-1))); 
    case {'Spline48','spline48'}
        fprintf('Spline48 done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline48(M/(2^(i-1)));
        Wn=Spline48(N/(2^(i-1))); 
    case {'Spline57','spline57'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline57(M/(2^(i-1)));
        Wn=Spline57(N/(2^(i-1))); 
    case {'Spline79','spline79'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline79(M/(2^(i-1)));
        Wn=Spline79(N/(2^(i-1))); 
    case {'CDF79','cdf79'}
        fprintf('Spline48 done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=CDF79(M/(2^(i-1)));
        Wn=CDF79(N/(2^(i-1))); 
    end
    
    ResizeI=double(I(1:M/(2^(i-1)),1:N/(2^(i-1))));         % This is the new picture matrix,%
    W=Wm*ResizeI*Wn'; 
             
                 % <- after HWT is applied.       %
   for k=1:M/(2^(i-1))                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if k>M/(2^(i))                            %                                %
        for j=1:N/(2^(i-1))                       %  We're applying the            %
          if abs(W(k,j)) < (threshold/255)    %  threshold to the compressed   %
                W(k,j)=0;               %  image.  By that we mean that  %
          end                           %  here we're getting rid of all %
        end                             %  of the half-differences.      %
    else                                %                                %
        for j=N/(2^(i)):N/(2^(i-1))                     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          if abs(W(k,j)) < (threshold/255)     %                                %
                W(k,j)=0;           %  Also, need to take M,N into   %
          end                           %  account when doing the two    %
        end                             %  reconstruction matrices.      %
    end                                 %                                %
   end                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    I(1:M/(2^(i-1)),1:N/(2^(i-1)))=W(1:M/(2^(i-1)),1:N/(2^(i-1)));
end
W=I;