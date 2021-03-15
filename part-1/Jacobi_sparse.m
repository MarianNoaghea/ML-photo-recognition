function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c_J, tol)
  x=zeros(size(c_J),1); #notiuni din curs si laboratoare doar ca inmultirea matricii si a vectorului x se face cu functia de inmulire csr;
  ant=csr_multiplication(G_values,G_colind,G_rowptr,x)+c_J;
  while(norm(x-ant,inf)>tol) #cu un while ne apropiem de solutia sistemului, cu o toleranta data
    copie=x;
    x=csr_multiplication(G_values,G_colind,G_rowptr,ant)+c_J;
    ant=copie;
  endwhile
endfunction