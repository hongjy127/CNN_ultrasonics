function [time, amplitude] = cut_signals(data, option, start_time, end_time)

% Cut the signals
% Option 1: Cut the signals at the same time range (길이가 같)
% Option 2: Cut the signals based on positive peak (길이가 다름)
    
    time_ = data(:,1);
    dt = time_(2)-time_(1);
    amplitude_ = data(:,2);

    if and(nargin == 4, option == 1)
        point = round((end_time-start_time)/dt);
        try
            [~,idx] = min(abs(time_-start_time));
            time = time_(idx:idx+point-1);
            amplitude = amplitude_(idx:idx+point-1);
        catch
            % 범위에 없으면 끝부분 자름
            time = time_(end-point+1:end);
            amplitude = amplitude_(end-point+1:end);
            disp('time range가 범위에 없습니다.')
        end

    elseif and(nargin == 2, option == 2)
        start_time=0; end_time=0;
        [~,locs]=findpeaks(amplitude_,'minpeakheight',max(amplitude_)*0.1);
        idx = find(amplitude_(1:locs(1)) < 0,1,'last');
        time = time_(idx:end); amplitude = amplitude_(idx:end);

    elseif or(option ~= 1, option ~= 2)
        error('Error. Option must be a 1 or 2')
    end
end

