function [x_ e iter] = quasi_newton_pas_fixe(f,x0,err)
  iter = 0;
  G = gradient(f);
  H = eye(size(gradient(f))(1));
  G = function_handle(G);
  f = function_handle(f);
  alpha = 0.05;
  xd = x0;
  g = G(num2cell(xd){:});
  e = norm(g);
  while e > err
    d = -H*g;%La direction de descente
    xf = xd + alpha*d';%calcule itération k+1
    g = G(num2cell(xf){:});%calcule de gk+1
    %determiner Hk+1
    y = (G(num2cell(xf){:}) - G(num2cell(xd){:}));
    A = (d*d')./(d'*y);
    B = -(H*y*y'*H)./(y'*H*y);
    H = H+A+B;%Hk+1
    xd = xf;
    iter = iter+1;
    e = norm(g);
    disp(['Iteration ' num2str(iter) ' ; point x(' num2str(iter) ') :  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' ) ; pas : ' num2str(alpha) '; Lost : ' num2str(e)]);

  endwhile
  x_ = xf;
endfunction