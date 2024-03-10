clearvars;
close all;
clc;

im = im2double(imread("image.jpg"));

[nRow, nCol, nChan] = size(im);
[xGrid, yGrid] = meshgrid(1:nRow, 1:nCol);

D = sqrt((xGrid - nRow/2).^2 + (yGrid - nCol/2).^2);

BW = D <= 45;
BW_rep = repmat(BW, [1, 1, nChan]);

sF = fftshift(fft2(im));

filT = BW_rep .* sF;
filtIm = real(ifft2(ifftshift(filT)));

figure;
subplot(1,3,1);
imshow(log(1 + abs(sF)), []);
title('Espectro antes');
subplot(1,3,2);
imshow(log(1 + abs(filT)), []);
title('Espectro después');
subplot(1,3,3);
imshow(BW);
title('Máscara');

figure;
subplot(1,2,1);
imshow(im);
title('Imagen original');
subplot(1,2,2);
imshow(filtIm);
title('Imagen filtrada');

imwrite(filtIm, "image_filtered.jpg");
