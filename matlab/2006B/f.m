function [coefficients]=f(x1,y1)
[xv,ind]=sort(x1);xv=xv';yv=y1(ind);
plot(xv, yv, '+', 'LineWidth', 3, 'MarkerSize', 12);
xv = xv + 0.000001 * rand(length(xv), 1);
coefficients = polyfit(xv, yv, 2);
yFit = polyval(coefficients, xv);
hold on
plot(xv, yFit, 'r-', 'LineWidth', 3);
grid on;
xlabel('x', 'FontSize', 20);
ylabel('y', 'FontSize', 20);
legend('data', 'fit');
end