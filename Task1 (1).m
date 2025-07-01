% CSC-478: Digital Image Processing and Analysis
% Assignment-3, Task 1: License Plate Processing
% Name: Lama Alotibi
% ID: 443201044

clc;
clear;

%% (a) Read the image
img = imread('numPlate.png');

%% (b) Convert the image to grayscale and display both
im1 = rgb2gray(img);             % Convert to grayscale
im1 = im2double(im1);            % Convert to double for processing

% Display the original and grayscale images side by side
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(im1); title('Grayscale Image (im1)');

%% (c) Enhance the grayscale image using high-pass filter
highPassFilter = fspecial('laplacian', 0);        % Create Laplacian filter
im2 = imfilter(im1, highPassFilter, 'replicate'); % Apply filter
im2 = im1 - im2;                                  % Enhance by subtracting filter result

% Display grayscale and enhanced image
figure;
subplot(1,2,1); imshow(im1); title('Grayscale Image (im1)');
subplot(1,2,2); imshow(im2); title('Enhanced Image (im2)');

%% (d - part 1) Convert to binary and remove noise
im3 = imbinarize(im2, 'adaptive', 'Sensitivity', 0.7);  % Adaptive thresholding
im3 = ~im3;  % Invert to get black background and white characters

% Display enhanced and binary image
figure;
subplot(1,2,1); imshow(im2); title('Enhanced Image (im2)');
subplot(1,2,2); imshow(im3); title('Binary Image (im3)');

% Morphological operations to remove noise
se = strel('disk', 1);
im4 = imclose(im3, se);  % Fill gaps
im4 = imopen(im4, se);   % Remove small noise

% Display binary and noise-removed image
figure;
subplot(1,2,1); imshow(im3); title('Binary Image (im3)');
subplot(1,2,2); imshow(im4); title('Noise Removed Image (im4)');

%% (d - part 2) Manually segment im4 into 4 regions and count components

% Manually defined regions based on accurate coordinates (from getrect)
sub1 = imcrop(im4, [ 63.8600, 42.3520, 442.1120, 216.8320]);     % Arabic Digits
sub2 = imcrop(im4, [598.9000, 59.2480, 315.3920, 174.5920]);     % Arabic Characters
sub3 = imcrop(im4, [46.9640, 301.4240, 459.0080, 205.5680]);     % English Digits
sub4 = imcrop(im4, [601.7160, 329.5840, 295.6800, 152.0640]);    % English Characters

% Count connected components (characters/digits) in each region
cc1 = bwconncomp(sub1);
cc2 = bwconncomp(sub2);
cc3 = bwconncomp(sub3);
cc4 = bwconncomp(sub4);

% Display sub-images with component count in titles
figure;
subplot(2,2,1); imshow(sub1); title(['Arabic Digits: ' num2str(cc1.NumObjects)]);
subplot(2,2,2); imshow(sub2); title(['Arabic Characters: ' num2str(cc2.NumObjects)]);
subplot(2,2,3); imshow(sub3); title(['English Digits: ' num2str(cc3.NumObjects)]);
subplot(2,2,4); imshow(sub4); title(['English Characters: ' num2str(cc4.NumObjects)]);

% Print results in Command Window
fprintf('Number of Arabic Digits: %d\n', cc1.NumObjects);
fprintf('Number of Arabic Characters: %d\n', cc2.NumObjects);
fprintf('Number of English Digits: %d\n', cc3.NumObjects);
fprintf('Number of English Characters: %d\n', cc4.NumObjects);
