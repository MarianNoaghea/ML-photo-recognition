function [H, S, V]  =  rgb_to_hsv(A)
  R = A(:, :, 1); #extrag matricile de culori
  G = A(:, :, 2);
  B = A(:, :, 3);
  R = R'(:); #le vectorizez
  G = G'(:);
  B = B'(:);
  H = zeros(size(R)); #creez vectori pentru hsv de dimensiuni necesare
  S = zeros(size(R));
  V = zeros(size(R));
  
  R = double(R)/255; #convertesc la double
  G = double(G)/255;
  B = double(B)/255;
  
  Cmax = max(R, max(G, B)); #calculez maximul pe componente dintre cei 3 vectori coloana
  Cmin = min(R, min(G, B)); #calculez minimul
  
  DELTA = Cmax - Cmin;
  
  H(find(~DELTA)) = [0]; #pentru orice DELTA care e 0 H primeste 0;
  H(Cmax  ==  R) = 60 * [(mod((G(Cmax  ==  R) - B(Cmax  ==  R)) ./ DELTA(Cmax  ==  R), 6))]; # ./ este operator pe componenta
  H(Cmax  ==  G) = [60 * (((B(Cmax  ==  G) - R(Cmax  ==  G)) ./ DELTA(Cmax  ==  G)) + 2)]; #altfel s-ar fi tradus ca o impartire de vectori
  H(Cmax  ==  B) = [60 * (((R(Cmax  ==  B) - G(Cmax  ==  B)) ./ DELTA(Cmax  ==  B)) + 4)];
  #aici H(conditie) se traduce ca orice componenta din H care indeplineste o conditie se modifica(dupa cum impun);
  H = H/360;
 
  S(Cmax  ==  0) = [0];
  S(Cmax != 0) = [DELTA(Cmax != 0) ./ Cmax(Cmax != 0)];
  
  V = Cmax;
endfunction