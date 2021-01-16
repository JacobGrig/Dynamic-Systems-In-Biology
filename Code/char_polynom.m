function [polynom, myu_curs] = char_polynom()

syms k1 k2 k3 c myu;

J = -c^2 * [1/k2 + 1/k3 - 1/(c^2), 1/k2 + k3/(k1*k2), -k1/(k2*k3); ...
            -k2/(k1*k3), 1/k3 + 1/k1 - 1/(c^2), 1/k3 + k1/(k2*k3); ...
            1/k1 + k2/(k1*k3), -k3/(k1*k2), 1/k1 + 1/k2 - 1/(c^2)];
        
J_myu = J - eye(3)*myu;

polynom = simplify(det(J_myu));
myu_curs = solve(polynom == 0, myu);

end