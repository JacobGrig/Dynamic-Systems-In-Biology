% Course Work

%% Discrete System

%% Char Polynom

syms u1t u2t u3t k1 k2 k3 c myu;

[char_polynom_cur, myu_curs] = char_polynom();

c_cur = 1 / (1/k1 + 1/k2 + 1/k3);

myu_final = simplify(subs(myu_curs, c, c_cur));

%% Cycle 2

counter_1 = 0;

left_k = 2.9;
right_k = 3.1;
number_of_k = 500;

k_split = linspace(left_k, right_k, number_of_k);

results = [];

for k = k_split
    disp(k);
    u_opts = cycle2(k, k, k);
    col2 = ~isempty(u_opts);
    results = [results; k, col2];
end

% k_split = linspace(left_k, right_k, number_of_k);
% 
% results = [];
% 
% for k1 = k_split
%     counter_1 = counter_1 + 1;
%     counter_2 = -1;
%     for k2 = k_split(counter_1 : end)
%         counter_2 = counter_2 + 1;
%         disp([num2str(counter_1), ' ', num2str(counter_2)]);
%         for k3 = k_split(counter_1 + counter_2 : end)
%              u_opts = cycle2(k1, k2, k3);
%              col4 = ~isempty(u_opts);
%              results = [results; k1, k2, k3, col4];
%         end 
%     end
% end
% 
% k1 = 50;
% k2 = 60;
% k3 = 70;
% 
% c = 1/(1/k1 + 1/k2 + 1/k3);
% 
% u_opts = cycle2(k1, k2, k3);

%% Cycle 3

left_k = 2.9;
right_k = 3.1;
number_of_k = 10;

k_split = linspace(left_k, right_k, number_of_k);

results = [];

for k = k_split
    disp(k);
    u_opts = cycle3(k, k, k);
    col2 = ~isempty(u_opts);
    results = [results; k, col2];
end

ut = [1/3, 1/3, 1/3];
k1 = 4;

root_cycle3(k1, k1, k1, ut);


% k1 = 0.1;
% k2 = 0.2;
% k3 = 0.3;
% 
% c = 1/(1/k1 + 1/k2 + 1/k3);
% 
% u_opts = cycle3(k1, k2, k3);

%% Naymark-Sakker

k = 3;

number = 800;

u1_0 = 0.2;
u2_0 = 0.3;
u3_0 = 0.5;

plot_points = zeros(number, 3);

plot_points(1, :) = [u1_0, u2_0, u3_0];

