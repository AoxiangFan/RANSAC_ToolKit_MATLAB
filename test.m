clear,clc
close all

warning off
%% example for fundamental matrix estimation

% % A normal example
% load ./data/wash.mat

% A degeneracy example
load ./data/box.mat 

maxTrials = 5000;
threshold = 2.0; % in pixels
confidence = 0.99;

% option: local optimization (LO), degenaracy updating (DEGEN)
LO = true;
DEGEN = true;
[F, inliers] = RANSAC_FundamentalMatrix(X0, Y0, maxTrials, threshold, confidence, LO, DEGEN);
e = mean(SampsonDistanceF(vpts(1:3,:),vpts(4:6,:),F))
figure
showMatchedFeatures(I1, I2, X0(inliers,:), Y0(inliers,:), 'montage');




%% example for homography estimation
load ./data/graf.mat

maxTrials = 5000;
threshold = 1.0; % in pixels
confidence = 0.99;

% option: local optimization (LO)
LO = true;
[H, inliers] = RANSAC_Homography(X0, Y0, maxTrials, threshold, confidence, LO);
e = mean(SampsonDistanceH(vpts(1:3,:),vpts(4:6,:),H))
figure
showMatchedFeatures(I1, I2, X0(inliers,:), Y0(inliers,:), 'montage');

