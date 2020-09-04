data = load("ex2data2.txt")
X = data(:,[1:2])
y = data(:,3)

posetive = find(y==1);
negative = find(y==0);

plot(X(posetive,1),X(posetive,2),"k+","linewidth",10,"markersize",2);
hold on;
plot(X(negative,1),X(negative,2),"ko","linewidth",10,"markersize",2);

xlabel("microchip test 1");
ylabel("microchip test 2");

legend("y=1","y=0");

[m,n] = size(X)
X= [ones(m,1),X]

X(1,:)
size(X,2)
X(:,2)

X = mapFeature(X(:,1), X(:,2));

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1
lambda = 1;

% Compute and display initial cost and gradient for regularized logistic
% regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf(' %f \n', grad(1:5));




% Compute and display cost and gradient
% with all-ones theta and lambda = 10
test_theta = ones(size(X,2),1);
[cost, grad] = costFunctionReg(test_theta, X, y, 10);

fprintf('\nCost at test theta (with lambda = 10): %f\n', cost);

fprintf(' %f \n', grad(1:5));


initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 1;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

hold on;

plotDecisionBoundary(theta, X, y);

p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);