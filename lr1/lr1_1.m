% �������� ����������������
pix = 0:255;

img = imread('11_peppers2.tif');
hist = imhist(img);

img = double(img);

x_max = max(max(img)); 
x_min = min(min(img));

a = 255 / (x_max - x_min);
b = -255 * x_min / (x_max - x_min);
img_out = img*a + b;

img = uint8(img);
img_out = uint8(img_out);
hist_out = imhist(img_out);

figure; imshow(img); datacursormode; title('�������� �����������'); 
figure; imshow(img_out); datacursormode; title('����������������� �����������');
figure;  plot(pix, hist); datacursormode; title('����������� ��������� �����������');
figure; plot(pix, hist_out); datacursormode; title('����������� ������������������ �����������')

figure; plot(pix, a*pix + b); datacursormode; title('������ ��')