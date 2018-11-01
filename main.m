%% Akhilesh Ravi 16110007

%% Implementation of various binarization, halftoning and error diffusion function

%Input Image

%image = 'campus';
image = 'river';
%image = 'snow';

try
    if image == 'campus'
        imagename = strcat(image,'.png');
    else
        imagename = strcat(image,'.jpg');
    end
catch
    imagename = strcat(image,'.jpg');
end



img = imread(imagename);
%img = img(:,:,3);
try
    if size(size(img)) == [1 3]
        f = rgb2gray(img);
    else
        f = img;
    end
catch
    f = img;
end
%image = 'blue';

%% Thresholding
g1 = threshold_161100007(f);
figure
try
    imshow(g1)
    truesize
    imwrite(g1, strcat(image,'g1.tiff'));    
catch 
end

%% Random Noise Thresholding
[f1, g2] = noiser_16110007(f);
figure
try
    imshow(g2)
    truesize
    imwrite(g2, strcat(image,'g2.tiff'));
catch 
end


%% Halftoning with dither matrix sizes
[g3, g4, g5] = halftone_16110007(f);

figure
try
    imshow(g3)
    truesize
    imwrite(g3, strcat(image,'g3.tiff'));
catch 
end

figure
try
    imshow(g4)
    truesize
    imwrite(g4, strcat(image,'g4.tiff'));
catch 
end

figure
try
    imshow(g5)
    truesize
    imwrite(g5, strcat(image,'g5.tiff'));
catch 
end


%% Error diffusion

g6 = error_diffusion_16110007(f);

figure
try
    imshow(g6)
    truesize
    imwrite(g6, strcat(image,'g6.tiff'));
catch 
end


%% Fidelity Metrics

A = zeros(6);
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g1);
A(1,:) = [a1, a2, a3, a4, a5, a6];
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g2);
A(2,:) = [a1, a2, a3, a4, a5, a6];
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g3);
A(3,:) = [a1, a2, a3, a4, a5, a6];
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g4);
A(4,:) = [a1, a2, a3, a4, a5, a6];
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g5);
A(5,:) = [a1, a2, a3, a4, a5, a6];
[a1, a2, a3, a4, a5, a6] = fidelity_16110007(f,g6);
A(6,:) = [a1, a2, a3, a4, a5, a6];

disp('    Fidelity Metrics')
disp('     a1     a2     a3     a4     a5     a6')
disp('g1')
disp(A(1,:))
disp('g2')
disp(A(2,:))
disp('g3')
disp(A(3,:))
disp('g4')
disp(A(4,:))
disp('g5')
disp(A(5,:))
disp('g6')
disp(A(6,:))