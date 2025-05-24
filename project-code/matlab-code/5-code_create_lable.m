clc
clear
close all

cd Final_images\
folderInfo1 = dir('**/*.png');
cd ..\
addpath training_data_out\
load('outcome');
label=[];


 trainingdataanew=str2double((ttrainingdata(:,1)));
for i=1:length(trainingdataanew)
    filename1 =trainingdataanew(i);
    %[x,Fs] = audioread(filename);
    %x=decimate(x,4);
    
    % label extraction
    % finding different labels in text file ('Absent','Present','Unknown')
    %trainingdataa(:,1)=strcat(trainingdataa(:,1));
   
        [row,column]=find(trainingdataanew==filename1);

    
        if ttrainingdata(row,21)=='Abnormal';
          label=[label;{filename1},"'Abnormal'",'1'];
        elseif  ttrainingdata(row,21)=='Normal';
            label=[label;{filename1},"'Normal'",'2'];
        
        end
    
% %     % st transform
%      [st_out,t,f]=st(x,25,350,1,1); 
%      zz=abs(st_out);
     
     
end
T=array2table(label); % Create a table from the matrix
T.Properties.VariableNames={'id','status','statuss'}; % Add the column headers 
writetable(T,'out_cume_label.csv','WriteVariableNames',true);
%filename1='label.xls';
%xlswrite(filename1,label)
%writecell(label,'newlabel.csv')

%filename2='totalimage.xls';
%xlswrite(filename2,totalimage)
