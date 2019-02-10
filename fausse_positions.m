function [x iter]=fausse_positions(f,x0,x1,err)
  fprime = diff(f);
  fprime = function_handle(fprime);
  xd = x0;
  xf = x1;
  iter = 0;
  while ( abs(xf-xd) >= err )%&& fprime(xf) != fprime(xd)
    x = xf-fprime(xf)*(xf-xd)/(fprime(xf)-fprime(xd));
    xd = xf;
    xf = x;
    iter = iter+1;
  endwhile
endfunction
