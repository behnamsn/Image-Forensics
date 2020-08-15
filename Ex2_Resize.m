clc;
RF=0.25;
for k=1:length(Im)
   F=double(rgb2gray(imresize(imread(Im(k).name),RF)));
   Ixr(:,:,1,k)=F(1:512,1:512);
 end

 for k=1:length(Im)
  D = NoiseExtractFromImage(imresize(imread(Im(k).name),RF),2);
  Noisexr(:,:,1,k)=D(1:512,1:512);
 end
%% Normalized Correlation
%  for j=1:10
% for i=1:length(Im)
%      H=PRNU(j).fingerprint;
%     H=H(1:1536,1:1536);
%     Cr(:,:,1,i) = corrcoef(Noisexr(:,:,1,i), Ixr(:,:,1,i).*H); 
% rhor(i,j)= C(1,2,1,i);
% if rho(i,j)>T
%     Gr(i,j)=1;
% else
%     Gr(i,j)=0;    
% end
% end
%  end
 %% PCE Metric
for j=1:10
for i=1:length(Im)
   H=PRNU(j).fingerprint;
   H=H(1:512,1:512);
 Cr(:,:,1,j) = crosscorr(Noisexr(:,:,1,i), Ixr(:,:,1,j).*H);
 Out(1,j) = PCE(Cr(:,:,1,j));
 metric(i,j) = Out(1,j).PCE;
    if metric(i,j)>60
    Gr(i,j)=1;
else
    Gr(i,j)=0;
end
end
end
%% Plot Bargraph
%x1=[ones(1,PD) zeros(1,PMD) NaN(1,PFA)];
%y1=categorical(x1,[1 0 NaN],{'Correct Detection','Missed Detection','False Alarm'}); 
%histogram(y1,'BarWidth', 0.3 , 'facecolor','blue');
%bd=legend('Probabilities');
%bd.FontSize=10;
 
