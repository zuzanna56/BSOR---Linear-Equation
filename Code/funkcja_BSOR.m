function iteracja = funkcja_BSOR(A, b, omega, x0, tol, maxiter)
%funkcja rozwiązuje równanie postaci Ax = b przy użyciu metody iteracyjnej
%BSOR 
%Input:
%A - macierz trójdiagonalna w postaci n x n
%b - wektor wyrazów wolnych w postaci n x 1
%omega - parametr relaksacji
%x0 - pierwotny wektor przybliżenia
%tol - akceptowalny błąd
%maxiter - maksymalna liczba iteracji
%Output:
%x - szukane rozwiązanie 

%zgodnie z poleceniem mamy przechowywać macierz A w pamięci komputera jako
%macierz nx3 lub 3xn
if size(A, 1)~= size(A,2)
    disp('Złe wymiary macierzy')
    return
end
if size(b,1) ~= size(A,1) ||size(b,2) ~= 1
    disp('Złe rozmiary danych')
    return
end
if size(x0,1) ~= size(A,1) ||size(x0,2) ~= 1
    disp('Złe rozmiary danych')
    return
end

A = store_as_3n_matrix(A);
n = size(A,2);

iteracja = 1;
while iteracja <= maxiter
    err = 0;
    s = 0;
    for i = n:-1: 1
        if i == 1
            s = s - A(2,i)*x0(i) - A(i,i)*x0(i+1);
        elseif i == n
            s = s - A(2,i)*x0(i) - A(3,i)*x0(i-1);
        else
            s = s - A(2,i)*x0(i) - A(1,i)*x0(i+1) - A(3,i)*x0(i-1);
        end
        s = omega*(s + b(i))/A(2,i);

        if abs(s) > err
            err = abs(s);
        end
        x0(i) = x0(i) + s;

    end
    if err <= tol
        break;
    else
        iteracja = iteracja + 1;
    end
end

fprintf('Solution found after %d iterations', iteracja);
x = x0;

end