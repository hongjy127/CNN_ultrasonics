function [time, amplitude] = signal_shift(data, shift_time, shift_rep)
% Shift the signal
time_ = data(:,1);
dt = time_(2)-time_(1);
point = round(shift_time/dt);
amplitude_ = data(:,2);

size_ = [length(data)-shift_rep*point, shift_rep];
time = zeros(size_); amplitude = zeros(size_);
for i=1:shift_rep
    start_point = 1+(i-1)*point; end_point = length(data)-(shift_rep-i)*point;
    time(:,i) = time_(start_point:end_point); amplitude(:,i) = amplitude_(start_point:end_point);
end
end