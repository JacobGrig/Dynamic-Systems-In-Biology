function [h1, h2, h3] = lyap_exp(k1, k2, k3, N, u10, u20, u30)

nu1 = [1; 0; 0];
nu2 = [0; 1; 0];
nu3 = [0; 0; 1];

sigma1 = 0;
sigma2 = 0;
sigma3 = 0;

for i = 1 : N
    nu1 = prod_jacobi(k1, k2, k3, ...
        u10, u20, u30, nu1);
    nu2 = prod_jacobi(k1, k2, k3, ...
        u10, u20, u30, nu2);
    nu3 = prod_jacobi(k1, k2, k3, ...
        u10, u20, u30, nu3);
    
    [nu1, nu2, nu3] = orthog(nu1, nu2, nu3);
    
    sigma1 = sigma1 + log(norm(nu1));
    sigma2 = sigma2 + log(norm(nu2));
    sigma3 = sigma3 + log(norm(nu3));
    
    nu1 = nu1 ./ norm(nu1);
    nu2 = nu2 ./ norm(nu2);
    nu3 = nu3 ./ norm(nu3);
    
    [u10, u20, u30] = new_step(u10, u20, u30, k1, k2, k3);
end

h1 = sigma1 / N;
h2 = sigma2 / N;
h3 = sigma3 / N;

end