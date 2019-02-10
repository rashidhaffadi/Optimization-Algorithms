function [a b]=bissection_intervalle(f,a,b,err,itermax)
    e=b-a;
    fa=f(a);
    if( fa .* f(b) >= 0 )
      disp("f(a) *  f(b) >= 0! No solution!")
    else
      while( e > err )
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