function [alpha_approche iter] = armijo_goldstein(phi,x,f,d,G,epsilon,mu,delta)
  % d : direction
  % G : gradient of f
  % epsilon & delta : parameters
  % mu < 1/2
  
    alpha = 0.8;
    if (nargin<6)
        delta = 0.5;
        epsilon = 0.003;
        mu = 0.3;
    elseif (nargin==6)
        delta = 0.5;
        mu = 0.3;
    elseif (nargin==7)
        delta = 0.5;
    endif
    
    j = 1;
    iter = 0;
    while (j>0)
        x_new = x+alpha*d;
        iter = iter+1;
        if (phi(alpha) >= f(num2cell(x){:})+epsilon*alpha*G(num2cell(x){:})'*d)
            alpha = alpha * delta;
        elseif (phi(alpha) <= f(num2cell(x){:})+mu*alpha*G(num2cell(x){:})'*d)
            alpha = alpha / delta
        else
            alpha_approche = alpha;
            j=-1;
        endif
    endwhile
endfunction