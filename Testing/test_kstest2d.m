%n = round(logspace(log10(10),log10(5000),6));
%n = [200];
n = [5 7 10 15 20 30 50 100 200 500 1000 2000 5000];
samples = 100;

Z = zeros(length(n),samples);
pval = zeros(length(n),samples);

for i = 1:length(n)
   n(i)
   tic;
   for j = 1:samples
      
      r1 = rand(n(i),2);
      r2 = rand(n(i),2);
      
      [p,D] = kstest2d(r1,r2);
      
      Z(i,j) = D*sqrt((n(i)^2)/(n(i)*2));
      pval(i,j) = p;
   end
   t(i) = toc;
   toc
end
% for i = 1:length(n)
%    for j = 1:samples
%       D(i,j) = Z(i,j)/sqrt(n(i));
%    end
% end
% for i = 1:length(n)
%    for j = 1:samples
%       Z2(i,j) = D(i,j)*sqrt((n(i)^2)/(n(i)*2));
%    end
% end
% Significance level
sl_ff = [30 40 50 60 70 80 90 95 99];
slMat = zeros(length(n),length(sl_ff));
for i = 1:length(n)
   for j = 1:length(sl_ff)
      slMat(i,j) = prctile(Z(i,:),sl_ff(j));
   end
end
% 
% % Compare to FF simulations
n_ff = [5 7 10 15 20 30 50 100 200 500 1000 2000 5000];
sl_ff = [30 40 50 60 70 80 90 95 99];
slMat_ff = [.883 .943 1.00 1.06 1.13 1.21 1.33 1.44 1.63;...
            .894 .950 1.01 1.07 1.14 1.22 1.35 1.46 1.67;...
            .901 .950 1.02 1.08 1.15 1.24 1.37 1.48 1.70;...
            .915 .975 1.03 1.10 1.17 1.26 1.39 1.51 1.74;...
            .927 .987 1.05 1.11 1.19 1.27 1.41 1.52 1.76;...
            .948 1.01 1.07 1.13 1.21 1.30 1.43 1.55 1.79;...
            .972 1.03 1.09 1.16 1.23 1.33 1.46 1.58 1.82;...
            1.00 1.06 1.12 1.19 1.26 1.36 1.49 1.62 1.85;...
            1.03 1.10 1.16 1.23 1.30 1.39 1.53 1.66 1.89;...
            1.07 1.13 1.20 1.26 1.33 1.42 1.57 1.69 1.92;...
            1.10 1.17 1.23 1.29 1.37 1.45 1.60 1.72 1.97;...
            1.11 1.18 1.24 1.31 1.38 1.47 1.61 1.73 1.94;...
            1.13 1.19 1.24 1.31 1.36 1.45 1.64 1.71 1.89];