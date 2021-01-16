function [nu1, nu2, nu3] = orthog(nu1_old, nu2_old, nu3_old)

nu1 = nu1_old;
nu2 = nu2_old - dot(nu1, nu2_old) / dot(nu1, nu1) * nu1;
nu3 = nu3_old - dot(nu1, nu3_old) / dot(nu1, nu1) * nu1 - ...
                dot(nu2, nu3_old) / dot(nu2, nu2) * nu2;

end