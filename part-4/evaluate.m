function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  #mai parcurg la fel ca si la preprocess 2 directoare cu poze
  
  Folder1 = strcat(path_to_testset, "cats");
  filePattern1 = fullfile(Folder1, "*.jpg"); 
  theFiles1 = dir(filePattern1);
  
  
  Folder2 = strcat(path_to_testset, "not_cats");
  filePattern2 = fullfile(Folder2, "*.jpg");
  theFiles2 = dir(filePattern2);
  
  N = length(theFiles1)+length(theFiles2);
  pisici_reale = length(theFiles1);
  nupisici_reale = length(theFiles2);
  M = 3 * count_bins;
  X = zeros(N, M);
  
  for k = 1 : length(theFiles1)
    baseFileName1 = theFiles1(k).name;
    fullFileName1 = fullfile(Folder1, baseFileName1);
    if(strcmp("RGB", histogram) == 1)
      X(k, :) = rgbHistogram(fullFileName1, count_bins);
    endif
    if(strcmp("HSV", histogram) == 1)
      X(k, :) = hsvHistogram(fullFileName1, count_bins);
    endif  
    l = k;
   endfor
  
  for k = 1 : length(theFiles2)
    baseFileName2 = theFiles2(k).name;
    fullFileName2 = fullfile(Folder2, baseFileName2);
     if(strcmp("RGB", histogram) == 1)
      X(k+l, :) = rgbHistogram(fullFileName2, count_bins);
    endif
    if(strcmp("HSV", histogram) == 1)
      X(k+l, :) = hsvHistogram(fullFileName2, count_bins);
    endif 
  end
  
  X(:, size(X)(2)+1) = 1; #aduag o coloana de 1
  
  y = X*w; #obtin vectorul termenilor liberi(care ne spune cum a evaluat functia pozele)
  
  nr_minus = sum(y < 0); #numar cate numere sunt cu - si cate cu + din vectorul obtinut
  nr_plus = sum(y >=  0);
  eroarea = abs(pisici_reale-nr_plus);
  percentage = (N-eroarea)/N; #calculez procentul de poze recunoscute corect
endfunction