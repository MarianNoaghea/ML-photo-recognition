function [w]  =  learn(X, y, lr, epochs)
  X(:, 1:size(X)(2)) = (X(:, 1:size(X)(2)) - mean(X(:, 1:size(X)(2))))./std(X(:, 1:size(X)(2))); #fiecare coloana din matrice este modificata ca in enunt
  X(:,  size(X)(2)+1) = 1; #se adauga  termenii "bias"
  N = size(X)(1);
  a =  - 0.1; b = 0.1;
  w  =  (b - a) .* rand(size(X)(2), 1) + a;  #valori random din intervalul [a, b]
  batch_size = size(X)(1);
  for epoch  =  1:epochs #se respecta algoritmul
    indx = randperm(batch_size); #obtinem un vector care contine indecsii liniilor lui X sortati random
    Xbatch = X(indx, :);
    ybatch = y(indx);
    w = w - lr/N*(sum(Xbatch(1:batch_size, :)*w)  -  sum(ybatch(1:batch_size)));
  endfor
endfunction
