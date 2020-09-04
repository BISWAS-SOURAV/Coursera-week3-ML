data = load("ex2data1.txt");
X=data(:,[1,2])
y=data(:,3)

posetive = find(y==1)
negative = find(y == 0)
%X(posetive, 1); % gives 1st column of X if (posetive,1) and 2nd column of X if (posetive,2), which are y=1

plot(X(posetive,1),X(posetive,2),"k+","linewidth",2,"markersize",8)
hold on;
plot(X(negative,1),X(negative,2),"ko","linewidth",1,"markersize",5)

xlabel("Exam 1 score");
ylabel("Exam 2 score");

legend("Admitted","Not Admitted");
title("graph");

[m,n]= size(X);



X=[ones(m,1),X];
initial_theta = zeros(n+1,1)

[cost, grad1] = costFunction(initial_theta, X, y);


test_theta = [-24; 0.2; 0.2];
[cost, grad] = costFunction(test_theta, X, y)

size(X,2)

options = optimset('GradObj', 'on', 'MaxIter', 400)

[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options)

hold on;
plot_x = [min(X(:,2))-2,  max(X(:,2))+2]
hold on;
plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1))
hold on;
plot(plot_x, plot_y)

legend('Admitted', 'Not admitted', 'Decision Boundary')
axis([30, 100, 30, 100])

%h = 1/(1+exp(-X*(theta)))

  % Note: grad should have the same dimensions as theta
  %
  %DIMENSIONS: 
  %   theta = (n+1) x 1
  %   X     = m x (n+1)
  %   y     = m x 1
  %   grad  = (n+1) x 1
  %   J     = Scalar
 
 
%z= X*theta
%size(z)
%hx = sigmoid(z)
%log(hx)
%J = (1/m)*sum((-y.*log(hx))-((1-y).*log(1-hx)))
%Jj = (1/m)*(-y'*log(hx))-((1-y)'*log(1-hx))        wrong
%grad = (1/m)*((hx-y)'*X)


predict1_hx = sigmoid([1,45,85]*theta)  %hx

predict(theta, [1,45,85])

test_theta(2:size(test_theta,1))

