clc;
clear all;
close all;

f = 0;
t = 0 : 0.0001 : 2;
x = zeros(1, length(t));
fig = figure;
while(ishandle(fig))
    f = f + 1;
    x = x + sin(2*pi*f*t);
    
    figure(fig);
    plot(t, x);
    title(['Added Freq: ' num2str(f) ' Hz']);
    
    pause;
end