clear all;
FOLDER_PATH = 'data\';

OPTION = 1;
START_TIME = 0.5e-06;
END_TIME= 1.7e-06;

SNR = 3:5:28;
OPTION_PLT = false;

% data load -> cut the signal -> labeling
s_data = structure_data(FOLDER_PATH);

total_data = [];
total_noise_data = [];    % (length(signal)+1) * data_num * (snr_num+1)
label = zeros(1,length(s_data));

for i = 1:length(s_data)
    data = load(s_data.name);
    label(i) = s_data.label;
    data = signal_cut(data, OPTION, START_TIME, END_TIME);
    total_data = horzcat(total_data, data(:,2));
end
total_data = vertcat(total_data, label);
csvwrite('data\signal.csv',total_data');

for snr_ = SNR
    % 여기서 꼭 초기화
    total_noise_data = [];
    for i = 1:length(s_data)
        data = load(s_data.name);
        data = signal_cut(data, OPTION, START_TIME, END_TIME);
        noise_data = signal_noise(data, snr_, OPTION_PLT);
        total_noise_data = horzcat(total_noise_data, noise_data(:,2));
    end
    total_noise_data = vertcat(total_noise_data, label);
    csvwrite(strcat('data\signal_snr',string(snr_),'.csv'),total_noise_data');
end
    