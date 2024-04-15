A = imread('original.jpg');
B = rgb2gray(A);

imwrite(B, 'grayscale.jpg');
