img = imread('/Users/jganeeva/Desktop/универ/МПАИ/L5/08_goldhill2.tif');
m = size(img,1);
n = size(img,2);
K_c1 = 20; K_c2 = 50; K_c3 = 100;
img = double(img);

F = fftshift((fft2(img)));

mask1 = zeros(m,n);
mask2 = zeros(m,n);
mask3 = zeros(m,n);

r1 = round(sqrt((m*n)/(pi*K_c1)));
r2 = round(sqrt((m*n)/(pi*K_c2)));
r3 = round(sqrt((m*n)/(pi*K_c3)));
%r1 = 204;
%r2 = 144;
%r3 = 91;

mask1((256-r1):256, 256) = 1;
mask1(256, (256-r1):256) = 1;
mask1(256, 256:(256+r1)) = 1;
mask1(256:(256+r1), 256) = 1;
for i=1:r1
    for j=1:(sqrt(r1^2 - i^2))
        mask1(256+i,256+j) = 1;
        mask1(256+i,256-j) = 1;
        mask1(256-i,256+j) = 1;
        mask1(256-i,256-j) = 1;
    end
end
%figure; imshow(mask1);

mask2((256-r2):256, 256) = 1;
mask2(256, (256-r2):256) = 1;
mask2(256, 256:(256+r2)) = 1;
mask2(256:(256+r2), 256) = 1;
for i=1:r2
    for j=1:sqrt(r2^2 - i^2)
        mask2(256+i,256+j) = 1;
        mask2(256+i,256-j) = 1;
        mask2(256-i,256-j) = 1;
        mask2(256-i,256+j) = 1;
    end
end
%figure; imshow(mask2);

mask3((256-r3):256, 256) = 1;
mask3(256, (256-r3):256) = 1;
mask3(256, 256:(256+r3)) = 1;
mask3(256:(256+r3), 256) = 1;
for i=1:r3
    for j=1:sqrt(r3^2 - i^2)
        mask3(i+256,j+256) = 1;
        mask3(256-i,j+256) = 1;
        mask3(i+256,256-j) = 1;
        mask3(256-i,256-j) = 1;
    end
end
%figure; imshow(mask3);

z1 = F .* mask1;
z2 = F .* mask2;
z3 = F .* mask3;

res1 = ifft2(z1);
res2 = ifft2(z2);
res3 = ifft2(z3);

re1 = real(res1);
im1 = imag(res1);
d_re1 = var(re1, 0, 'all');
d_im1 = var(im1, 0, 'all');
re2 = real(res2);
im2 = imag(res2);
d_re2 = var(re2, 0, 'all');
d_im2 = var(im2, 0, 'all');
re3 = real(res3);
im3 = imag(res3);
d_re3 = var(re3, 0, 'all');
d_im3 = var(im3, 0, 'all');

R1 = (abs(res1));
R2 = (abs(res2));
R3 = (abs(res3));

e1 = double(0); e2 = double(0); e3 = double(0);
for i=1:m
    for j=1:n
        e1 = e1 + (img(i,j) - R1(i,j))^2;
        e2 = e2 + (img(i,j) - R2(i,j))^2;
        e3 = e3 + (img(i,j) - R3(i,j))^2;
    end
end

% квадратичная погрешность
e1 = e1/(m*n);
e2 = e2/(m*n);
e3 = e3/(m*n);

R1 = uint8(R1); R2 = uint8(R2); R3 = uint8(R3); img = uint8(img);
figure; imshow(img); datacursormode; title('Исходное изображение');
figure; imshow(R1); datacursormode; title('1');
figure; imshow(R2); datacursormode; title('2');
figure; imshow(R3); datacursormode; title('3');