[u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
plot_points(2, :) = [u1_cur, u2_cur, u3_cur];

for i = 3 : number
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
    plot_points(i, :) = [u1_cur, u2_cur, u3_cur];
end

plot3(plot_points(:, 1), plot_points(:, 2), plot_points(:, 3), 'b');

grid on;

xlabel('u_1(t)');
ylabel('u_2(t)');
zlabel('u_3(t)');

%% Bifurcation Diagram

u1_0 = 0.2;
u2_0 = 0.3;
u3_0 = 0.5;

number_iter = 1000;

number_1 = 800;
number_2 = number_iter - number_1;

k_number = 1000;

k_left = 2.75;
k_right = 4.25;

k_splitting = linspace(k_left, k_right, k_number);

figure;
hold on;

grid on;
xlabel('k');
ylabel('u_1(t)')

for k = k_splitting
    disp(k);
    [u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
    for i = 2 : number_1
        [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
    end
    for i = 1 : number_2
        [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
        plot(k, u1_cur, '.b', 'MarkerSize', 3);
    end
end

% figure;
% hold on;
% 
% grid on;
% xlabel('k');
% ylabel('u_2(t)')
% 
% for k = k_splitting
%     disp(k);
%     [u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
%     for i = 2 : number_1
%         [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
%     end
%     for i = 1 : number_2
%         [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
%         plot(k, u2_cur, '.b', 'MarkerSize', 3);
%     end
% end
% 
% figure;
% hold on;
% 
% grid on;
% xlabel('k');
% ylabel('u_3(t)')
% 
% for k = k_splitting
%     disp(k);
%     [u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
%     for i = 2 : number_1
%         [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
%     end
%     for i = 1 : number_2
%         [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
%         plot(k, u3_cur, '.b', 'MarkerSize', 3);
%     end
% end

%% k = 3.4

k = 3.4;

number_2 = 12;

u_curs = [];

[u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
for i = 2 : number_1
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
end
for i = 1 : number_2
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
    u_curs = [u_curs; u1_cur, u2_cur, u3_cur];
    %plot(k, u1_cur, '.b', 'MarkerSize', 2);
end

%% k = 4

k = 4;

number_2 = 12;

u_curs = [];

[u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
for i = 2 : number_1
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
end
for i = 1 : number_2
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
    u_curs = [u_curs; u1_cur, u2_cur, u3_cur];
    %plot(k, u1_cur, '.b', 'MarkerSize', 2);
end

%% Cycle 6

k = 4;

number = 1500;

epsilon = 0.1;

for u1_0 = 0.0001 : 0.0001 : 1
    for u2_0 = u1_0 : 0.0001 : (1 - u2_0)
        u3_0 = 1 - u1_0 - u2_0;
        u_cur = [u1_0, u2_0, u3_0];
        for k = 1 : 3
            [u_cur(1), u_cur(2), u_cur(3)] = new_step(u_cur(1), u_cur(2), u_cur(3), k, k, k);
        end
        if (norm([u1_0, u2_0, u3_0] - u_cur) < epsilon)
            disp([num2str(u1_0), ' ', num2str(u2_0), ' ', num2str(u3_0)]);
        end
    end
end

%%
u1_0 = 0.001;
u2_0 = 0.001;
u3_0 = 0.998;

ut = [u1_0, u2_0, u3_0];

root_cycle3(k, k, k, [0.33852 0.33075 0.33073])

%%

k = 4;

number = 20;

u1_0 = 0.075;
u2_0 = 0.075;
u3_0 = 0.85;

plot3([u1_0, u2_0, u3_0, u1_0], [u2_0, u3_0, u1_0, u2_0], [u3_0, u1_0, u2_0, u3_0], 'b');

grid on;

xlabel('u_1(t)');
ylabel('u_2(t)');
zlabel('u_3(t)');


%%
plot_points = zeros(number, 3);

plot_points(1, :) = [u1_0, u2_0, u3_0];

[u1_cur, u2_cur, u3_cur] = new_step(u1_0, u2_0, u3_0, k, k, k);
plot_points(2, :) = [u1_cur, u2_cur, u3_cur];

for i = 3 : number
    [u1_cur, u2_cur, u3_cur] = new_step(u1_cur, u2_cur, u3_cur, k, k, k);
    plot_points(i, :) = [u1_cur, u2_cur, u3_cur];
end

plot3(plot_points(1, 1), plot_points(1, 2), plot_points(1, 3), 'or');

hold on

plot3(plot_points(:, 1), plot_points(:, 2), plot_points(:, 3), 'b');

grid on;

xlabel('u_1(t)');
ylabel('u_2(t)');
zlabel('u_3(t)');

hold off;

%% Lyap Exp

k_left = 2.75;
k_right = 4.25;

number = 1000;

k_splitting = linspace(k_left, k_right, number);

h1_plot = zeros(1, number);
h2_plot = zeros(1, number);
h3_plot = zeros(1, number);

i = 0;

for k = k_splitting
    i = i + 1;
    
    u1 = 0.2;
    u2 = 0.3;
    u3 = 0.5;

    [h1, h2, h3] = lyap_exp(k, k, k, 1000, u1, u2, u3);
    
    h1_plot(i) = h1;
    h2_plot(i) = h2;
    h3_plot(i) = h3;
    
end

figure;

plot(k_splitting, h1_plot, 'b');
hold on;
plot(k_splitting, h2_plot, 'g');
plot(k_splitting, h3_plot, 'r');

grid on;

legend('h_1', 'h_2', 'h_3');

xlabel('k');
ylabel('h');

%%
u1 = 0.2;
u2 = 0.3;
u3 = 0.5;

[h1, h2, h3] = lyap_exp(k, k, k, 100, u1, u2, u3);

%% Continuous System

%% Drafts

syms k1 k2 k3 u1t u2t u3t;

ft = k1*u1t*u3t + k2*u1t*u2t + k3*u3t*u2t - 1;

u1tp1 = u1t*(k1*u3t - ft);
u2tp1 = u2t*(k2*u1t - ft);
u3tp1 = u3t*(k3*u2t - ft);

u1tp2 = subs(subs(subs(u1tp1, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);
u2tp2 = subs(subs(subs(u2tp1, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);
u3tp2 = subs(subs(subs(u3tp1, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);

u1tp3 = subs(subs(subs(u1tp2, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);
u2tp3 = subs(subs(subs(u2tp2, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);
u3tp3 = subs(subs(subs(u3tp2, u1t, u1tp1), u2t, u2tp1), u3t, u3tp1);