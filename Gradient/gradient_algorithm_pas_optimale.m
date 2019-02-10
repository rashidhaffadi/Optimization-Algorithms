function [x e k] = gradient_algorithm_pas_optimale(f,X,err)
  G = gradient(f);
  d = norm(G);
  %d = function_handle(d);
  %G = function_handle(G);
  %f = function_handle(f);
  
  alpha = 1;
  iter=0;
  k = 0;
  xd=xf=X;%init
  ezsurf(f)
  while (double(subs(d,symvar(d),xd))) > err
    text(xd(1),xd(2),double(subs(f,symvar(f),xd)),'*');
    %pas optimale
    g = double(subs(G,symvar(G),xd));
    [alpha it]= pas_optimale(f,xd,-g);
    xf = xd - alpha*g';
    xd=xf;
    %iter = iter+it;
    k++;
    disp(['Iteration ' num2str(k) ' ; point xk :  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' ) ; pas : ' num2str(alpha) ', en ' num2str(it) ' Iterations ; Lost : ' num2str(double(subs(d,symvar(d),xd)))]);
  end
  x = xf;
  e = double(subs(d,symvar(d),xf));
end

%%tester avec la fonction de Booth Function : f = (x+2*y-7)^2 + (2*x+y-5)^2;
%%tester avec la fonction de Matyas Function : f = 0.26*(x^2+y^2) - 0.48*x*y;