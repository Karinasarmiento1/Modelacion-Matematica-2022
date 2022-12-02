function [A,Aid] = Modelopre1(N)

x0 = [1 0 0 0].';
X = x0;
A = [0.95,0.04,0,0;
     0.05,0.85,0,0;
     0,0.10,1,0;
     0,0.01,0,1];

for k=1:N
	X = [X A*X(:,k)];
end

Y = X(:,2:(N+1));
X = X(:,1:N);
Aid = Y/X;

disp(['||Aid X-Y||_F = ',num2str(norm(Aid*X-Y,'fro'))])
disp(['||Aid-A||_F = ',num2str(norm(Aid-A,'fro'))])

X1 = X0 = x0;

for k = 1:300
	X0 = [X0 A*X0(:,k)];
	X1 = [X1 Aid*X1(:,k)];
end

subplot(211);
plot(X0.');
title('Órbitas del modelo original')

subplot(212);
plot(X1.');
title('Órbitas del modelo identificado')

disp(['Estimación de diferencias entre órbitas de prueba modelos ||X_0^tst-X_1^tst||_1 = ',num2str(norm(X0(:,7:end)-X1(:,7:end),1))])

end
