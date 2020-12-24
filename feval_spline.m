function g= feval_spline(knots, xnodes, fvals, coeff, xdelta)

%  input:
%         knots       column array of knots the spline is generated on
%         xnodes      column array of x values that the spline is to be evaluated on
%         fvals       function values at interpolating nodes; size (n+2)
%         coeff       column array of coefficients for generated spline
%         xdelta      spatial meshsize
%  output:
%         g           spline values evaluated at the xnodes

m= length(xnodes);
n= length(knots);
g= zeros(m,1);

beg= 1;
for i= 1:m
   x= xnodes(i);

   % find the knot subinterval that x lands in
   for j= beg:n
      if ( x >= knots(j) && x <= knots(j+1) )
         found= j+1;
         beg  = j;
         break;
      end
   end
   g(i)= (knots(found)-x)^3/(6*xdelta)*coeff(found-1) + (x-knots(found-1))^3/(6*xdelta)*coeff(found) + (fvals(found)/xdelta - xdelta/6.*coeff(found)) ...
         *(x-knots(found-1)) + (fvals(found-1)/xdelta - xdelta/6.*coeff(found-1))*(knots(found)-x);
end