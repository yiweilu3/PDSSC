function [result] =kernellrr(s,K,lambda,mu)
[m,n]=size(K);
Y1=zeros(n);
Z=eye(n);
%Z=rand(n);
nc=length(unique(s));
maxIter=200;

for i=1:maxIter
    Zold=Z;
W=(2*K+mu*eye(n))\(mu*Z+Y1+2*K);
%W=W-diag(diag(W));
 W(find(W<0))=0;  
 
     D=W-Y1/mu;
% Z=max(abs(D)-lambda/mu,0).*sign(D);

 [U S V] = svd(D, 'econ');
       
        diagS = diag(S);
        svp = length(find(diagS > lambda/mu));
        diagS = max(0,diagS - lambda/mu);
        
        if svp < 0.5 %svp = 0
            svp = 1;
        end
        Z = U(:,1:svp)*diag(diagS(1:svp))*V(:,1:svp)';  %Z=Z-diag(diag(Z));
 Z(find(Z<0))=0;  

Y1=Y1-mu*(W-Z);

%obj=trace(K-2*K*Z+Z'*K*Z)+lambda*sum(sum(abs(Z)));
 mu=mu*1.1;

if((i>1)&(norm(Z-Zold,'fro') < norm(Zold,'fro') * 1e-5))  
        break
    end
end
% alpha=[.5 1 1.5 2 2.5 3];
%  [U ss V] = svd(Z);
%         ss = diag(ss);
%         r = sum(ss>1e-6);
% 
%         U = U(:, 1 : r);
%         ss = diag(ss(1 : r));
%         V = V(:, 1 : r);
% 
%         M = U * ss.^(1/2);
%         mm = normr(M);
%         rs = mm * mm';
%    %     for ji=1:5
%          for ij=1:length(alpha)
%         L = abs(rs).^(2 * alpha(ij)); 
L=(Z+Z')/2;
        actual_ids = spectral_clustering(L, nc);
        %err = calculate_err(s{n}, actual_ids); 
%          [corr(ij)]=AccMeasure(s, actual_ids);
%        [ MIhat(ij)] = MutualInfo(s, actual_ids);
[result] = ClusteringMeasure( actual_ids,s)
      
   %      NMI=max(MIhat);
    %    end
end