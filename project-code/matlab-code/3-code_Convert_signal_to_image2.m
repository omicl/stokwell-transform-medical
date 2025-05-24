projectdir = 'training_data_out';
imgext = '.png';
folderInfo = dir( fullfile(projectdir, '**/*_MV.wav'));
cmap = parula(256);
% working (current) folder
for i=1:length(folderInfo)
    filename = fullfile(folderInfo(i).folder, folderInfo(i).name);
    [folder, basename] = fileparts(filename);
    outfilename = fullfile(folder, [basename imgext]);
    [x,Fs] = audioread(filename);
    x=decimate(x,4);
      
    %     % st transform
    [st_out,t,f]=st(x,25,350,1,1); % still need to bo worked out
    zz=abs(st_out);
    
    zzind = uint8(rescale(zz, 0, 255));
    imwrite(zzind, cmap, outfilename);
end