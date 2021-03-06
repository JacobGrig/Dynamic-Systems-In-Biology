function res_vect = prod_jacobi(k1, k2, k3, u1, u2, u3, vect)

jacobi = [...
    k1*u3*(1 - 2*u1) - 2*k2*u1*u2 - k3*u3*u2 + 1, ...
    -k2*u1^2 - k3*u1*u2, ...
    k1*u1 - k1*u1^2 - k3*u1*u2; ...
    k2*u2 - k1*u2*u3 - k2*u2^2, ...
    k2*u1*(1 - 2*u2) - k1*u1*u3 - 2*k3*u3*u2 + 1, ...
    -k1*u1*u2 - k3*u2^2; ...
    -k1*u3^2 - k2*u2*u3, ...
    k3*u3 - k2*u1*u3 - k3*u3^2, ...
    k3*u2*(1 - 2*u3) - 2*k1*u1*u3 - k2*u1*u2 + 1];

res_vect = jacobi * vect;

end