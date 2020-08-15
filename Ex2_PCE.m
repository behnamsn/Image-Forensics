clc;
close all;

%% PCE Metric
for j=1:length(Im)
 C(:,:,1,j) = crosscorr(Noisex(:,:,1,j), Ix(:,:,1,j).*RP);
 Out(1,j) = PCE(C(:,:,1,j));
 metric(i,j) = Out(i,j).PCE;
end