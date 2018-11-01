%% Akhilesh Ravi 16110007

%% Halftoning using dither matrices
% This function halftones the input image by using a dither matrix of a
% given size.
% f - Input Image
% g3 - Output image (input image halftoned by 2x2 dither matrix)
% g4 - Output image (input image halftoned by 4x4 dither matrix)
% g5 - Output image (input image halftoned by 8x8 dither matrix)


function [g3, g4, g5] = halftone_16110007(f)
I2 = [1 2; 3 0];            %Dither matrix of sixe 2x2
T2 = 255 * (I2 + 0.5) / 4;  %The corresponding threshold matrix of size 2x2

I4 = [4*I2 + 1, 4*I2 + 2;   %Dither matrix of sixe 4x4
4*I2 + 3, 4*I2];
T4 = 255* (I4 + 0.5) / 16;  %The corresponding threshold matrix of size 4x4

I8 = [4*I4 + 1, 4*I4 + 2;   %Dither matrix of sixe 8x8
4*I4 + 3, 4*I4];
T8 = 255 * (I8 + 0.5) / 64; %The corresponding threshold matrix of size 8x8

[m, n] = size(f);

%% Dither Matrix of size 2x2
m2 = m + mod(m,2);      % Changing m and n to pad the image so that 
n2 = n + mod(n,2);      % m2 and n2 are even numbers
g3 = uint8(zeros(m2, n2));
g3(1:m, 1:n) = uint8(f);    % g3 - padded image

% Binaring the image by taking blocks of 2x2 from the image and using the 
% 2x2 threshold matrix
for i = 1:2:m2
    for j = 1:2:n2
        g3(i:i+1,j:j+1) = 255.*uint8(g3(i:i+1,j:j+1) >= T2);
    end
end

g3 = g3(1:m, 1:n);  % Removing the padding

%% Dither Matrix of size 4x4
m4 = m + 4 - mod(m,4);  % Changing m and n to pad the image so that 
n4 = n + 4 - mod(n,4);  % m4 and n4 are multiples of 4.
if mod(m,4) == 0
    m4 = m;
end
if mod(n,4) == 0
    n4 = n;
end
g4 = uint8(zeros(m4, n4));
g4(1:m, 1:n) = uint8(f);    % g4 - padded image

% Binaring the image by taking blocks of 4x4 from the image and using the 
% 4x4 threshold matrix
for i = 1:4:m4
    for j = 1:4:n4
        g4(i:i+3,j:j+3) = 255.*uint8(g4(i:i+3,j:j+3) >= T4);
    end
end

g4 = g4(1:m, 1:n);  % Removing the padding

%% Dither Matrix of size 8x8
m8 = m + 8 - mod(m,8);  % Changing m and n to pad the image so that
n8 = n + 8 - mod(n,8);  % m8 and n8 are multiples of 8.
if mod(m,8) == 0
    m8 = m;
end
if mod(n,8) == 0
    n8 = n;
end
g5 = uint8(zeros(m8, n8));
g5(1:m, 1:n) = uint8(f);    % g5 - padded image

% Binaring the image by taking blocks of 8x8 from the image and using the 
% 8x8 threshold matrix
for i = 1:8:m8
    for j = 1:8:n8
        g5(i:i+7,j:j+7) = 255.*uint8(g5(i:i+7,j:j+7) >= T8);
    end
end

g5 = g5(1:m, 1:n);  % Removing the padding

end