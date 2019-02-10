function [x_ k] = newton_algorithm(f,x0,err)
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
  he = function_handle(he);
  alpha = 0.1;
  xd = xf = x0;
  d = -he(num2cell(xd){:})\G(num2cell(xd){:});%La direction de descente
  I = eye(size(symvar(sym(f)))(2));
  ezsurf(f)
  while norm(d) > err
    text(xd(1),xd(2),'*');
    xf = xd + alpha*d';
    %determiner si l'inverse hessian est positive
    H = he(num2cell(xf){:});
    [_ pos] = chol(H\I);
    epsilon = 1000;
    while pos != 0
      %On fait un perturbation sur H
      H = H + epsilon*I;
      epsilon/=2;
      if epsilon<0.01
        break;
      endif
      [_ pos] = chol(H\I);
    endwhile
    if pos == 0
      d = -H\G(num2cell(xf){:});
    else 
      display('pas de minimum locale trouve .');
      break;
    endif
     
    disp(['Iteration ' num2str(k) ' : point xk:  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' )  Lost : ' num2str(double(norm(d)))]);

    k++;
    xd = xf;
  endwhile
  x_ = xf;
endfunction

