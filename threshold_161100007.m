%% Akhilesh Ravi 16110007

%% Thresholding the greyscale image
% This function directly thresholds the greyscale image and converts it into
% a monochrome image (threshold, T = 127)

% f - Input Image
% g1 - Input Image after Binarization

function g1 = threshold_161100007(f)
T = 127;    % Threshold
g1 = 255*(f >= T);
end
