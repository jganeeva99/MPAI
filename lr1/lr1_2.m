% ����������� �����������
pix = 0:255;

img = imread('LENA.TIF'); 
norm_hist = imhist(img)/(256*256);

img = double(img);
F = cumsum(norm_hist);
y_max = 240;
y_min = 10;
y = (y_max - y_min) * F + y_min;

img_out = y(img + 1);

img = uint8(img);
img_out = uint8(img_out);
hist_out = imhist(img_out);

figure; imshow(img); datacursormode; title('�������� �����������');
figure; imshow(img_out); datacursormode; title('�������������� �����������');
figure; plot(pix, norm_hist); datacursormode; title('����������� ��������� �����������');
figure; plot(pix, hist_out/(256*256)); datacursormode; title('�������������� �����������');
                  
figure; plot(pix, F); datacursormode; title('������������ �������');
figure; plot(pix, y); datacursormode; title('������ ��');
