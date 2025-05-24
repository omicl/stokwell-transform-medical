clc
clear
close all
% make a list of wave files in training_data folder
cd training_data\
folderInfo = dir('**/*.wav');
folderInfo1 = dir('**/*.tsv');
folderInfo2 = dir('**/*.txt');
cd ..\
addpath training_data\
% fir bandpass filter design with fc1 = 20/fs/2 and fc2 = 500/fs/2 with
% fs=4000
f = [0 0.005 0.015 0.245 0.255 1];
a = [0 0 1 1 0 0];
b = firpm(100,f,a);
% feature vector calculation
duration_target = 12.5; % seconds
for i=1:length(folderInfo)
    filename = folderInfo(i).name
    [x,Fs] = audioread(filename);
   
    % signal filtering
    xf = filter(b,1,x);
    
    % main code
    dt = 1/Fs;
    [samples,channels] = size(x);
    duration = (samples-1)*dt;
    
    duration_ratio = duration/duration_target;
    target_duration_samples = (1+duration_target*Fs);
    
    if duration_ratio>1  % truncate
        xf_out = xf(1:target_duration_samples,:);
        
    else                 % do nothing or expand(by repetition and trimming  
        
        repetitions = ceil(1/duration_ratio);
        xf_out = repmat(xf,repetitions,1); % duplicate (by excess)
        xf_out = xf_out(1:target_duration_samples,:); % exact number of samples
        
    end
        
    % export to wav 
    filename_out = [filename(1:length(filename)-4) '.wav']
    audiowrite(filename_out,xf_out,Fs);
    
    end