function [alpha_armijo iter] = armijo_goldstein(phi,x,f,d,G,epsilon,delta)
  % d : direction
  % G : gradient of f
  % epsilon & delta : parameters
  
    alpha = 1;
    if (nargin<6)
        delta = 0.5;
        epsilon = 1e-4;
    elseif (nargin==6)
        delta = 0.5;
    endif
    
    j = 1;
    iter = 0;
    while (j>0)
        x_new = x+alpha*d;
        iter = iter+1;
        if (phi(alpha) >= f(num2cell(x){:})+epsilon*alpha*G(num2cell(x){:})'*d)
            alpha = alpha * delta;
        elseif (phi(alpha) <= f(num2cell(x){:})+alpha*G(num2cell(x){:})'*d)
            alpha = alpha / delta;
        else
            alpha_armijo = alpha;
            j=-1;
        endif
    endwhile
endfunction