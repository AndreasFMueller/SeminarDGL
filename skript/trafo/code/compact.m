[V, D] = eig(A);                            % Eigenwertzerlegung
y0 = V^-1*x0;                               % Transformation der AB
Y(:,1) = y0;                                % Setzen der AB zu Zeitpunkt t = 0
BB = V^-1*B;                                % Transformation des Stoerterms

expLambdaDt = exp(diag(D)*dt);              % Konstante der homogenen Loesung

a0 = (expLambdaDt./diag(D) -...             % Konstante  a0 fuer Interpolation
      expLambdaDt./diag(D^2)*dt +...
      1./(diag(D^2)*dt));   
a1 = (expLambdaDt./diag(D^2)*dt -...        % Konstante a1 fuer Interpolation   
      1./diag(D) - 1./diag(D^2)*dt);
f = circshift(f1(:,2), -1)./f1(:,2);        % Differenz zwischen B_k und B_{k-1}
 
for k=2:length(time)
    Y(:,k) = expLambdaDt.*Ye(:,k-1) + (a0 + f(k)*a1).*B(:,k);
end
X = real(V*Y);                              % Ruecktransformation der Loesung