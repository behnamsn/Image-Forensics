clc;
clear all;
close all;
image_dir = 'Dresden\flatfield\Canon_Ixus70_0';

 Im = dir([image_dir,'\*.jpg']); 
% estimate fingerprint (3 channels) addpath(image_dir)
 RP = getFingerprint(Im); 
% obtain actual PRNU 
RP = rgb2gray1(RP);
%% remove periodic artifacts through Wiener filtering of DFT 
% sigmaRP = std2(RP); 
% Fingerprint = WienerInDFT(RP,sigmaRP);
%% 
 image_dir = 'Dresden\natural\Same';
 Im = dir([image_dir,'\*.jpg']);
 addpath(image_dir) 
 for k = 1:length(Im) 
       Noisex1(:,:,1,k) = NoiseExtractFromImage(Im(k).name,2);
       Ix1(:,:,1,k) = double(rgb2gray(imread(Im(k).name)));
 end   
 
 %% Normalized Correliation
for i=1:length(Im)
    C1(:,:,1,i) = corrcoef(Noisex1(:,:,1,i), Ix1(:,:,1,i).*RP); 
rho1(1,i)= C1(1,2,1,i);
end
%%
 image_dir = 'Dresden\natural\Different';
 Im = dir([image_dir,'\*.jpg']);
 addpath(image_dir) 
 for k = 1:length(Im) 
       Noisex2(:,:,1,k) = NoiseExtractFromImage(Im(k).name,2);
       Ix2(:,:,1,k) = double(rgb2gray(imread(Im(k).name)));
 end    
 %% Normalized Correliation
for i=1:length(Im)
    C2(:,:,1,i) = corrcoef(Noisex2(:,:,1,i), Ix2(:,:,1,i).*RP); 
rho2(1,i)= C2(1,2,1,i);
end
%% PCE (value of PCE between Noisex and Ix.*RP will be contained in metric). try "help PCE" for info on PCE output
%  C1 = crosscorr(Noisex1, Ix_1.*RP); 
% Out = PCE(C1); 
% metric = Out.PCE;
%% Results
mu_s=mean(rho1)
mu_D=mean(rho2)
s_S=std(rho1)
s_D=std(rho2)
figure;
nbins=50;
    hist(rho1,nbins);
    hold on;
    hist(rho2,nbins);
%%  