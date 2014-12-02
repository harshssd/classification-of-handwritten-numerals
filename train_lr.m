function [W, y] = train_lr(data, label)

%%%% generating 10 different classes of binary outputs
num_classes = 10;
y = zeros(size(label, 1), num_classes);
for i = 1 : num_classes
    y(:, i) = (label==i-1);  
end

%%% calculate weights 



W = 10;


end