function [sol]  =  hsvHistogram(path_to_image, count_bins)
  img_rgb = imread(path_to_image);
  [H, S, V] = rgb_to_hsv(img_rgb); #aici primesc 3 vectori coloana
  sol = [];

  range = 0:1.01/count_bins:1.01; #calculez rangeul
  range(1) = 0;
  
  v = histc(H', range); #folosesc histc la fel ca si la rgb
  v(size(v)(2)) = [];
  sol = [sol, v];
  
  v = histc(S', range);
  v(size(v)(2)) = [];
  sol = [sol, v];
  
  v = histc(V', range);
  v(size(v)(2)) = [];
  sol = [sol, v];
  
end
