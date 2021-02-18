%{
Sinusoid signal distortion & recovery
by Dr Liam Gao
ICL
2021
%}

max_amplitude = 20;
random_amplitude = rand(1,1)*max_amplitude; % create random amplitude

t = (0:0.01:1)*10*pi; % line space 0 to 10pi with 100 interval points.
y = random_amplitude * sin(t); %Generate signal with random amplitude.

figure(1);
plot(t, y);

noisy_y = y + randsample( random_amplitude *randn(1, length(y)*100), 101);% Noisy signal
figure(2);
plot(t,noisy_y);

fft_y = fft(noisy_y); %Fast Fourier Transform
figure(3);
plot(t, abs(fft_y));
ylim([-100 100]);


r = 5; % range of frequencies we want to preserve

rectangle = zeros(size(fft_y));
rectangle(1:r+1) = 1;               % preserve low frequencies

y_filtered = ifft(fft_y.*rectangle);   % low-pass filtered signal
figure(4);
plot(t, y_filtered);
