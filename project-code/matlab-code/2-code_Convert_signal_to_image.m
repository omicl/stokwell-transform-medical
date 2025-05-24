clc
clear
close all
cd training_data_out\
folderInfo = dir('**/*.wav');

cd ..\
addpath training_data_out\


% working (current) folder


for i=1:length(folderInfo)
    filename = folderInfo(i).name
    [x,Fs] = audioread(filename);
    x=decimate(x,4);
      
        
    
%     % st transform
     [st_out,t,f]=st(x,20,500,1,1); 
     zz=abs(st_out);
     im = ind2rgb(im2uint8(rescale(zz)), colormap);

    
    
    %figure(i),
    %imshow(zz)
    %imagesc(zz)
    filename_out = [filename(1:length(filename)-4) '.png']
    imwrite(imresize(im, [300 300]), filename_out);
    %print('-dpng','-r300',filename_out); % choose your format and resolution
    %imwrite(zz,filename_out);

end 
