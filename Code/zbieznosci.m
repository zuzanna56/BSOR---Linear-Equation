function [rho_B, cond] = zbieznosci(A,omega)
%funckja oblicza promień spektralny macierzy iteracji B dla metody BSOR, na podstawie
%przekazanej macierzy A
%Input:
%A - macierz układu równań
%omega - parametr relaksacji
%Output:
%rho_B - promień spektralny macierzy iteracji B
%cond - wskaźnik uwarunkowania macierzy A
%rozbicie macierzy A na A = D + U + L (D - macierz diagonalna, U - macierz
%dolno trójkątna, L - macierz górno trójkątna)
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

%macierz Iteracji
B = inv(D+omega*L)*((1-omega)*D - omega*U);
%promień spektralny
rho_B = max(abs(eig(B)));
if rho_B >= 1
    disp(sprintf('Promień spektralny większy niż 1, wynosi %d, brak zbieżności', rho_B))
    return
end
cond = norm(inv(A)) * norm(A);

end