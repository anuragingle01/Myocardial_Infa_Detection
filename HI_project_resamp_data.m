%% Myocardial Infarction data cut
clc;
clear all;
data_dir ='D:\HI_Data_Separate\MI_New';
resamp_data = 'D:\HI_Data_Separate\MI_New\MI_cut';
file_names = dir([data_dir filesep '*.mat']); 
num = length(file_names)
for aa=1:num
    name_1 = file_names(aa).name;
    data = load([data_dir filesep name_1]);
    data = data.y_60hz1;
    [m,n] = size(data);
    resample_data = zeros(m,ceil(n*0.25));
    Fs = 1000;
    [P,Q] = rat(250/Fs);
    xnew = resample(data(m,:),P,Q);
    resample_data(m,:) = xnew;
    [yy zz]=size(resample_data)
    Fs = 750;
    J =zz/750;
    J = floor(J)
    for k = 1:J
        p = Fs*(k-1)+1;
        q = Fs*k;
        data_cut = resample_data(:,[p:q]);
    extention = '.mat';
    name_temp_2 = [name_1(1:end-4) '_' num2str(k) extention];
    new_data_dir = [resamp_data filesep name_temp_2];
    save(new_data_dir,"data_cut");
    end

end

%% %% Healthy Control data cut 
clc;
clear all;
data_dir ='D:\HI_Data_Separate\HC_New';
resamp_data = 'D:\HI_Data_Separate\HC_New\cut_data';
file_names = dir([data_dir filesep '*.mat']); 
num = length(file_names)
for aa=1:num
    name_1 = file_names(aa).name;
    data = load([data_dir filesep name_1]);
    data = data.y_60hz1;
    [m,n] = size(data);
    resample_data = zeros(m,ceil(n*0.25));
    Fs = 1000;
    [P,Q] = rat(250/Fs);
    xnew = resample(data(m,:),P,Q);
    resample_data(m,:) = xnew;
    [yy zz]=size(resample_data)
    Fs = 750;
    J =zz/750;
    J = floor(J)
    for k = 1:J
        p = Fs*(k-1)+1;
        q = Fs*k;
        data_cut = resample_data(:,[p:q]);
    extention = '.mat';
    name_temp_2 = [name_1(1:end-4) '_' num2str(k) extention];
    new_data_dir = [resamp_data filesep name_temp_2];
    save(new_data_dir,"data_cut");
    end

end