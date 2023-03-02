function [B] = store_as_3n_matrix(A)
%funkcja zmienia przekazaną macierz trójdiagonalną na macierz o wymiarach
%3xn i przechowuje wartości diagonali
%A - macierz trójdiagonalna
%B - macierz ktorej pierwszy wiersz to górny diagonal, drugi wiersz to
%główny diagonal macierzy A, trzeci wiersz to dolny diagonal macierzy A
  

n = size(A,1);
B = zeros(3,n);

%wartosci diagonali
d3 = diag(A,-1);
d2 = diag(A,0);
d1 = diag(A,1);

%przedłużanie krótszych przekątnych zerami
d1 = [d1; zeros(n-length(d1),1)];
d3 = [zeros(n-length(d3),1); d3];

%przypisanie do wierszy
B(1,:) = d1;
B(2,:) = d2;
B(3,:) = d3;

end