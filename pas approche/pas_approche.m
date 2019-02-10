function [pas_appr iter] = pas_approche(f,G,xk,dk)
  f = sym(f);
  %h = @(a)xk+a*dk'
  phi = subs(f,symvar(f),[sym(xk(1))+sym('a')*sym(dk(1)) sym(xk(2))+sym('a')*sym(dk(2))]);
  
  % epsilon = ? [0,1]
  % delta = ? [0,1]
  phi = function_handle(phi);
  f = function_handle(f);
  %[pas_appr iter] = Armijo(phi,xk,f,dk,G);
  [pas_appr iter] = armijo_goldstein(phi,xk,f,dk,G);
endfunction
