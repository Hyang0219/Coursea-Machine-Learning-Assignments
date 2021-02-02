%% Recommender Systems

%% Initialization
clear ; close all; clc

% Load data
load('ex8_movies.mat');
load('ex8_movieParams.mat');

% Show the average rating for the first movie
rating = mean(Y(1,R(1,:)));
fprintf('\nThe average rating for the first movie among users is: %f\n', rating);

% Visualise rating on the scale plot
imagesc(Y);
xlabel('Users');
ylabel('Movies');

fprintf('Program paused. Press enter to continue.\n');
pause

% Compute the cost with a reduced datast
num_users = 4; num_movies = 5; num_features = 3;
X_red = X(1:num_movies,1:num_features);
Y_red = Y(1:num_movies,1:num_users);
R_red = R(1:num_movies,1:num_users);
Theta_red = Theta(1:num_users,1:num_features);

% Compute the cost on the given reduced dataset
% Unroll X and Theta matrix into a vector for learning purpose later @fmincg
lambda = 0;
J = cofiCostFunc_h([X_red(:);Theta_red(:)],Y_red,R_red,num_movies,num_users,num_features,lambda);
fprintf('\nThe Cost of the given dataset is %f:\n',J);

fprintf('Program paused. Press enter to continue.\n');
pause

% Check Collaborative filtering gradient on the reduced dataset
lambda = 1.5;
checkCostFunction_h([X_red(:);Theta_red(:)],Y_red,R_red,num_movies,num_users,num_features,lambda);

J = cofiCostFunc_h([X_red(:);Theta_red(:)],Y_red,R_red,num_movies,num_users,num_features,lambda);
fprintf('\nThe Cost of the given dataset is %f with lambda = 1.5:\n',J);

fprintf('Program paused. Press enter to continue.\n');
pause

% Train model using fmincg with a new user
% Create a new user and rate movies
movieList = loadMovieList();

%  Initialize my ratings
my_ratings = zeros(1682, 1);

% Check the file movie_idx.txt for id of each movie in our dataset
% For example, Toy Story (1995) has ID 1, so to rate it "4", you can set
my_ratings(1) = 4;

% Or suppose did not enjoy Silence of the Lambs (1991), you can set
my_ratings(98) = 2;

% We have selected a few movies we liked / did not like and the ratings we
% gave are as follows:
my_ratings(7) = 3;
my_ratings(12)= 5;
my_ratings(54) = 4;
my_ratings(64)= 5;
my_ratings(66)= 3;
my_ratings(69) = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355)= 5;

fprintf('\n\nNew user ratings:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('Rated %d for %s\n', my_ratings(i), ...
                 movieList{i});
    end
end

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% Predict rating for movies after adding the new users
fprintf('\nTraining collaborative filtering...\n');

% Re-load data
load('ex8_movies.mat');

Y = [my_ratings, Y];
R = [my_ratings~=0, R];
[Ynorm, Ymean] = normalizeRatings(Y, R);

% Train the model
num_features = size(X,2);
num_users = size(Y,2);
num_movies = size(Y,1);

% Set Initial Parameters (Theta, X)
X = randn(num_movies, num_features);
Theta = randn(num_users, num_features);
initial_params = [X(:); Theta(:)];

% Set options for fmincg
options = optimset('GradObj', 'on', 'MaxIter', 100);

% Set Regularization
lambda = 10;
theta = fmincg (@(t)(cofiCostFunc_h(t,Ynorm,R,num_movies,...
                num_users,num_features,lambda)), initial_params, options);

% Roll back Theta from vectors to matrices
X = reshape(theta(1:num_movies*num_features),num_movies,num_features);
Theta = reshape(theta(num_movies*num_features+1:end),num_users,num_features);

% Predict movies ratings for all the users
predictions = X*Theta';  % (1682,944)
pred_new_user = predictions(:,1)+Ymean;

% Sort new user predictions
[r movie] = sort(pred_new_user,'descend');

% Print out the recommendations
fprintf('\nTop recommendations for you:\n');
for i=1:10
    j = movie(i);
    fprintf('Predicting rating %.1f for movie %s\n', pred_new_user(j), ...
            movieList{j});
end

fprintf('\n\nOriginal ratings provided:\n');
for i = 1:length(my_ratings)
    if my_ratings(i) > 0 
        fprintf('Rated %d for %s\n', my_ratings(i), ...
                 movieList{i});
    end
end

                