function [cost] = compute_cost_pc(points, centroids)
  
  cost=  0;
  np = size(points)(1);
  NC = size(centroids)(1);
  
  for i = 1:1:np
    min = inf;
    for j = 1:1:NC #caut distanta minima dintre fiecare punct si centroid
      if(min > dist_euclid(points(i, :), centroids(j, :)))
      min = dist_euclid(points(i, :), centroids(j, :));
      endif
    endfor
    cost = cost+min; #costul este dat de suma de distante minime
  endfor
endfunction
