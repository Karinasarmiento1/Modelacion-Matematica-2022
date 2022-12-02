function [X,Y,B,Bid] = Modeloecono(N)

x0 = [0.6 0.9 1.3 0.5].';
X = x0;
B = [0.10 0.06 0.05 0.70;0.48 0.44 0.10 0.04;0.00 0.55 0.52 0.04;0.04 0.01 0.42 0.51];

for k=1:N
	X = [X B*X(:,k)];
end

Y = X(:,2:(N+1));
X = X(:,1:N);
Bid = Y/X;

disp(['||Bid X-Y||_F = ',num2str(norm(Bid*X-Y,'fro'))])
disp(['||Bid-B||_F = ',num2str(norm(Bid-B,'fro'))])

X1 = X0 = x0;

for k = 1:100
	X0 = [X0 B*X0(:,k)];
	X1 = [X1 Bid*X1(:,k)];
end

subplot(211);
plot(X0.');
title('Órbitas del modelo original')

subplot(212);
plot(X1.');
title('Órbitas del modelo identificado')

disp(['Estimación de diferencias entre órbitas de prueba modelos ||X_0^tst-X_1^tst||_1 = ',num2str(norm(X0(:,7:end)-X1(:,7:end),1))])

end
