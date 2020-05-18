t1 = [1 1 1; 0 1 0; 0 1 0]; 
t2 = [0 1 0; 0 1 0; 1 1 1]; 
d1 = 3000;
m = 0;

img1 = zeros(64);
img1(43, 12) = 128;
img1(29, 56) = 128;
img1(46,7) = 128;
img_t1 = double(filter2(t2, img1));

img2 = zeros(64);
img2(3,3) = 128;
img2(22,34) = 128;
img_t2 = double(filter2(t1, img2));

img_t = img_t1 + img_t2;
figure; imshow(img_t); datacursormode; title("Расположение объектов");

noise = double(normrnd(0, sqrt(d1), 64, 64));
res_img = noise + img_t;
figure; imshow(res_img, [min(min(res_img)) max(max(res_img))]); datacursormode; title("Изображение с шумом и объектами")

tmp = zeros(66);
tmp(2:65, 2:65) = res_img;

Img = zeros(66);
for i=2:65
    for j=2:65
       matr_tmp = tmp(i-1:i+1, j-1:j+1);
       s = sum(sum(matr_tmp .^2));
       Img(i,j) = tmp(i,j)/sqrt(s);
    end
end

% выравнивание энергии эталонов
 d_tmp1 = 0;
 d_tmp2 = 0;
    for i=1:3
        for j=1:3
            d_tmp1 = d_tmp1 + t1(i,j)^2;
            d_tmp2 = d_tmp2 + t2(i,j)^2;
        end
    end
    
    for i=1:3
        for j=1:3
            t1(i,j) = t1(i,j) / sqrt(d_tmp1);
            t2(i,j) = t2(i,j) / sqrt(d_tmp2);
        end
    end
    
img_out1 = Img;% нормализованное изображение
figure; imshow(noise, [min(min(noise)) max(max(noise))]); datacursormode; title("Белый шум с дисперсией 3000");
figure; imshow(img_out1, [min(min(img_out1)) max(max(img_out1))]); datacursormode; title("После нормализации");

res1 = (filter2(t1,img_out1));
res2 = (filter2(t2,img_out1));
figure; imshow(res1, [min(min(res1)) max(max(res1))]); datacursormode; title("B(m,n) 1");
figure; imshow(res2, [min(min(res2)) max(max(res2))]); datacursormode; title("B(m,n) 2");
h1 = imhist(res1);
h2 = imhist(res2);
figure; plot(0:255, h1); datacursormode; title('Гистограмма 1');
figure; plot(0:255, h2); datacursormode; title('Гистограмма 2');
res1(res1 < 1) = 0;
res1(res1 >= 1) = 255;
res2(res2 < 1) = 0;
res2(res2 >= 1) = 255;
Res = res1 + res2;
figure; imshow(Res); datacursormode; title('Обнаруженные объекты');