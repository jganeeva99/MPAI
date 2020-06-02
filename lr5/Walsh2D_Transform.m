function [T]=Walsh2D_Transform(D,n,Trns)
% This function is applied on 2D matrix
% by Mohammed M. Siddeq
%at 2012-2-22
% mamadmmx76@yahoo.com
%----------------------------------------
% parameters are used :-
% D   :- 2D-matrix contians data for transformation or inverse-transformation 
% n   :- matrix size n x n; 
% Trns:- %--choose "T" = Transform , or "i" = Inverse Trasnform


% Example(1)\ for transformation 
  % X=[5 6 7 4;
  %    6 5 7 5;
  %    7 7 6 6;
  %    8 8 8 8];
  % T=Walsh2D_Transform(X,4,'T');

% Example(2)\ for inverse Transformation
 % X=Walsh2D_Transform(T,4,'i');
  
  
  
H = hadamard(n); %---> this function is build-in at MATLAB langauge

%------------- Walsh Transfomation -----------
if (Trns=='T')
T=H*D;
T=T*H;
end;
%--------------------------------------



%------------- Inverse Walsh Transfomation -----------
if (Trns=='i')
T=D*H^-1;
T=H^-1*T;
end;
%--------------------------------------
end