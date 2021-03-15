function [X, y]  =  preprocess(path_to_dataset, histogram, count_bins)
  Folder1 = strcat(path_to_dataset,"cats"); #am calea pana la cele 2 directoare
  filePattern1  =  fullfile(Folder1, "*.jpg"); #si lipesc la cale si numele de 'cats'
  theFiles1  =  dir(filePattern1);  #lafel fac si pt not_cats
  
  
  Folder2 = strcat(path_to_dataset,"not_cats");
  filePattern2  =  fullfile(Folder2, "*.jpg"); 
  theFiles2  =  dir(filePattern2);
  
  N = length(theFiles1)+length(theFiles2); 
  M = 3 * count_bins;
  X = zeros(N,M);
  y = zeros(1,N);
  
  for k  =  1 : length(theFiles1) #parcurg intreg directorul cu pisici
    baseFileName1  =  theFiles1(k).name;
    fullFileName1  =  fullfile(Folder1, baseFileName1);
    if(strcmp("RGB",histogram)  ==  1)
      X(k,:) = rgbHistogram(fullFileName1,count_bins); #salvez in matricea X pe fiecare linie
    endif                                              #vectorul de caracteristic
    if(strcmp("HSV",histogram)  ==  1)
      X(k,:) = hsvHistogram(fullFileName1,count_bins);
    endif
    y(k) = [1];  #populez cu 1 vectorul coloana y unde am pisici
    l = k;
   endfor
  
  for k  =  1 : length(theFiles2)
    baseFileName2  =  theFiles2(k).name;
    fullFileName2  =  fullfile(Folder2, baseFileName2);
     if(strcmp("RGB",histogram)  ==  1)
      X(k+l,:) = rgbHistogram(fullFileName2,count_bins);
    endif
    if(strcmp("HSV",histogram)  ==  1)
      X(k+l,:) = hsvHistogram(fullFileName2,count_bins);
    endif 
    y(k+l) = [-1]; #populez cu -1
  end
  y = y';
 
endfunction