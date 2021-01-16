function [u1tp1, u2tp1, u3tp1] = new_step(u1t, u2t, u3t, k1, k2, k3)

ft = k1*u1t*u3t + k2*u1t*u2t + k3*u3t*u2t - 1;

u1tp1 = u1t*(k1*u3t - ft);
u2tp1 = u2t*(k2*u1t - ft);
u3tp1 = u3t*(k3*u2t - ft);

end