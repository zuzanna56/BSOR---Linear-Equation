function plotIteracje(A, b,x0, tol, maxiter)
%Funckja tworzy wykres liczby iteracji potrzebnych do znalezienia rozwiązania Ax = b w zależności od parametru relaksacji
%Input:
%A - macierz trójdiagonalna w postaci n x n
%b - wektor wyrazów wolnych w postaci n x 1
%x0 - pierwotny wektor przybliżenia
%tol - akceptowalny błąd
%maxiter - maksymalna liczba iteracji
%Output:
%Wykres Liczby iteracji w zależności od omega

    %wartości parametru relaksacji
    wVals = [0.1:0.00001:1.9];

    %inicjalizacja wektora liczby iteracji
    y = zeros(size(wVals));

    %znajdowanie liczby iteracji
    for i = 1:length(wVals)
        y(1,i) = funkcja_BSOR(A, b, wVals(i), x0, tol, maxiter);
    end

    %tworzenie wykresu
    plot(wVals, y);
    xline(0);
    yline(0)
    xlabel('parametr relaksacji');
    ylabel('Liczba iteracji');
    title(sprintf('Wykres iteracji w zależności od parametru omega dla maxiter = %d', maxiter))
end
