%% ECE 532: Using fMRI derived functional network features
%  for disease and stimuli classification
%  by Sam Rusk, Ari Biswas, and Chris Fernandez
%  some starter code provided by Kaggle.com and Arno Solin

clear all;
close all;
clc;

%% Warmup Problem 4.1: LS algorithm for underdetermined systems



%% Warmup Problem 4.2: Regularized LS



%% Warmup Problem 4.3: Support Vector Machine



%% Problem 5: Schizophrenia prediction with rs-fMRI data
%% Section 5.1
% Set data paths
  TRAIN_DATA_PATH = './kaggledata/';
  TEST_DATA_PATH  = './kaggledata/';
  MODEL_PATH      = './kaggledata';
  SUBMISSION_PATH = './kaggledata';
  
% Load data

  % Load labels
  labels_train = dataset('file', ...
    fullfile(TRAIN_DATA_PATH,'train_labels.csv'),'Delimiter',',');

  % Load training FNC features from file into a dataset array variable
  FNC_train = dataset('file', ...
    fullfile(TRAIN_DATA_PATH,'train_FNC.csv'),'Delimiter',',');

  % Load training SBM features from file into a dataset array variable
  SBM_train = dataset('file', ...
    fullfile(TRAIN_DATA_PATH,'train_SBM.csv'),'Delimiter',',');

  % Load test FNC features from file into a dataset array variable
  FNC_test = dataset('file', ...
    fullfile(TEST_DATA_PATH,'test_FNC.csv'),'Delimiter',',');

  % Load test SBM features from file into a dataset array variable
  SBM_test = dataset('file', ...
    fullfile(TEST_DATA_PATH,'test_SBM.csv'),'Delimiter',',');

% Combine and normalize data

  % Convert to y \in {-1,1}, 
  % where Healthy Control => -1 and Schizophrenic Patient => 1
  y = 2*double(labels_train.Class)-1;

  % Normalize feature vectors by their standard deviations
  x = [bsxfun(@rdivide,double(SBM_train(:,2:end)), ...
         std(double(SBM_train(:,2:end)),[],1)) ...
       bsxfun(@rdivide,double(FNC_train(:,2:end)), ...
         std(double(FNC_train(:,2:end)),[],1))];
     
  A_test = [bsxfun(@rdivide,double(SBM_test(:,2:end)), ...
      std(double(SBM_test(:,2:end)),[],1)) ...
      bsxfun(@rdivide,double(FNC_test(:,2:end)), ...
      std(double(FNC_test(:,2:end)),[],1))];   
          
A = x;
b = y;

%% Section 5.2: Implement Classifiers
[m,n] = size(A);
SCHIZO = find(b==1);
nSCHIZO = find(b==-1);

patientCol = b(SCHIZO,:);
controlCol = b(nSCHIZO,:);





%% Section 5.3: Testing and Error Estimation

% Load example submission from file into a dataset array variable
example = dataset('file','submission_example.csv','Delimiter',',');

% Enter your scores into the example dataset, 
% using your generated b_hat vector
example.Probability = b_hat(:);

% Save your scores in a submission file called example.csv. 
export(example,'file','kaggledata/example.csv','Delimiter',',');

% Navigate to: https://www.kaggle.com/c/mlsp-2014-mri/submissions/attach
% to submit and view error estimation.


%% Problem 6: Block Design Stimuli Recognition
%% Section 6.1: Partitioned-Subset Cross Validation




%% Section 6.2: Randomized Cross Validation




%% Section 6.3 Interpretation of Results




%% Problem 7: A Neuroscience Perspective: using feature selection methods 
%             to study functional brain networks

























