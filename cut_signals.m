function [time, amplitude] = cut_signals(data, start_time, end_time)
% Cut the signals
% Cut the signals at the same time range
time_ = data(:,1);
dt = time_(2)-time_(1);
point = round((end_time-start_time)/dt);
amplitude_ = data(:,2);
try
    [~,idx] = min(abs(time_-start_time));
    time = time_(idx:idx+point-1);
    amplitude = amplitude_(idx:idx+point-1);
catch
    time = time_(end-point+1:end);
    amplitude = amplitude_(end-point+1:end);
    disp('time range가 범위에 없습니다.')
end

