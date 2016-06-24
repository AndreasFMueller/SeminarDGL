[U,S,V] = svd(M);                               % Singulaerwertzerlegung von Matrix M
s = diag(S);                                    % Extrahierung der Eigenwerte 
k = sum(s>tol)                                  % Toleranzwert fuer Eigenwerte pruefen

Minv = V(:,1:k)*diag(1./s(1:k))*U(:,1:k)';      % Inversion der Matrix M