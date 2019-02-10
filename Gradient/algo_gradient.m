function [x e iter] = algo_gradient(f,x0,y0,err)
  G = gradient(f);
  d = norm(G);
  d = function_handle(d);
  G = function_handle(G);
  %h = @(x,a) = x-
  
  alpha = 1;
  xd=x0;
  yd=y0;
  xf=x0;
  yf=y0;
  iter=0;
  while d(xd,yd) > err
    %xf = xd - alpha*G(xd,yd)
    %yf = yd - alpha*G(xd,yd);
    [g1 g2] = G(xd,yd)';
    [xf yf] = [xd-alpha*g1 yd-alpha*g2];
    [xd yd] = [xf yf];
    iter = iter+1;
  endwhile
  x = [xf yf];
  e = d(xf,yf);
endfunction