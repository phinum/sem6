subplot(2,1,1)
plot(y(:,1), y(:,3), 'k', 'LineWidth', 2)
hold on
subplot(2,1,2)
plot(y(:,1), y(:,7), 'k', 'LineWidth', 2)
hold on
plot(y(:,1), y(:,9), 'k:', 'LineWidth', 2)
figure(2)
grid on
hold on
xlabel('Time')

hold on
figure(3)
ylabel('Ethyl Benzene liquid mol fraction')
title('Ethyl Benzene liquid mol fraction vs Time')

legend('dz = 0.1','dF = 0.05','dTF = 5')
gtext('Shubham Gupta 180749')