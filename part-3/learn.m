function [w] = learn(X, y)
    X(:, size(X)(2)+1) = 1; # pun coloana de 1
    [Q, R] = Householder(X);  #descompun in QR matricea x
    w = SST(R, (Q') * y); #obtin solutia sistemului
    #w este acum invatat
end
