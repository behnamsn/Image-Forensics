clc;
QF=20;
mkdir JPG
image_dir='JPG';

for k=1:length(Im)
    fileName = sprintf([image_dir,'\\JPG%02d.jpg'],k);
 imwrite(imread(Im(k).name),fileName,'quality',QF);
end
In=dir([image_dir,'\*.jpg']);
addpath(image_dir)
for k=1:length(In)
    D = NoiseExtractFromImage(In(k).name,2);
    F = double(rgb2gray(imread(In(k).name)));
    Noisexj(:,:,1,k)=D(1:1024,1:1024);
    Ixj(:,:,1,k)=F(1:1024,1:1024);
end
%% Normalized Correliation
% for j=1:10
% for i=1:length(In)
%     Cj(:,:,1,i) = corrcoef(Noisexj(:,:,1,i), Ixj(:,:,1,i).*PRNU1024(j).fingerprint); 
% rhoj(i,j)= Cj(1,2,1,i);
% if rhoj(i,j)>T
%     Gj(i,j)=1;
% else
%     Gj(i,j)=0;
% end
% end
% end

%% PCE Metric
for j=1:10
for i=1:length(In)
 Cj(:,:,1,j) = crosscorr(Noisexj(:,:,1,i), Ixj(:,:,1,j).*PRNU1024(j).fingerprint);
Out(1,j) = PCE(Cj(:,:,1,j));
 metric(i,j) = Out(1,j).PCE;
   if metric(i,j)>60
    G(i,j)=1;
else
    G(i,j)=0;
end
end
end
%% Plot Bargraph
%x1=[ones(1,PD) zeros(1,PMD) NaN(1,PFA)];
%y1=categorical(x1,[1 0 NaN],{'Correct Detection','Missed Detection','False Alarm'}); 
%histogram(y1,'BarWidth', 0.3 , 'facecolor','blue');
%bd=legend('Probabilities');
%bd.FontSize=10;