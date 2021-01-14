function output = signal_noise(data, snr_, option_plt)
% Add noise
% Add Gaussian White Noise by SNR

time = data(:,1);
amplitude_ = data(:,2);

% SNR에 따른 noise 만들기
% Communications Toolbox
amplitude = awgn(amplitude_,10*log10(10^(snr_/10)-1),'measured');
% 만들어진 snr 확인
% gen_snr = snr(amplitude_,amplitude-amplitude_);
output = [time, amplitude];

% plt
if option_plt == true
    plot(time,amplitude_)
    hold on; grid on
    plot(time,amplitude)
    xlabel('Time [s]'); ylabel('Amplitude [V]'); title(string(snr_))
    legend('origin data','noise data')
end

end

