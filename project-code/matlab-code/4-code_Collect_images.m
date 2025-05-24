clc
clear
close all
cd training_data_out\
folderInfo = dir('**/*.wav');

cd ..\
addpath training_data_out\


% working (current) folder

for i=1:length(folderInfo)
    
   filename =folderInfo(i).name;
   filenamenew{i}=filename(:,1:end-7);
end
%BB=unique(id)
for id=1:942
    
    filename =folderInfo(id).name;
    column=[];
[row,column]=find(contains(filenamenew,filename(:,1:end-7)));
total_im=[];
for i=column
    
    filename = folderInfo(i).name;
    [x,Fs] = audioread(filename);
    x=decimate(x,4);
      
        
    
%     % st transform
     [st_out,t,f]=st(x,25,350,1,1); 
     zz=abs(st_out);
     total_im=cat(3,total_im,zz);
    

    
    
    %figure(i),
    %imshow(zz)
    %imagesc(zz)
end
   signal_num= length(column);
   final_st=[];
    if signal_num==1
        zz=total_im(:,:,1);
         im = ind2rgb(im2uint8(rescale(zz)), colormap);
        filename_out = [filename(:,1:end-7) '.png']
        imwrite(imresize(im, [300 600]), filename_out);
        final_st= cat(1,im,im);
       
    elseif signal_num==2
        for k=1:signal_num
             zz=total_im(:,:,k);
         im = ind2rgb(im2uint8(rescale(zz)), colormap);
        filename_out = [filename(:,1:end-7) '.png']
        imwrite(imresize(im, [300 600]), filename_out);
        final_st= cat(1,final_st,im);
        
        end
         elseif signal_num==4
        for k=1:signal_num
             zz=total_im(:,:,k);
         im = ind2rgb(im2uint8(rescale(zz)), colormap);
        filename_out = [filename(:,1:end-7) '.png'];
        im=imresize(im, [150 600]);
        final_st= cat(1,final_st,im);
        
        
        end
        
    end
     imwrite(final_st, filename_out);
end
   
    
    %print('-dpng','-r300',filename_out); % choose your format and resolution
    %imwrite(zz,filename_out);


