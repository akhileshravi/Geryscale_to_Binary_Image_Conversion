%% Akhilesh Ravi 16110007

%% Fidelity Metrics
%Function to find out the fidelity of an image (monochrome) with respect to
%the original image using various metrics. Here we compare how close the
%two images appear to be.

% f - Input Reference Image
% g - Input Image
% a1 - Mean of deviation
% a2 - Mean of absolute deviation
% a3, a4 - Mean of Absolute Deviation after transforming using gamma
% a5, a6 - Mean of Absolute Deviation after applying gamma transformation
%          and then applying a Low Pass Filter

function [a1, a2, a3, a4, a5, a6] = fidelity_16110007(f, g)
[M, N] = size(f);

%% Mean of deviation and Mean of Absolute Deviation

temp = (double(f) - double(g))./(M*N);

% alpha 1 -> metric 1
a1 = sum(sum(temp));

% alpha 2 -> metric 2
a2 = sum(sum( abs(temp) ));


%% Mean of Absolute Deviation after transforming using gamma = 2.2 and gamma = 1/2.2
f1a = 255 * ( (double(f)./255) .^ 2.2);
g1a = 255 * ( (double(g)./255) .^ 2.2);
temp = ( double(abs(f1a - g1a)) )./(M*N);
% alpha 3 -> metric 3
a3 = sum(sum(temp));

f1b = 255 * ( (double(f)./255) .^ (1/2.2) );
g1b = 255 * ( (double(g)./255) .^ (1/2.2) );
temp = ( double(abs(f1b - g1b)) )./(M*N);
% alpha 4 -> metric 4
a4 = sum(sum(temp));

%% Mean of Absolute Deviation after applying gamma transformation and then applying a Low Pass Filter

h = fspecial('gaussian',[7,7]); % Low Pass Filter of size 7x7
% Passing the images through the filter
f2a = imfilter(uint8(f1a),h);
g2a = imfilter(uint8(g1a),h);

f2b = imfilter(uint8(f1b),h);
g2b = imfilter(uint8(g1b),h);

f3a = 255 * ( (double(f2a)./255) .^ (1/3));
g3a = 255 * ( (double(g2a)./255) .^ (1/3));
temp = ( double(abs(f3a - g3a)) )./(M*N);
% alpha 5 -> metric 5
a5 = sum(sum(temp));

f3b = 255 * ( (double(f2b)./255) .^ (1/3) );
g3b = 255 * ( (double(g2b)./255) .^ (1/3) );
temp = ( double(abs(f3b - g3b)) )./(M*N);
% alpha 6 -> metric 6
a6 = sum(sum(temp));

end