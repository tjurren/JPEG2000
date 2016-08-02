function W = TransformReconstr(I,M,N,iteration,transform,row,color)
import HaarWTM.m.*  % Imports HWT function.
import DaubechiesFour.m.*
import DaubechiesSix.m.*
import CoifletSix.m.*
import Spline35.m.*
import Spline35low.m.*
import Spline48.m.*
import Spline48low.m.*
import Spline57.m.*
import Spline79.m.*
import CDF79.m.*
import CDF79low.m.*

if strcmpi(color,'yes')
    control = 7;
else
    control = 4;
end
for i=iteration:-1:1                  % Reconstruction sequence.
    
    switch transform
    case {'Haar','haar'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=HaarWTM(M/(2^(i-1))); 
        Wn=HaarWTM(N/(2^(i-1)));  
    case {'DaubechiesFour','daubechiesfour'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=DaubechiesFour(M/(2^(i-1)));
        Wn=DaubechiesFour(N/(2^(i-1))); 
    case {'DaubechiesSix','daubechiessix'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=DaubechiesSix(M/(2^(i-1)));
        Wn=DaubechiesSix(N/(2^(i-1))); 
    case {'Coiflet','coiflet'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=CoifletSix(M/(2^(i-1)));      
        Wn=CoifletSix(N/(2^(i-1))); 
    case {'Spline35','spline35'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline35(M/(2^(i-1)));
        Wn=Spline35low(N/(2^(i-1))); 
    case {'Spline48','spline48'}
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=Spline48(M/(2^(i-1)));
        Wn=Spline48low(N/(2^(i-1)));
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
        M=2*fix(M/2);
        N=2*fix(N/2);
        Wm=CDF79(M/(2^(i-1)));
        Wn=CDF79low(N/(2^(i-1))); 
    end
    
    ResizeI=double(I(1:M/(2^(i-1)),1:N/(2^(i-1))));     %    This is the new picture matrix,    %
    switch transform
        case {'Haar','haar'}
            W=Wm'*ResizeI*Wn*4;
        case {'DaubechiesFour','DaubechiesSix','daubechiesfour','daubechiessix'}
            W=Wm'*ResizeI*Wn;
        case {'Spline57','spline57'}
            W=Wm'*ResizeI*Wn;
        case {'Coiflet','coiflet'}
            W=Wm'*ResizeI*Wn*1/4;
        case {'Spline35','spline35','Spline48','spline48','Spline79','spline79'}
            W=Wm'*ResizeI*Wn;
        case {'CDF79','cdf79'}
            W=Wm'*ResizeI*Wn;
    end
    
    I(1:M/(2^(i-1)),1:N/(2^(i-1)))=W(1:M/(2^(i-1)),1:N/(2^(i-1)));
    if strcmpi(color,'no')
        subplot(control,(iteration),(i+row*iteration));
        imshow(I);title('Reconstruction ');
    end
end