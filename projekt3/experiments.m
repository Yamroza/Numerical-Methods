tspan = [0 40];
y0 = [10 ; -10];

[t_ode, y_ode] = ode45(@(t, y) dydx(t,y), tspan, y0);
[t_dp, y_dp, h_dp, d_dp] = dormand_prince(@dydx, tspan, y0, 0.001, 1e-8, 0.9, 5, 1e-4, 1e-4);

% plot(t_dp, h_dp, 'LineWidth', 3)
% title("Długość kroku od czasu")

% plot(t_dp, d_dp, 'LineWidth', 3)
% title("Wartość błędu od czasu")
% grid

figure
tiledlayout(2,2)

nexttile
plot3(y_ode(:,1), y_ode(:,2), t_ode)
hold on
plot3(y_dp(1,:), y_dp(2,:), t_dp)
hold off
title("Trajektoria w przestrzeni trójwymiarowej")
xlabel('y1'); ylabel('y2'); zlabel('przedział'); 
legend("ode45", 'mój solver');

nexttile
plot(y_ode(:,1), y_ode(:,2))
hold on
plot(y_dp(1, :), y_dp(2,:))
hold off
title("Trajektoria w przestrzeni fazowej")
xlabel('y1'); ylabel('y2'); 
legend("ode45", "mój solver");

nexttile
plot(t_ode, y_ode(:,1), 'b-', t_dp, y_dp(1,:), 'r-')
title("Trajektoria y1")
xlabel('przedział'); ylabel('y1'); 
legend("ode45", 'mój solver');

nexttile
plot(t_ode, y_ode(:,2), 'b-', t_dp, y_dp(2,:), 'r-')
title("Trajektoria y2")
xlabel('przedział'); ylabel('y2'); 
legend("ode45", 'mój solver');
