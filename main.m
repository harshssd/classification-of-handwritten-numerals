%% Initialization
clear ; close all; clc

%% Load Data
% GSC features extracted from each of the image: each image is represented 
% by a 512-bit vector, the rst 192 are G (gradient), the next 192 are S 
% (structural) and the last 128 are C (concavity).

train_data0 = load('feature/features_train/0.txt');
train_data1 = load('feature/features_train/1.txt');
train_data2 = load('feature/features_train/2.txt');
train_data3 = load('feature/features_train/3.txt');
train_data4 = load('feature/features_train/4.txt');
train_data5 = load('feature/features_train/5.txt');
train_data6 = load('feature/features_train/6.txt');
train_data7 = load('feature/features_train/7.txt');
train_data8 = load('feature/features_train/8.txt');
train_data9 = load('feature/features_train/9.txt');

num_train = 1500;

% combine the initial 1500 records data of all digit variants
training_data = [train_data0(1:num_train, :) ; train_data1(1:num_train, :) ;
    train_data2(1:num_train, :) ; train_data3(1:num_train, :) ; train_data4(1:num_train, :) ;
    train_data5(1:num_train, :) ; train_data6(1:num_train, :) ; train_data7(1:num_train, :) ; 
    train_data8(1:num_train, :) ; train_data9(1:num_train, :)];

training_label = [0*ones(num_train,1); ones(num_train,1); 
    2*ones(num_train,1); 3*ones(num_train,1); 4*ones(num_train,1); 
    5*ones(num_train,1); 6*ones(num_train,1); 7*ones(num_train,1); 
    8*ones(num_train,1); 9*ones(num_train,1)];


save('training_data', 'training_label'); 
% 'validation_data', 'validation_label', 'test_data', 'test_label');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% Logistic Regression %%%%%%%%%%%%%%%%%%%%
[weight, y] = train_lr(training_data, training_label);

    
