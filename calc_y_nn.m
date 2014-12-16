function [Z, y] = calc_y_nn(X, weight1, weight2, num_classes)

Z = sigmoid(X*weight1);
Z = [ones(size(Z, 1), 1) Z];
exp_y = exp(Z*weight2');
sum_exp_y = sum(exp_y, 2);
rep_exp_y = repmat(sum_exp_y, 1, num_classes);
y = exp_y./rep_exp_y;

end