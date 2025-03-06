data = csvread('ringosc.csv', 1, 0); % Skip the first row (headers)
Vdd = data(:,1);
Frequency = data(:,2);

figure;
plot(Vdd, Frequency, 'b-', 'LineWidth', 2);
xlabel('VDD (V)');
ylabel('Frequency (GHz)');
title('Frequency vs. VDD');
grid on;
