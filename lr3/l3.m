I = 255*(checkerboard(64,1,1)); % шахматное поле 128x128, клетка размером 64х64
I = double(I);
D = var(I, 0, 'all'); %1/n-1 наблюдений
I(I < 128) = 96;
I(I >= 128) = 160;
D_img = var(I, 0, 'all'); % дисперсия полученного изображения
I = uint8(I);

% наложение гауссова шума на изображение
G1 = imnoise(I,'gaussian',0,(D_img)/(256*256));
d1 = var(double(G1), 0, 'all');
cko1 = sum((double(G1) - double(I)).^2, 'all')/(128*128); % дисперсия искажений

G2 = imnoise(I,'gaussian',0, ((1/10)*D_img)/(256*256));
d2 = var(double(G2), 0, 'all');
cko2 = sum((double(G2) - double(I)).^2, 'all')/(128*128); % дисперсия искажений


% гауссовый шум
G = uint8(zeros(128));

G3 = imnoise(G, 'gaussian', 0.5, D_img/(256*256));
D3 = var(double(G3), 0, 'all');

G4 = imnoise(G, 'gaussian', 0.5, (1/10)*D_img/(256*256));
D4 = var(double(G4), 0, 'all');


% импульсный шум
N = uint8(zeros(128));

N1 = imnoise(128+N, 'salt & pepper', 0.01);
D1 = var(double(N1), 0, 'all');

N2 = imnoise(128+N, 'salt & pepper', 0.03);
D2 = var(double(N2), 0, 'all');


% наложение импульсного шума на изображение
N3 = imnoise(I, 'salt & pepper', 0.01);
d3 = var(double(N3), 0, 'all');
cko3 = sum((double(N3) - double(I)).^2, 'all')/(128*128); % дисперсия искажений

N4 = imnoise(I, 'salt & pepper', 0.03);
d4 = var(double(N4), 0, 'all');
cko4 = sum((double(N4) - double(I)).^2, 'all')/(128*128); % дисперсия искажений


% печать изображений
figure; imshow(I); datacursormode; title('Исходное изображение');
figure; imshow(G3); datacursormode; title('шум 1');
figure; imshow(G4); datacursormode; title('шум 2');
figure; imshow(N1); datacursormode; title('шум 3');
figure; imshow(N2); datacursormode; title('шум 4');
figure; imshow(G1); datacursormode; title('Зашумленное изображение 1');
figure; imshow(G2); datacursormode; title('Зашумленное изображение 2');
figure; imshow(N3); datacursormode; title('Зашумленное изображение 3');
figure; imshow(N4); datacursormode; title('Зашумленное изображение 4');

%------------------------------------ фильтрация ------------------------------------%
% линейная фильтрация
mask_lin = (1/9)*[1 1 1; 1 1 1; 1 1 1];
f_G1 = filter2(mask_lin, double(G1)); 
cko5 = sum((double(f_G1) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K1 = cko5/cko1; % коэффициент снижения шума

f_G2 = filter2(mask_lin, double(G2));
cko6 = sum((double(f_G2) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K2 = cko6/cko2; % коэффициент снижения шума

f_N3 = filter2(mask_lin, double(N3));
cko7 = sum((double(f_N3) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K3 = cko7/cko3; % коэффициент снижения шума

f_N4 = filter2(mask_lin, double(N4));
cko8 = sum((double(f_N4) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K4 = cko8/cko4; % коэффициент снижения шума

figure; imshow(uint8(f_G1)); datacursormode; title('Отфильтрованное изображение 1 (линейная фильтрация)');
figure; imshow(uint8(f_G2)); datacursormode; title('Отфильтрованное изображение 2 (линейная фильтрация)');
figure; imshow(uint8(f_N3)); datacursormode; title('Отфильтрованное изображение 3 (линейная фильтрация)');
figure; imshow(uint8(f_N4)); datacursormode; title('Отфильтрованное изображение 4 (линейная фильтрация)');


% медианная фильтрация
med_G1 = medfilt2(G1);
cko9 = sum((double(med_G1) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K5 = cko9/cko1; % коэффициент снижения шума

med_G2 = medfilt2(G2);
cko10 = sum((double(med_G2) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K6 = cko10/cko2; % коэффициент снижения шума

med_N3 = medfilt2(N3);
cko11 = sum((double(med_N3) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K7 = cko11/cko3; % коэффициент снижения шума

med_N4 = medfilt2(N4);
cko12 = sum((double(med_N4) - double(I)).^2, 'all')/(128*128); % дисперсия ошибки
K8 = cko12/cko4; % коэффициент снижения шума

figure; imshow(uint8(med_G1)); datacursormode; title('Отфильтрованное изображение 5 (медианный фильтр)');
figure; imshow(uint8(med_G2)); datacursormode; title('Отфильтрованное изображение 6 (медианный фильтр)');
figure; imshow(uint8(med_N3)); datacursormode; title('Отфильтрованное изображение 7 (медианный фильтр)');
figure; imshow(uint8(med_N4)); datacursormode; title('Отфильтрованное изображение 8 (медианный фильтр)');