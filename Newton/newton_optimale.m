function [x k] = newton_algorithm(f,x0,err)
  k=0;
  in_he = inv(hessian(f));
  G = gradient(f);
  G = function_handle(G);
  f = function_handle(f);
  in_he = function_handle(in_he);
  alpha = 1;
  xd = x0;
  d = -in_he(num2cell(xd){:})*G(num2cell(xd){:});
  while norm(d) >= err
    h = @(x)xd-x*G(num2cell(xd){:})';
    alpha = optimale(f,h);
    xf = xd + alpha*d';
    xd = xf;
    v = eig(in_he(num2cell(xf){:}));
    %determiner si la hessian est positive
    s = size(v);
    i=1;
    pos = 0;
    while i<=s(1)
      if v(i)<0
        pos = 0;
        break;
      else
        pos = 1;
        i++;
      endif
    endwhile
    if pos == 1
      d = -in_he(num2cell(xf){:})*G(num2cell(xf){:});
    else
      %d = -inv_he(num2cell(xd){:})*G(num2cell(xd){:});
    endif
    k++;
  endwhile
  x = xf;
endfunction