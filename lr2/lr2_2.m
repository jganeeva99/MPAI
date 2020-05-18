% методы на основе второй производной(лапласиан)
pix = 0:255;
img = imread('11_peppers2.tif');
img = double(img);

%1
mask1 = [0 1 0; 1 -4 1; 0 1 0];
lapl_1 = abs(filter2(mask1, img));

img_out_1 = lapl_1;
img_out_1(lapl_1 < 60) = 0;
img_out_1(lapl_1 >= 60) = 255;

%2
mask2 = (1/2).*[1 0 1; 0 -4 0; 1 0 1];
lapl_2 = abs(filter2(mask2, img));

img_out_2 = lapl_2;
img_out_2(lapl_2 < 30) = 0;
img_out_2(lapl_2 >= 30) = 255;

%3
mask3 = (1/3).*[1 1 1; 1 -8 1; 1 1 1];
lapl_3 = abs(filter2(mask3, img));

img_out_3 = lapl_3;
img_out_3(lapl_3 < 35) = 0;
img_out_3(lapl_3 >= 35) = 255;


img = uint8(img);
lapl_1 = uint8(lapl_1);
lapl_2 = uint8(lapl_2);
lapl_3 = uint8(lapl_3);
img_out_1 = uint8(img_out_1);
img_out_2 = uint8(img_out_2);

hist_1 = imhist(lapl_1);
hist_2 = imhist(lapl_2);
hist_3 = imhist(lapl_3);

figure; imshow(img); datacursormode; title('Исходное изображение');
figure; imshow(lapl_1); datacursormode; title('Оценка лапласиана(1)');
figure; imshow(lapl_2); datacursormode; title('Оценка лапласиана(2)');
figure; imshow(lapl_3); datacursormode; title('Оценка лапласиана(3)');
figure; plot(pix, hist_1); datacursormode; title('Гистограмма оценки лапласиана (первая формула)');
figure; plot(pix, hist_2); datacursormode; title('Гистограмма оценки лапласиана (вторая формула)');
figure; plot(pix, hist_3); datacursormode; title('Гистограмма оценки лапласиана (третья формула)');
figure; imshow(img_out_1); datacursormode; title('Контуры (с первой оценкой лапласиана)');
figure; imshow(img_out_2); datacursormode; title('Контуры (со второй оценкой лапласиана)');
figure; imshow(img_out_3); datacursormode; title('Контуры (с третьей оценкой лапласиана)');