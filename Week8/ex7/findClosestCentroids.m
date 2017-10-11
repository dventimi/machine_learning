function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%
  
% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
  idx = cellfun(@(x)findClosestCentroid(x,centroids),
		mat2cell(X,ones(1,size(X,1))));
% =============================================================
end

function closest = findClosestCentroid(x, centroids)
  d = x-centroids;
  closest = nthargout(2,@sort,cellfun(@norm,mat2cell(d,ones(1,size(d,1)))))(1);
end
