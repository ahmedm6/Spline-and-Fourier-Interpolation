%% problem 1 part 1

h = 1 / 11;
n = 12;

A = generate_matrix(n - 2, h);

disp(A)

%% problem 1 part 2

data = [43.5, 48, 57.5, 65.5, 73, 81, 85.5, 85, 78, 67.5, 56, 47.5]';

RHS = rhs(data, h , n - 2);

disp(RHS)
sigma = zeros(n, 1);

sigma(2 : n - 1) = A \ RHS;

%% problem 1 part 3
n = 12;
knots = linspace(0, 1, n)';

n = 100;
nodes = linspace(0, 1, n)';

values = feval_spline(knots, nodes, data, sigma, h);

figure(1)
plot(nodes, values)
title('Natural Cubic Spline')
xlabel('Time')
ylabel('Temperature')
hold on
scatter(knots, data, 'r')
xticks([0 1/11 2/11 3/11 4/11 5/11 6/11 7/11 8/11 9/11 10/11 1])
xticklabels({'0', '1/11', '2/11', '3/11', '4/11', '5/11', '6/11', '7/11', '8/11', '9/11', '10/11', '1'})
legend('Natural Cubic Spline', 'Data')
legend('Location','northwest')
legend('boxoff')
hold off



%% problem 2
N = 5;
a = zeros(N, 1);
for i = 1 : N
    a(i) = fourier_coeff(data, i, 1);
end
b = zeros(N, 1);
for i = 1 : N
    b(i) = fourier_coeff(data, i, 0);
end
a0 = fourier_coeff(data, 0, 1);

fx = ahmed(a, b, nodes, N, a0);

figure(2)
plot(nodes, fx)
title('Discrete Truncated Fourier Series')
xlabel('Time')
ylabel('Temperature')
hold on
scatter(knots, data, 'r')
xticks([0 1/11 2/11 3/11 4/11 5/11 6/11 7/11 8/11 9/11 10/11 1])
xticklabels({'0', '1/11', '2/11', '3/11', '4/11', '5/11', '6/11', '7/11', '8/11', '9/11', '10/11', '1'})
legend('Fourier Series', 'Data')
legend('Location','northwest')
legend('boxoff')
hold off


figure(3)
plot(nodes, fx)
title('Fourier Series vs Natural Cubic Spline')
xlabel('Time')
ylabel('Temperature')
hold on
plot(nodes, values)
hold on
scatter(knots, data, 'g')
legend('Fourier Series','Natural Cubic Spline', 'Data')
legend('Location','northwest')
legend('boxoff')
xticks([0 1/11 2/11 3/11 4/11 5/11 6/11 7/11 8/11 9/11 10/11 1])
xticklabels({'0', '1/11', '2/11', '3/11', '4/11', '5/11', '6/11', '7/11', '8/11', '9/11', '10/11', '1'})
hold off

% I enjoyed this project. Thank you!