function r = compose(f, g)
  r = @(x) f(num2cell(g(x)){:});
endfunction