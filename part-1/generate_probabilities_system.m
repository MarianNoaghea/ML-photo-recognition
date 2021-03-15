function [A, b]  =  generate_probabilities_system(rows)
  c1  =  1; c2  =  rows * (rows  -  1) / 2  +  1; c3 = rows * (rows + 1) / 2;
  #^definesc valorile pentru colturi(c1 c2 c3)
  A  =  zeros(c3);
  ant1 = 1;c = 1;ant2 = 1;l = 1;
  for i = 1:1:rows - 2;
    v1(l) = ant1 + c; #memorez in 2 vectori laturile din stanga si din dreapta ale triunghiului(laturi exceptand colturile)
		v2(l ++ ) = ant2 + c + 1;
		ant1 = ant1 + c;
		ant2 = ant2 + c + 1;
		c = c + 1;
  endfor
  l = 1;
  for i = c2 + 1:1:c3-1
			v3(l ++ ) = i;#memorez latura de jos a triunghiului
	endfor
  for i = c2:1:c3
    b(i) = 1; #probabilitatile care duc spre iesirea din labirint(latura de jos) sunt initializate cu 1
  endfor
  b = b';
  for i = 1:1:c3 #parcurg intreaga multime de puncte din triunghi si o clasific
    ok1 = 0;ok2 = 0;ok3 = 0; #fiecare ok pentru o latura
    for j = 1:1:rows - 2
      if(v1(j) == i)
        ok1 = 1;
       endif
      if(v2(j) == i)
        ok2 = 1;
       endif
      if(v3(j) == i)
        ok3 = 1;
       endif
    endfor
      if(ok1 == 1) #daca ne aflam pe latura din stanga avem 5*2  (matricea fiind simetrica) posibilitati
      A(i, i) = 5;        # de populare a matricii adica soarecele poate sa o ia in 5 directii
			A(i, i - nivel(i, rows) + 1) = -1;
			A(i, i + 1) = -1;
			A(i, i + nivel(i, rows)) = -1;      # !NE FOLOSIM DE O FUNCTIE 'nive' care ne poate spune
			A(i, i + nivel(i, rows) + 1) = -1;  #la orice moment un punct pe ce nivel al triunghiului se afla
			A(i - nivel(i, rows) + 1, i) = -1;
			A(i + 1, i) = -1;
			A(i + nivel(i, rows), i) = -1;
			A(i + nivel(i, rows) + 1, i) = -1;
    endif
    if(ok2 == 1) #latura 2(cea din dreapta) are conditii de populare putin diferite de cea din stanga
			A(i, i) = 5; #nr de posibilitatii ale laturii 2
			A(i, i - nivel(i, rows)) = -1;
			A(i, i   -1) = -1;
			A(i, i + nivel(i, rows) + 1) = -1;
			A(i, i + nivel(i, rows)) = -1;
			A(i - nivel(i, rows), i) = -1;
			A(i   -1, i) = -1;
			A(i + nivel(i, rows) + 1, i) = -1;
			A(i + nivel(i, rows), i) = -1;
		endif
		if(ok3 == 1) #latura de jos la fel are conditii diferite
			A(i, i) = 5; #numarul de posibilitati ale laturii 3;
			A(i, i - nivel(i, rows)) = -1;
			A(i, i - nivel(i, rows) + 1) = -1;
			A(i, i + 1) = -1;
			A(i, i   -1) = -1;
			A(i - nivel(i, rows), i) = -1;
			A(i - nivel(i, rows) + 1, i) = -1;
			A(i + 1, i) = -1;
			A(i   -1, i) = -1;
		endif
		if(i == c1) #popularea cu directii a coltuilui de sus
			A(i, 2) = -1;
			A(i, 3) = -1;
			A(2, i) = -1;
			A(3, i) = -1;
		endif
		if(i == c2) #popularea cu directii al coltului din stanga
			A(i, i - nivel(i, rows) + 1) = -1;
			A(i, i + 1) = -1;
			A(i - nivel(i, rows) + 1, i) = -1;
			A(i + 1, i) = -1;
		endif
		if(i == c3)#popularea cu directii al coltului din dreapta
			A(i, i   -1) = -1;
			A(i, i - nivel(i, rows)) = -1;
			A(i   -1, i) = -1;
			A(i - nivel(i, rows), i) = -1;
		endif
		if(ok1 == 0 && ok2 == 0 && ok3 == 0 && i != c1 && i != c2 && i != c3)#aceasta conditie ne arata ca ne aflam
			A(i, i) = 6;#pentru acest triunghi interior avem 6 drumui posibile   #in "triunghiul interior" al labirintului
			A(i, i - nivel(i, rows)) = -1;#matricea fiind populata cu 6*2 casute
			A(i, i - nivel(i, rows) + 1) = -1;
			A(i, i   -1) = -1;
			A(i, i + 1) = -1;
			A(i, i + nivel(i, rows)) = -1;
			A(i, i + nivel(i, rows) + 1) = -1;
			A(i - nivel(i, rows), i) = -1;
			A(i - nivel(i, rows) + 1, i) = -1;
			A(i   -1, i) = -1;
			A(i + 1, i) = -1;
			A(i + nivel(i, rows), i) = -1;
			A(i + nivel(i, rows) + 1, i) = -1;
		endif
		
		if(i == c1||i == c2||i == c3)
			A(i, i) = 4; #pentru coltui avem 4 drumui posiblie
    endif  
 endfor
endfunction
