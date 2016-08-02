function W = TransformTest(I,M,N,iteration,transform,row,color)
import HaarWTM.m.*  % Imports HWT function.
import DaubechiesFour.m.*
import DaubechiesSix.m.*
import CoifletSix.m.*
import Spline35.m.*
import Spline48.m.*
import CDF79.m.*


if strcmpi(color,'yes')
    control = 7;
else
    control = 4;
end
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
        Wn=Spline35(N/(2^(i-1))); 
    case {'Spline48','spline48'}
        fprintf('Spline48 done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline48(M/(2^(i-1)));
        Wn=Spline48(N/(2^(i-1))); 
    case {'CDF79','cdf79'}
        fprintf('Spline48 done.\n');
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=CDF79(M/(2^(i-1)));
        Wn=CDF79(N/(2^(i-1))); 
    end
    ResizeI=double(I(1:M/(2^(i-1)),1:N/(2^(i-1))));     %    This is the new picture matrix,    %
    W=Wm*ResizeI*Wn';           % <- after HWT is applied.              %
    
    I(1:M/(2^(i-1)),1:N/(2^(i-1)))=W(1:M/(2^(i-1)),1:N/(2^(i-1)));
    if strcmpi(color,'no')
        subplot(control,(iteration),(i+row*iteration)); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        imshow(I);title('Transform of Picture');
    end
end
W=I;