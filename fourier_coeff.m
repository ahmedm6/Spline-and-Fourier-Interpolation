function coeff= fourier_coeff(fvals, n, type)

% input
%       fvals  column array of function values evaluated at equally-spaced nodes in [0,1].
%       n      index of coefficient to be determined
%       type   flag to determine cosine or sine coefficient 
%
% output
%       coeff  Fourier coefficient a_n or b_n

% trapezoid rule to approximate Fourier coefficients

nvals= length(fvals);
h    = 1.0/(nvals-1);
xnodes= 0:h:1;
xnodes= xnodes';

if type > 0
   g= cos(n*2*pi*xnodes);
else
   g= sin(n*2*pi*xnodes);
end

integrand= fvals.*g;

coeff= 2*h*( sum(integrand,1) - 0.5*integrand(1) - 0.5*integrand(nvals) );  % trapezoid

if n < 1
   coeff= 0.5*coeff;
end