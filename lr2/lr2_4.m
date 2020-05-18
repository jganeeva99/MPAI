% метод согласования для лапласиана 
pix = 0:255;
img = imread('11_peppers2.tif');
img = double(img);

mask = (1/3).*[2 -1 2; -1 -4 -1; 2 -1 2];
lapl = abs(filter2(mask, img));

img_out = lapl;
img_out(lapl < 30) = 0;
img_out(lapl >= 30) = 255;

img = uint8(img);
img_out = uint8(img_out);
lapl = uint8(lapl);
hist = imhist(lapl);

figure; imshow(img); datacursormode; title('Исходное изображение');
figure; imshow(lapl); datacursormode; title('Оценка лапласиана');
figure; plot(pix, hist); datacursormode; title('Гистограмма оценки лапласиана');
figure; imshow(img_out); datacursormode; title('Контуры');