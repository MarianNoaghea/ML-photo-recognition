function [x] = rgbHistogram(path_to_image, count_bins)
  img=imread(path_to_image);
  n=size(img)(1);
  x=[];
  range=0:256/count_bins:256; #range contine intervalele in care se va cauta frecventa valorilor
  for i=1:1:3
    y=img(:,:,i); #extrag matricile de culori in y
    a=y'(:); #transform matricea intr-un vector
    v=histc(a',range); #cu histc verific cate aparitii de valori din vector apar in intervalele date de range 
    v(size(v)(2))=[]; #sterg ultimul element deoarece histc afiseaza si numarul de elemente mai mari decat capatul intervaluluia
    x=[x,v];#aici lipesc vectorul pentru fiecare culoare la solutia finala  #apoi am observat cum se comporta
  endfor
endfunction