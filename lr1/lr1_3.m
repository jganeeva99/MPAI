% ��������� ��������� 
pix = 0:255;
ts = 90;


img = imread('LENA.TIF');
img = imresize(img, 2);
hist = imhist(img);


out_img = double(img);
out_img(out_img < ts) = 0;
out_img(out_img >= ts) = 255;
out_img = uint8(out_img);
hist_out = imhist(out_img);


figure; imshow(img); datacursormode; title('�������� �����������');
figure; imshow(out_img); datacursormode; title('�������� ���������');
figure; plot(pix, hist); datacursormode; title('����������� ��������� �����������');
figure; plot(pix, hist_out); datacursormode; title('����������� ��������������� �����������');

        
y(pix < ts) = 0;
y(pix >= ts) = 255;
figure; plot(pix, y); datacursormode; title('������ ��');