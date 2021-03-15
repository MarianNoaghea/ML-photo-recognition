function [centroids]  =  clustering_pc(points, NC)
  dim = size(points)(2);
  np = size(points)(1);
  clustre = zeros(NC, np);
  sum = zeros(NC, dim);
  nr = zeros(1, NC);
  
  centroizi_curenti = zeros(NC, dim); #aici se calculeaza centroidul
  for i = 1:1:NC  #initial format din puncte selectate din NC in NC
    for j = 1:1:np
      if(mod(j, NC)  ==  i-1)  #centroizii mei nu vor incepe cu 0 + NC ci cu 1 + NC,  0 + NC vor fi la final,  apoi vai duce acea linie la inceput
           sum(i, :) = sum(i, :) + points(j, :);
           nr(i) = nr(i) + 1;
      endif
    endfor 
  endfor
  for i = 1:1:NC
  centroizi_curenti(i, :) = sum(i, :) / nr(i);

  endfor

  ok = 1;

  while(ok == 1)
  sum = zeros(NC, dim);
  nr = zeros(1, NC);
    for i = 1:1:np #in acest for parcurg toate punctele
      min = inf;
      for j = 1:1:NC #in acest for parcurg fiecare centroid si vad fiecare punct de ce centroid este cel mai aproape
        if(min > dist_euclid(points(i, :), centroizi_curenti(j, :)))
        min = dist_euclid(points(i, :), centroizi_curenti(j, :));
        indice = j; #salvez mereu indicele centroidului cel mai apropiat
        endif
      endfor
      sum(indice, :) = sum(indice, :) + points(i, :);
      nr(indice) = nr(indice) + 1; #in vectorul nr salvez numarul de puncte ale clusterului
                               #pentru a putea obtine noul centru de greutate
    endfor
    for i = 1:1:NC
      if(nr(i) == 0) #daca un centroid nu a gasit niciun punct mai aproape de el
         centroizi_urmatori(i, :) = centroizi_curenti(i, :); #atunci coordonatele acestuia raman neschimbate
       else
        centroizi_urmatori(i, :) = sum(i, :) / nr(i);#altfel recalculez centroizii
      endif
    endfor
    if(centroizi_urmatori == centroizi_curenti);#in cazul in care matricile centroizilor raman neschimbate
      ok = 0;       #ne oprim
    else
      centroizi_curenti = centroizi_urmatori;
    endif
  endwhile
  centroids = centroizi_urmatori;

  for i = 1:1:NC-1 #aici duc prima linie la final pentru a obtine indicii centroizilor in ordine
    aux = centroids(i, :);
    centroids(i, :) = centroids(i + 1, :);
    centroids(i + 1, :) = aux;
  endfor
endfunction
