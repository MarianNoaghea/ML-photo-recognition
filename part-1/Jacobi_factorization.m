function [G_J, c_J] = Jacobi_factorization(A,b)
    v=diag(A); #notiuni din curs si laboratoare
    D=diag(v);
    L=tril(A,-1);
    U=triu(A,1);
    G_J=(D^-1)*(L+U)*(-1);
    c_J=(D^-1)*b;
endfunction
