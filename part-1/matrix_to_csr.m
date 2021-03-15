function [values, colind, rowptr] = matrix_to_csr(A)
 
  l1 = 1; l2 = 1;
  [n m]=size(A);

  v=0; k=1; l=1; 
  for i = 1:1:n #parcurg matricea o singura data
    for j=1:1:m
      if (A(i, j) != 0)
          values(l1)=A(i, j); #populez vectorii values si colind
          colind(l1++) = j;
        endif
      if( A(i,j)!=0)
        v++; #cu v retin indicele valorii curente din values
        if(k == i) #aceasta conditie va fi adevarata doar o singura data(pt primul element nenul) de pe linie
          rowptr(l++) = v; #pentru ca mai jos voi creste valoarea lui k
          k++;
        endif
      endif  
    endfor
  endfor
  rowptr(l) = v + 1; #dimensiunea values +1
endfunction