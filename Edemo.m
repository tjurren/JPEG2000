% Demo of imadjust() for integer images.
clc; % Clear the command window.
close all; % Close all figures (except those of imtool.)
imtool close all; % Close all imtool figures.
clear; % Erase all existing variables.
workspace; % Make sure the workspace panel is showing.
fontSize = 14;
numberOfSteps = 32;

% Create a numberOfSteps by numberOfSteps gray scale step wedge
% image..
grayStepImage = uint8(linspace(0, 255, numberOfSteps));
grayStepImage = repmat(grayStepImage, [numberOfSteps 1]);

% Get the dimensions of the image.
[rows columns numberOfColorBands] = size(grayStepImage)

% Display the original gray scale step wedge image.
subplot(3, 2, 1);
imshow(grayStepImage, []);
axis on; % Display a box around it.
title('Original Grayscale Step Wedge Image', 'FontSize', fontSize);
set(gcf, 'Position', get(0,'Screensize')); % Enlarge figure to full
% screen.

% Let's compute and display the histogram.
[pixelCount grayLevels] = imhist(grayStepImage);
subplot(3, 2, 3);
bar(pixelCount);
title('Histogram of original image', 'FontSize', fontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.

% Let's display a horizontal profile through the image.
subplot(3, 2, 5);
plot(grayStepImage(1, :));
title('Profile Across Original Image', 'FontSize', fontSize);

% Make a second image where grayStepImage has been run through
% imadjust.
% Map 0.25*255 into 0.1*255 and 0.75*255 into 0.8*255.
% In other words, gray levels of 64 or less will get mapped into 191,
% and gray levels of 191 or above will all get mapped into 204.
% image2 will be the same data type (uint8) as the input array even
% though
% the in and out gray levels need to be floating point numbers
% in the range of 0 - 1.
image2 = imadjust(grayStepImage, [.25 .75], [0.1 0.8]);
% Display it.
subplot(3, 2, 2);
imshow(image2);
title('imadjusted Image', 'FontSize', fontSize);
axis on; % Display a box around it, otherwise 204 blends into the
         % background.

% Let's compute and display the histogram.
[pixelCount2 grayLevels2] = imhist(image2);
subplot(3, 2, 4);
bar(pixelCount2);
title('Histogram of imadjusted image', 'FontSize', fontSize);
xlim([0 grayLevels2(end)]); % Scale x axis manually.

% Let's display a horizontal profile through the image.
subplot(3, 2, 6);
plot(image2(1, :));
title('Profile Across imadjusted Image', 'FontSize', fontSize);