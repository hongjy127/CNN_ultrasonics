function output = signal_cut(data, option, start_time, end_time)

% Cut the signals
% Option 1: Cut the signals at the same time range (길이가 같음)
% cut_signals(data, 1, start_time, end_time)
% Option 2: Cut the signals based on positive peak (길이가 다름)
% cut_signals(data, 2)
    
    time_ = data(:,1);
    dt = time_(2)-time_(1);
    amplitude_ = data(:,2);

    if and(nargin == 4, option == 1)
        point = round((end_time-start_time)/dt);
        try
            [~,idx] = min(abs(time_-start_time));
            time = time_(idx:idx+point-1);
            amplitude = amplitude_(idx:idx+point-1);
            output = [time, amplitude];
        catch
            % 범위에 없으면 끝부분 자름
            time = time_(end-point+1:end);
            amplitude = amplitude_(end-point+1:end);
            disp('time range가 범위에 없습니다.')
            output = [time, amplitude];
        end

    elseif and(nargin == 2, option == 2)
        start_time=0; end_time=0;
        % Signal Processing Toolbox
        [~,locs]=findpeaks(amplitude_,'minpeakheight',max(amplitude_)*0.1);
        idx = find(amplitude_(1:locs(1)) < 0,1,'last');
        time = time_(idx:end); amplitude = amplitude_(idx:end);
        output = [time, amplitude];

    elseif or(option ~= 1, option ~= 2)
        error('Error. Option must be a 1 or 2')
    end
end

