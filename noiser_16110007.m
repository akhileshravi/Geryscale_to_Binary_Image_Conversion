%% Akhilesh Ravi 16110007

%% Random Noise Binarization
%Random noise in the range [-128 128] and then, the threshold is introduced
%for binarization.

% f - Input Image
% f1 - Input Image after adding Noise
% g2 - f1 after Binarization

function [f1, g2] = noiser_16110007(f)
f1 = f + uint8(randi([-128,128], size(f))); % Random noise in introduced
T = 127;    % Threshold
g2 = 255*(f1 >= T); % Binarization using the threshold
end