task1

	Am separat in regiuni labirintul si m-am folosit de proprietatile acestora pentru a forma matricea, am folosit si o functie auxiliara nivel.m care imi spune orice punct din labirint pe ce nivel se afla.
Explicatia pentru matrix to csr se vede mai bine pe cod,restul de functii le-am construit asemenea cu ce am invatat in cursul 5 doar ca am folosit csr multiplication.
task2
	Am parcurs punctele din NC in NC si le-am adunat direct, le-am calculat centrele de greutate,apoi intr-un while am creat noi centroizi, dar acestia erau centre de greutate ale punctelor cele mai apropiate de centroizii calculati anterior, am repetat acest lucru pana cand centroizii nu se mai modificau.
Am folosit si o functie auxiliara dist_euclid.m cu ajutorul cu care faceam distanta dintre un centroid si un punct.

task3

	Aici conceptul l-am inteles destul de repede, initial determinam puncte de intregi (luandu-mi numai 5/10 teste la rgbH) si le comparam cu intensitatile, apoi am descoperit ca pot folosi un vector de intervale, fapt care mi-a usurat lucrul la HSV unde aveam numai numere subunitare.

task4

	Aici am folosit functiile de la taskul3 si apoi am respectat pseudocodul si am obtinut vectorul w, cu functia evaluate de la taskul 3 am  obtinu un procent putin peste 0.55.


