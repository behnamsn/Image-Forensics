clc;
close all;
image_dir='Dresden\natural\Ex';
Im=dir([image_dir,'\*.jpg']);
addpath(image_dir)
for k=1:length(Im)
    D = NoiseExtractFromImage(Im(k).name,2);
    F = double(rgb2gray(imread(Im(k).name)));
    Noisex(:,:,1,k)=D(1:1024,1:1024);
    Ix(:,:,1,k)=F(1:1024,1:1024);
end
%% Threshold Computation
FPR=1e-6; 
T=erfcinv(2*FPR)*sqrt(2/(1024*1024));
%% Normalized Correliation
for j=1:10
for i=1:length(Im)
    C(:,:,1,i) = corrcoef(Noisex(:,:,1,i), Ix(:,:,1,i).*PRNU1024(j).fingerprint); 
rho(i,j)= C(1,2,1,i);
if rho(i,j)>T
    G(i,j)=1;
else
    G(i,j)=0;
end
end
end

%% PCE Metric
% for j=1:10
% for i=1:length(Im)
%   C(:,:,1,j) = crosscorr(Noisex(:,:,1,i), Ix(:,:,1,j).*PRNU1024(j).fingerprint);
%  Out(1,j) = PCE(C(:,:,1,j));
%   metric(i,j) = Out(1,j).PCE;
%   if metric(i,j)>60
%     G(i,j)=1;
% else
%     G(i,j)=0;
% end
%  end
%  end

%% Plot Bargraph
%x1=[ones(1,PD) zeros(1,PMD) NaN(1,PFA)];
%y1=categorical(x1,[1 0 NaN],{'Correct Detection','Missed Detection','False Alarm'}); 
%histogram(y1,'BarWidth', 0.3 , 'facecolor','blue');
%bd=legend('Probabilities');
%bd.FontSize=10;
%xlabel('Detection of Original Images')


