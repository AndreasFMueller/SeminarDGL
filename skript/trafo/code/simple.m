[V, D] = eig(A); % Eigenwertzerlegung
y0 = V^-1*x0;    % Transformation der AW
Y(:,1) = y0;     % Setzen der AW zu Zeitpunkt t = 0
BB = V^-1*B;     % Transformation des Stoerterms
for k=2:length(time)
    Y(:,k) = exp(diag(D)*dt).*Y(:,k-1) + dt*BB(:,k-1);
end
X = real(V*Y);   % Ruecktransformation der Loesung