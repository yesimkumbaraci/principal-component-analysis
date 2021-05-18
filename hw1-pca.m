%Yesim Kumbaraci 2233732 coding assignment #1

%QUESTION 1.1

%8x8 scatterplot matrix is obtained with the below function plotmatrix. The
%diagonal of the scatterplot represents a high redundancy, since the attributes 3 to 10 overlap
%with each other. The scatterplot is symmetric(?). There are data clusters
%shown in the scatterplot. Between some variables, e.g. x2 and x4, there
%are 2 clusters, hence a strong relationship. Some variables form just one
%cluster. There are outlier points at all combinations.

D= table2array(DataForPCA);

plotmatrix(D(:,3:10), D(:,3:10)); %PLOTMATRIX FOR THE Q1.

%QUESTION 1.2. 

%The data should first have to be normalized. 
%Although we can perform PCA by calculating multiple steps on array D,
%pca function does it all at once. Coefficient, also known as loadings,
%represent the coefficient for one principal component. Its columns are in
%order of decreasing component variance. There is no need to adjust
%array for mean since pca already does it. Score represent the transformed
%dataset and latent is the variances of the columns in scores. In addition,
%principle component variances (latents) are the eigenvalues of the covariance matrix
%of D. Explained is the total variance explained by each principal
%component.
N = normalize(D);
[coeff,score,latent,tsquared, explained] = pca(N);

%QUESTION 1.3. 

%As said in the 2nd question, explained represent variance explained by each principal
%component in the score array. The informative attributes can be obtained by
%sorting it in descending order. When the cumulative exceeds
% 90%, it means we have reached our most principal components. The first 6
% element of S covers %90.90 of the total variance. There are 10 variables
% and we chose 6 of them to be principal, this means our variables are
% moderately correlated.

S = explained/sum(explained);

total=0;
i=1;
while total < 0.9
    total = total + S(i);
    i=i+1;
end
CS = cumsum(S); %double check 
index = i -1; %num of principal components

%QUESTION 1.4

%The transformed data is the score, and the two most important components
%are x1 and x2. The plot of it is given below.


plotmatrix(score(:,1),score(:,2));

%QUESTION 1.5

%The plot for two most important attributes of score, the transformed
%dataset, shows 3 clusters tendency. Although we have seen clusters in the
%first question too, there were 1 or 2 cluster tendency in that plotmatrix.
%The reason for forming one more cluster can be explained by reducing the
%less important variables, we can derive the actual clusters forming within
%the most explanatory variables. And the relationship is seem to be strong
%among the groups since they form exact separate clusters.
