function x = SST(A, b)
  [n m] = size(A);
  x = zeros(n, 1);
  for i = m: -1 : 1
    s = 0;
    for j = (i + 1) :m
      s += (A(i,j) * x(j));
    endfor
    x(i) = (b(i) - s) / A(i,i);
  endfor
  x=x(1:m);
endfunction