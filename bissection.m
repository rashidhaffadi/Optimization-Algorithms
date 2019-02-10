function [x e iter]=bissection(f,a,b,err,itermax)
    e=b-a;
    iter=0;
    fa=f(a);
    if( fa .* f(b) >= 0 )
      x =[];
      disp("f(a) *  f(b) >= 0! No solution!")
    else
      while( e > err )
        iter = iter + 1;
        x = 0.5 * ( b + a );
        e = abs(b - x);
        fx = f(x);
        if( fx == 0 )
          break;
        elseif( fx * fa > 0 )
          a = x;
          fa = fx;
        else
          b = x;
        endif
        if( iter == itermax)
          break;
        endif	
      endwhile
    endif
endfunction