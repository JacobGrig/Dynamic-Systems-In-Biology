function u_opts = cycle3(k1, k2, k3)

u_left = -10;
u_right = 10;
number_of_u = 10;

c = 1/(1/k1 + 1/k2 + 1/k3);

u_const = c./[k2, k3, k1];

fsolve_opts = optimoptions('fsolve', 'Display', 'none');

u_splitting = linspace(u_left, u_right, number_of_u);

u_opts = [];

epsilon_1 = 1e-3;
epsilon_2 = 1e-2;

for u10 = u_splitting
    for u20 = u_splitting
        u0 = [u10, u20, 1 - u10 - u20];
            
        cur_func = @(ut) root_cycle3(k1, k2, k3, ut);

        [u_cur, ~, exitflag] = fsolve(cur_func, u0, fsolve_opts);
        if (abs(sum(u_cur) - 1) < epsilon_1 && ...
            (isempty(u_opts) || norm(u_opts(end, :) - u_cur) >= epsilon_2) && ...
            exitflag > 0 && ...
            norm(u_const - u_cur) >= epsilon_2)
            u_opts = [u_opts; u_cur];
        end
    end
end

end