% Simulación de respuesta de filtro paso banda centrado en 868 MHz
clear; close all; clc;

f0 = 868e6;           % Frecuencia central (868 MHz)
bw = 20e6;            % Ancho de banda (20 MHz)
f = linspace(800e6, 940e6, 1000); % Barrido en frecuencia

% Modelo simplificado de pérdidas de inserción (S21) y retorno (S11)
s21_db = -1.5 - 20 * log10(1 + (2 * (f - f0) / bw).^4);
s11_db = -25 + 20 * log10(1 + (2 * (f - f0) / bw).^2);
s11_db(s11_db > -0.5) = -0.5;

figure('Color', 'w');
plot(f/1e6, s21_db, 'b', 'LineWidth', 1.5); hold on;
plot(f/1e6, s11_db, 'r--', 'LineWidth', 1.5);
grid on;
title('Parámetros S del Filtro Paso Banda');
xlabel('Frecuencia (MHz)');
ylabel('Magnitud (dB)');
legend('S21 (Pérdidas de Inserción)', 'S11 (Pérdidas de Retorno)', 'Location', 'South');
ylim([-40 0]);

% Guardar automáticamente la figura en la carpeta img
saveas(gcf, fullfile('..', 'img', 'respuesta_filtro.png'));