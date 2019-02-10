function [x_ e iter] = gradient_algorithm(f,X,err)
  G = gradient(f);
  d = norm(G);
  d = function_handle(d);
  G = function_handle(G);
  f = function_handle(f);
  
  alpha = 0.1;
  iter=0;
  xd=xf=X;%init
  while d(num2cell(xd){:}) > err
    %h = @(x)xd-x*G(num2cell(xd){:})';
    %pas fixe
    xf = xd - alpha*G(num2cell(xd){:})';
    xd=xf;
    iter = iter+1;
    e = d(num2cell(xf){:});
    disp(['Iteration ' num2str(iter) ' : point x ' num2str(iter) ' :  ( ' num2str(double(xd(1))) ',' num2str(double(xd(2))) ' )  Lost : ' num2str(e)]);
  end
  x_ = xf;
  end
