clc;
close all;
image_dir='Challenge';
Im=dir([image_dir,'\*.jpg']);
addpath(image_dir)
%% one photo check
%Im=dir([image_dir,'\pic02.jpg']);
%addpath(image_dir)
 %  Noisex= NoiseExtractFromImage(Im.name,2);
 %  Ix = double(rgb2gray(imread(Im.name)));
%   for j=8:9
 %   R= PRNU(j).fingerprint;
 %   C = corrcoef(Noisex, Ix.*R); 
 %   rho(1,j)= C(1,2);
 %  end
%% Group photos
  for k=1:length(Im)
    Noisex = NoiseExtractFromImage(Im(k).name,2);
    Ix = double(rgb2gray(imread(Im(k).name)));
    for j=1:10
    L= PRNU(j).fingerprint;
       s=size(Noisex); 
       l=size(L);
    if s(1,1)<l(1,1)
       crop=round((l(1,1)-s(1,1))/2);
       L=( 
       Lprime= 
    end
    end
  end
%% Threshold Computation
FPR=1e-6; 
T=erfcinv(2*FPR)*sqrt(2/(1024*1024));
%% Normalized Correlation
%for j=1:10
   % L= PRNU(j).fingerprint;
   % R= L(1:512,1:512);
%for i=1:length(Im)
    
  %  C(:,:,1,i) = corrcoef(Noisex(:,:,1,i), Ix(:,:,1,i).*R); 
%rho(i,j)= C(1,2,1,i);
%if rho(i,j)>T
 %   G(i,j)=1;
%else
   % G(i,j)=0;
%end
%end
%end

%% PCE METRIC
% for j=1:10
% for i=1:length(Im)
%      L= PRNU(j).fingerprint;
%     R= L(1:512,1:512);
%  C(:,:,1,i) = crosscorr(Noisex(:,:,1,i), Ix(:,:,1,i).*R);
%  Out(i,j) = PCE(C(:,:,1,i));
%  metric(i,j) = Out(i,j).PCE;
% end
% end