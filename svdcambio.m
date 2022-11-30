function [S2,V1,U1,Xinv]=yess(X)
[U,S,V] = svd(X);
s = diag(S);
% determine the effective rank r of A using singular values
r = 1;
while( r < size(X,2) & s(r+1) >= max(size(X))*eps*s(1) )
r = r+1;
end
S1= S(:,1:r)
S2= S1(1:r,:)
V1= V(:,1:r)
U1=U(:,1:r)
Xinv = V1*diag(1./diag(S2))*U1';
end 