function [x k] = newton_algorithm_pas_optimale(f,x0,err)
  %%%%%%  Algorithme de newton avec pas optimale %%%
  %f : la fonction objective qu'on veut minimiser  %
  %x0 : le point initiale                          %
  %err : l'erreur                                  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  k=0;
  I = eye(size(symvar(sym(f)))(2));
  he = hessian(f);
  G = gradient(f);
  G = function_handle(G);
  f = function_handle(f);
  he = function_handle(he);
  alpha = 1;
  xd = xf = x0;
  d = -he(num2cell(xd){:})\G(num2cell(xd){:});%La direction de descente
  I = eye(size(symvar(sym(f)))(2));
  ezsurf(f);
  while norm(d) > err
    text(xd(1),xd(2),"o")
    [alpha _] = pas_optimale(f,xd,d);
    xf = xd + alpha*d';
    %determiner si l'inverse hessian est positive
    H = he(num2cell(xf){:});
    [_ pos] = chol(H\I);
    while pos != 0
      H = H + 0.5*I;
      [_ pos] = chol(H\I);
    endwhile
    d = -H\G(num2cell(xf){:});
   
    disp(['Iteration ' num2str(k) ' : point xk:  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' ), pas: ( ' num2str(alpha) ' )  Lost : ' num2str(double(norm(d)))]);

    k++;
    xd = xf;
  endwhile
  x = xf;
endfunction

