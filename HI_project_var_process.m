clc;
clear all;
data_dir ='D:\Healthcare_Informatics_Project';
Process_data = 'D:\Healthcare_Informatics_Project\Process_data';
file_names = dir([data_dir filesep '*.mat']); 
num = length(file_names)
for aa = 1:num
    name_1 = file_names(aa).name;
    data = load([data_dir filesep name_1]);
    data = data.val;
    [m,n] = size(data);
    var_data = zeros(1,n);
    for k = 1:m
        vr(k,:) = var(data(k,:));
    end
    [rows, column] = min(vr);
    var_data = data(column,:);
    Fs = 1000;
    wo = 60/(Fs/2);
    bw = wo/35;
    [b,a] = iirnotch(wo,bw);
    y_60hz = filtfilt(b,a,var_data);
    [b1,a1] = butter(3,[0.5 45]/(Fs/2),"bandpass");
    y_60hz1 = filtfilt(b1,a1,y_60hz);
    name_temp_2 = [name_1];
    new_data_dir = [Process_data filesep name_temp_2];
    save(new_data_dir,"y_60hz1");
    
end