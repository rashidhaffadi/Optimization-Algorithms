function [x e iter]=newton(f,x0,err,itermax)

iter = 0;
x = 0;
fprime = diff(f);
fseconde = diff(f,2);
fprime = function_handle(fprime);
fseconde = function_handle(fseconde);
xd=x0;
  do 
    if (fseconde(xd) != 0) 
      xf = xd - fprime(xd) / fseconde(xd)
      e = abs(xf - xd);
      x = xf;
      xd=xf;
      iter = iter + 1;
      
    else
      disp('prbleme!!!');
      break ;
		endif    
  until(e <= err ||  iter >= itermax)
endfunction