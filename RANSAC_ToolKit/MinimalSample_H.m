function [H, Inlier, indices] = MinimalSample_H(X, Y, N, th)

indices = randperm(N, 4);
H = norm4Point(X(:, indices), Y(:, indices));
d = SampsonDistanceH(X, Y, H);
Inlier = find(d<=th);

end