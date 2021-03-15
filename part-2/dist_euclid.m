function [x] = dist_euclid(p1, p2)
  n = size(p1)(2);
  s = 0;
  
  for i = 1:1:n 
    s = s + ((p1(i) - p2(i)) * (p1(i) - p2(i)));
  endfor
  x = sqrt(s);

endfunction
