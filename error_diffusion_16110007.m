%% Akhilesh Ravi 16110007

%% Error Diffusion
% We go pixel by pixel and binarize it using the threshold (T = 127). We
% check the error of the pixel after thresholding with respect to the
% original image. We scale this error and add it to neighbouring pixels
% using a scaling matrix.

% f - Input Image
% g6 - Output image (input image after error diffusion)

function g6 = error_diffusion_16110007(f)

fnew = f;
g6 = uint8(zeros(size(f)));
[m, n] = size(f);
T = 127;    % Threshold

% Applying error diffusion to each pixel (and the surrounding pixels)
for i = 1:m
    for j = 1:n
        g6(i,j) = 255*uint8(fnew(i,j)>=T);  % Binarizing the pixel
        e = double(fnew(i,j)) - double(g6(i,j));    % Error with respect to
                                                    % the original image
        
        % Scaling the error and adding it to the surrounding pixels of the 
        % original image
        if j ~= n
            fnew(i,j+1) = uint8(fnew(i,j+1) + (e*7)/16);
        end
        if i ~= m
            fnew(i+1,j) = uint8(fnew(i+1,j) + (e*5)/16);
            if j ~= n
                fnew(i+1,j+1) = uint8(fnew(i+1,j+1) + e/16);
            end
            if j ~= 1
                fnew(i+1,j-1) = uint8(fnew(i+1,j-1) + (e*3)/16);
            end
        end
        
    end
end

end