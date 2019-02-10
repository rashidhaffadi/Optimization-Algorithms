function r = symetrique(M)
  [n m] = size(M);
  if n != m
    display("la matrice n'est pas carré !!");
  else
    res = M' != M;
    for l = res
      for c = l
        if c == 0
          r=1;
        else
          r=0;
          break
        endif
      endfor
    endfor
  endif
endfunction
