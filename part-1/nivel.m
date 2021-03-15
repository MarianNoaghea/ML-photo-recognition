function [niv]=nivel(x, r)
 n=r * (r + 1) / 2;
  for i=1:1:n
		if(x >= (i * (i-1) / 2  +  1) && x<= i * (i + 1) / 2) 
      niv=i;           #updatam nivelul pana cand se gaseste primul in
      return;           #convenabil
     endif
	endfor
endfunction
