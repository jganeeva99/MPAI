% градиентные методы
pix = 0:255;
img = imread('11_peppers2.tif');
img = double(img);

H_dx = [-1 ; 1];
H_dy = [-1 1];
tmp = zeros(514,514);
tmp(2:513, 2:513) = img;

img_dx = filter2(H_dx, tmp);
img_dx = abs(img_dx(1:512, 2:513));

img_dy = filter2(H_dy, tmp);
img_dy = abs(img_dy(2:513, 1:512));

grad_f = sqrt(img_dx.^2 + img_dy.^2);

grad_s = abs(img_dx) + abs(img_dy);

grad_t = max(abs(img_dx), abs(img_dy));

img_out_f = grad_f;
img_out_f(grad_f < 30) = 0;
img_out_f(grad_f >= 30) = 255;

img_out_s = grad_s;
img_out_s(grad_s < 40) = 0;
img_out_s(grad_s >= 40) = 255;

img_out_t = grad_t;
img_out_t(grad_t < 30) = 0;
img_out_t(grad_t >= 30) = 255;

img = uint8(img);
img_dx = uint8(img_dx);
img_dy = uint8(img_dy);
grad_f = uint8(grad_f);
grad_s = uint8(grad_s);
grad_t = uint8(grad_t);
img_out_f = uint8(img_out_f);
img_out_s = uint8(img_out_s);
img_out_t = uint8(img_out_t);

hist_grad_f = imhist(grad_f);
hist_grad_s = imhist(grad_s);
hist_grad_t = imhist(grad_t);

figure; imshow(img); datacursormode; title('Исходное изображение');
figure; imshow(img_dx); datacursormode; title('Частная производная по первому направлению');
figure; imshow(img_dy); datacursormode; title('Частная производная по второму направлению');
figure; imshow(grad_f); datacursormode; title('Оценка градиента (первая формула)');
figure; imshow(grad_s); datacursormode; title('Оценка градиента (вторая формула)');
figure; imshow(grad_t); datacursormode; title('Оценка градиента (третья формула)');
figure; plot(pix, hist_grad_f); datacursormode; title('Гистограмма оценки градиента (первая формула)');
figure; plot(pix, hist_grad_s); datacursormode; title('Гистограмма оценки градиента(вторая формула)');
figure; plot(pix, hist_grad_t); datacursormode; title('Гистограмма оценки градиента(третья формула)');
figure; imshow(img_out_f); datacursormode; title('Контуры (с первой оценкой градиента)');
figure; imshow(img_out_s); datacursormode; title('Контуры (со второй оценкой градиента)');
figure; imshow(img_out_t); datacursormode; title('Контуры (с третьей оценкой градиента)');