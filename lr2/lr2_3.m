% оператор Прюитт
pix = 0:255;
img = imread('11_peppers2.tif');
img = double(img);

mask1 = (1/6).*[-1 -1 -1; 0 0 0; 1 1 1];
mask2 = (1/6).*[-1 0 1; -1 0 1; -1 0 1];
s1 = filter2(mask1, img);
s2 = filter2(mask2, img);

grad = sqrt(s1.^2 + s2.^2);

img_out = grad;
img_out(grad < 20) = 0;
img_out(grad >= 20) = 255;

img = uint8(img);
grad = uint8(grad);
img_out = uint8(img_out);

hist = imhist(grad);

figure; imshow(img); datacursormode; title('Исходное изображение');
figure; imshow(grad); datacursormode; title('Оценка градиента');
figure; plot(pix, hist); datacursormode; title('Гистограмма оценки градиента');
figure; imshow(img_out); datacursormode; title('Контуры');