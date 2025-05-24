clc
clear all
close all

load('ID.mat')
ID=table2array(trainingdataa(2:end,1));
cd Final_images\
folderInfo1 = dir('**/*.png');
cd ..\
addpath training_data_out\
load('trainingdataa');

label=[];
label1=[];
totalimage=[];

 trainingdataanew=str2double((trainingdataa(:,1)));
 
for i=1:length(ID)
    %filename1 =folderInfo1(i).name(:,1:end-4);
    %filename1=str2double(filename1);
    filename1=ID(i);
    %[x,Fs] = audioread(filename);
    %x=decimate(x,4);
    
    % label extraction
    % finding different labels in text file ('Absent','Present','Unknown')
    %trainingdataa(:,1)=strcat(trainingdataa(:,1));
   
        [row,column]=find(trainingdataanew==filename1);

         if trainingdataa(row,3)=='nan';
           label1=[label1 filename1 1];
         elseif trainingdataa(row,3)=='Neonate';
           label1=[label1 filename1 2];
         elseif  trainingdataa(row,3)=='Infant';
           label1=[label1 filename1 3];
        elseif  trainingdataa(row,3)=='Child';
          label1=[label1 filename1 4];
         elseif  trainingdataa(row,3)=='Adolescent';
           label1=[label1 filename1 5];
         elseif  trainingdataa(row,3)=='Young Adult';
           label1=[label1 filename1 6];
       
     end
   if trainingdataa(row,4)=='Male'; 
    label1=[label1 0];
     else 
    label1=[label1 1];
   end 
  label1=[label1 str2double(trainingdataa(row,5)) str2double(trainingdataa(row,6))]; 
  
   if trainingdataa(row,7)=='False'; 
    label1=[label1 0];
     else 
    label1=[label1 1];
   end 
   
label=[label;label1];
label1=[];

  

% %     % st transform
%      [st_out,t,f]=st(x,25,350,1,1); 
%      zz=abs(st_out);
     
     
end

label(isnan(label))=0;
N1 = normalize(label(:,2:end),1);
N1=[0 0 0 0 0;N1];

%T=array2table(label2); % Create a table from the matrix
%T.Properties.VariableNames={'id','age','binery age'} 
%writetable(T,'patient_lable.csv','WriteVariableNames',true);
%filename1='label.xls';
%xlswrite(filename1,label)
%writecell(label,'newlabel.csv')

%filename2='totalimage.xls';
%xlswrite(filename2,totalimage)
