%% Initialization
clear ; close all; clc

%% Load Data
% GSC features extracted from each of the image: each image is represented 
% by a 512-bit vector, the rst 192 are G (gradient), the next 192 are S 
% (structural) and the last 128 are C (concavity).

% train_data0 = load('feature/features_train/0.txt');
% train_data1 = load('feature/features_train/1.txt');
% train_data2 = load('feature/features_train/2.txt');
% train_data3 = load('feature/features_train/3.txt');
% train_data4 = load('feature/features_train/4.txt');
% train_data5 = load('feature/features_train/5.txt');
% train_data6 = load('feature/features_train/6.txt');
% train_data7 = load('feature/features_train/7.txt');
% train_data8 = load('feature/features_train/8.txt');
% train_data9 = load('feature/features_train/9.txt');

% test_data0 = load('feature/features_test/0.txt');
% test_data1 = load('feature/features_test/1.txt');
% test_data2 = load('feature/features_test/2.txt');
% test_data3 = load('feature/features_test/3.txt');
% test_data4 = load('feature/features_test/4.txt');
% test_data5 = load('feature/features_test/5.txt');
% test_data6 = load('feature/features_test/6.txt');
% test_data7 = load('feature/features_test/7.txt');
% test_data8 = load('feature/features_test/8.txt');
% test_data9 = load('feature/features_test/9.txt');
% 
% num_train = 1500;


% combine the initial 1500 records data of all digit variants
% training_data = [train_data0(1:num_train, :) ; train_data1(1:num_train, :) ;
%     train_data2(1:num_train, :) ; train_data3(1:num_train, :) ; train_data4(1:num_train, :) ;
%     train_data5(1:num_train, :) ; train_data6(1:num_train, :) ; train_data7(1:num_train, :) ; 
%     train_data8(1:num_train, :) ; train_data9(1:num_train, :)];
% 

%combine the test data of all digit variants
% test_data = [test_data0 ; test_data1 ; test_data2 ; 
%     test_data3 ; test_data4 ; test_data5 ; test_data6 ; 
%     test_data7 ; test_data8 ; test_data9];

% training_label = [0*ones(num_train,1); ones(num_train,1); 
%     2*ones(num_train,1); 3*ones(num_train,1); 4*ones(num_train,1); 
%     5*ones(num_train,1); 6*ones(num_train,1); 7*ones(num_train,1); 
%     8*ones(num_train,1); 9*ones(num_train,1)];
% 

% test_label = [0*ones(size(test_data0, 1),1); ones(size(test_data1, 1),1); 
%      2*ones(size(test_data2, 1),1); 3*ones(size(test_data3, 1),1); 
%      4*ones(size(test_data4, 1),1); 5*ones(size(test_data5, 1),1); 
%      6*ones(size(test_data6, 1),1); 7*ones(size(test_data7, 1),1); 
%      8*ones(size(test_data8, 1),1); 9*ones(size(test_data9, 1),1)];
% 
% save 'test_data.mat' test_data;
% save 'test_label.mat' test_label;
  
% 
% save 'training_data.mat' training_data;
% save 'training_label.mat' training_label;

%save('training_data', 'training_label'); 
% 'validation_data', 'validation_label', 'test_data', 'test_label');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Logistic Regression %%%%%%%%%%%%%%%%%%%%

%%%%%%% Train
load training_data.mat;
load training_label.mat;
[weight] = train_lr(training_data, training_label);
     
%%%%%%% Test
load test_data.mat;
load test_label.mat;
[accuracy_lr, y_lr] = test_lr(test_data, test_label, weight);

%%%%%%% Output
dlmwrite('classes_lr.txt', y_lr);
save 'classes_lr.mat' y_lr;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Neural Networks %%%%%%%%%%%%%%%%%%%%

%%%%%%% Train
% load training_data.mat;
% load training_label.mat;
[weight1, weight2] = train_nn(training_data, training_label);
    
%%%%%%% Test
% load test_data.mat;
% load test_label.mat;
[accuracy_nn, y_nn] = test_nn(test_data, test_label, weight1, weight2);

%%%%%%% Output
dlmwrite('classes_nn.txt', y_nn);
save 'classes_nn.mat' y_nn;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Neural Networks %%%%%%%%%%%%%%%%%%%%
%linear kernel

linmodel = svmtrain (training_label, training_data, '-t 0') ;

[y_svm_train , accuracy_svm_train , prob_estimates] = svmpredict(training_label, training_data,linmodel ) ;

[y_svm , accuracy_svm , prob_estimates] = svmpredict(test_label,test_data,linmodel ) ;