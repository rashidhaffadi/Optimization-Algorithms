function [opt iter] = IntervalBound(f,h,step,itermax)
  alpha(1) = 0;
  alpha(2) = 0.1;
  alpha(3) = step*alpha(2);
  k=3;
  iter = 0;
  %f(num2cell(g()){:})
  while ( f(num2cell(h(alpha(k-2))){:}) <= f(num2cell(h(alpha(k-1))){:}) || f(num2cell(h(alpha(k))){:}) <= f(num2cell(h(alpha(k-1))){:}))
    if itermax < iter 
      display("Error itermax dépasser");
      opt = 1;
      break;
    else
      k = k+1;
      alpha(k) = alpha(k-1)*step;
      iter = iter+1;
    endif
  endwhile
  %a = alpha(k-2);
  %b = alpha(k);
  opt = alpha(k-1);
endfunction