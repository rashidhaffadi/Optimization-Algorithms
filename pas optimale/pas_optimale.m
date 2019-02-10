function [pas_opt it] = pas_optimale(f,xk,dk)
  f = sym(f);
  phi = subs(f,symvar(f),(xk+sym('a')*dk'));
  [pas_opt e it]= newton(phi, 1, 0.00001, 1000);
endfunction
