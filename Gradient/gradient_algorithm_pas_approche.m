function [x e iter] = gradient_algorithm_pas_approche(f,X,err)
  G = gradient(f);
  d = norm(G);
  d = function_handle(d);
  G = function_handle(G);
  f = function_handle(f);
  
  alpha = 1;
  iter=0;
  xd=xf=X;%init
  e = d(num2cell(xd){:});
  while e > err
    %pas approché
    [alpha it] = pas_approche(f,G,xd,-G(num2cell(xd){:}));
    xf = xd - alpha*G(num2cell(xd){:})';
    xd=xf;
    e = d(num2cell(xd){:});
    iter = iter+1;
    disp(['Iteration ' num2str(iter) ' ; point x(' num2str(iter) ') :  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' ) ; pas : ' num2str(alpha) ', en ' num2str(it) ' Iterations ; Lost : ' num2str(e)]);

  end
  x = xf;
  end

%%tester avec la fonction de Booth Function : f = (x+2*y-7)^2 + (2*x+y-5)^2;
%%tester avec la fonction de Matyas Function : f = 0.26*(x^2+y^2) - 0.48*x*y;