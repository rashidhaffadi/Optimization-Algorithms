function [opt iter]= optimale(f,h,x,G)
  
  step = 10;
  itermax = 10000;
  %err = 0.5;
  [opt iter]= IntervalBound(f,h,step,itermax);
  %g = @(h(x))f(h(x));
  alpha = 1;
  %d = -G;
  %d = function_handle(d);
  %opt = armijo(x,d,f,g,G);
  %On vas utiliser la methode de newton
  %opt = newton(f,h,err,itermax);
  %opt = (a+b)/2;
  
endfunction
