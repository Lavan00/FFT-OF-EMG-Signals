% Load EMG data from file
data = load('emg_neuropathy.txt');
time = data(:, 1);
emg_signal = data(:, 2);

% Plot the original EMG signal
figure;
subplot(2,1,1);
plot(time, emg_signal);
title('Original EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Perform FFT
fs = 1 / (time(2) - time(1)); % Sampling frequency
n = length(emg_signal);
frequencies = fftshift((-n/2:n/2-1)*(fs/n)); % Frequency vector
emg_fft = fftshift(fft(emg_signal)/n); % Shift and normalize FFT

% Plot the FFT
subplot(2,1,2);
plot(frequencies, abs(emg_fft));
title('FFT of EMG Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Optional: Zoom in on the frequency axis
xlim([0 20]); % Adjust the range based on your signal characteristics
