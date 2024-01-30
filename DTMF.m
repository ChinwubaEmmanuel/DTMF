%{
Chinwuba Emmanuel    CSE 33313    
%}

clear; close all; clc
clearvars

[y, fs] = audioread("Dtmf-1.wav");
N = length(y);
y_fft = fft(y)/N;
y_fft = y_fft(1:(N/2)+1);
f = (0:N/2)*(fs/N);
row_column = [697, 770, 852, 941, 1209, 1336, 1477];

plot(f, abs(y_fft));
xlabel('Frequency (Hz)');
ylabel('Frequency Vector');
title('Row and Column Frequency of Key Pressed');

peaks = zeros(2,2);
for i = 1:length(row_column)
    [~, index] = max(abs(y_fft(f >= row_column(i) & f < row_column(i)+500)));
    peaks(i,:) = [index, row_column(i)+(index*(fs/N))];
end

fprintf('Row peak frequency = %fHz \nColumn peak frequency = %fHz\n', peaks(1,2), peaks(2,2));
if(peaks(1,2) >= 600 && peaks(1,2) <= 720)
    if(peaks(2,2) >= 1120 && peaks(2,2) <= 1260)
        output = 1;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1261 && peaks(2,2) <= 1406)
        output = 2;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1407 && peaks(2,2) <= 1550)
        output = 3;
        fprintf('key pressed is %d\n', output);
    else
    fprintf("Unidentified Key Pressed!\n");
    end
elseif(peaks(1,2) >= 750 && peaks(1,2) <= 800)
    if(peaks(2,2) >= 1190 && peaks(2,2) <= 1230)
        output = 4;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1320 && peaks(2,2) <= 1360)
        output = 5;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1460 && peaks(2,2) <= 1490)
        output = 6;
        fprintf('key pressed is %d\n', output);
    else
        fprintf("Unidentified Key Pressed!\n");
    end
 elseif(peaks(1,2) >= 830 && peaks(1,2) <= 870)
    if(peaks(2,2) >= 1190 && peaks(2,2) <= 1230)
        output = 7;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1320 && peaks(2,2) <= 1360)
        output = 8;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1460 && peaks(2,2) <= 1490)
        output = 9;
        fprintf('key pressed is %d\n', output);
    else
        fprintf("Unidentified Key Pressed!\n");
    end 
elseif(peaks(1,2) >= 920 && peaks(1,2) <= 960)
    if(peaks(2,2) >= 1190 && peaks(2,2) <= 1230)
        output = '*';
        fprintf('key pressed is %c\n', output);
    elseif(peaks(2,2) >= 1320 && peaks(2,2) <= 1360)
        output = 0;
        fprintf('key pressed is %d\n', output);
    elseif(peaks(2,2) >= 1460 && peaks(2,2) <= 1490)
        output = '#';
        fprintf('key pressed is %c\n', output);
    else
        fprintf("Unidentified Key Pressed!\n");
    end
else
    fprintf("Unidentified Key Pressed!\n");
end