function data_list = structure_data(folder_path)
% data
%   |- class0
%       |- signal_00.dat
%       |- signal_01.dat
%       |-     ...
%       |- signal_99.dat
%   |- class1
%   |-  ...
%   |- class9

% struct 만들기
data_list = struct('name',[],'label',[]);

folder_list = dir(folder_path);
folder_list(1:2) = []; % 상위폴더 없애기

% 파일 없애기
idx = [];
for i = 1:length(folder_list)
    if isfolder(strcat(folder_list(i).folder,'\',folder_list(i).name))==0
        idx = [idx, i];
    end
end
folder_list(idx) = [];

count = 1;
for i=1:length(folder_list)
    file_path = strcat(folder_list(i).folder,'\',folder_list(i).name);
    file_list = dir(file_path);
    file_list(1:2) = []; % 상위폴더 없애기
    for j=1:length(file_list)
       data_list(count).name = strcat(file_path,'\',file_list(j).name);
       data_list(count).label = i-1;
       count = count+1;
    end
end

end

