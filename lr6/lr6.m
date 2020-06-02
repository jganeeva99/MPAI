x = imread('/Users/jganeeva/Desktop/универ/МПАИ/L6/08_goldhill2.tif');
figure; imshow(x); datacursormode; title('Исходное изображение');
x = double(x);
m = size(x,1); n = size(x,2);
e1 = 0; e2 = 5; e3 = 10;
r1 = 1; r2 = 2; r3 = 3; r4 = 4;

[q1,f1] = MyDifCode(x,e1,r1);
y1 = MyDifDeCode(q1, e1, r1);

[q2,f2] = MyDifCode(x,e1,r2);
y2 = MyDifDeCode(q2, e1, r2);

[q3,f3] = MyDifCode(x,e1,r3);
y3 = MyDifDeCode(q3, e1, r3);

[q4,f4] = MyDifCode(x,e1,r4);
y4 = MyDifDeCode(q4, e1, r4);

figure; imshow(f1, [min(min(f1)) max(max(f1))]); datacursormode; title('Разностный сигнал e = 0, r = 1');
figure; imshow(f2, [min(min(f2)) max(max(f2))]); datacursormode; title('Разностный сигнал e = 0, r = 2');
figure; imshow(f3, [min(min(f3)) max(max(f3))]); datacursormode; title('Разностный сигнал e = 0, r = 3');
figure; imshow(f4, [min(min(f4)) max(max(f4))]); datacursormode; title('Разностный сигнал e = 0, r = 4');
figure; imshow(q1,[min(min(q1)) max(max(q1))]); datacursormode; title('Квантованный разностный сигнал e = 0, r = 1');
figure; imshow(q2,[min(min(q2)) max(max(q2))]); datacursormode; title('Квантованный разностный сигнал e = 0, r = 2');
figure; imshow(q3,[min(min(q3)) max(max(q3))]); datacursormode; title('Квантованный разностный сигнал e = 0, r = 3');
figure; imshow(q4,[min(min(q4)) max(max(q4))]); datacursormode; title('Квантованный разностный сигнал e = 0, r = 4');
prov1 = max(max(abs(x - y1)));
prov2 = max(max(abs(x - y2)));
prov3 = max(max(abs(x - y3)));
prov4 = max(max(abs(x - y4)));


[q5,f5] = MyDifCode(x,e2,r1);
y5 = MyDifDeCode(q5, e2, r1);

q6 = MyDifCode(x,e2,r2);
y6 = MyDifDeCode(q6, e2, r2);

q7 = MyDifCode(x,e2,r3);
y7 = MyDifDeCode(q7, e2, r3);

q8 = MyDifCode(x,e2,r4);
y8 = MyDifDeCode(q8, e2, r4);

figure; imshow(f5, [min(min(f5)) max(max(f5))]); datacursormode; title('Разностный сигнал e = 5, r = 1');
figure; imshow(q5,[min(min(q5)) max(max(q5))]); datacursormode; title('Квантованный разностный сигнал e = 5, r = 1');
figure; imshow(uint8(y5)); datacursormode; title('Восстановленное изображение e = 5, r = 1');
figure; imshow(uint8(y6)); datacursormode; title('Восстановленное изображение e = 5, r = 2');
figure; imshow(uint8(y7)); datacursormode; title('Восстановленное изображение e = 5, r = 3');
figure; imshow(uint8(y8)); datacursormode; title('Восстановленное изображение e = 5, r = 4');
figure; imshow(q5,[min(min(q5)) max(max(q5))]); datacursormode; title('Квантованный разностный сигнал e = 5, r = 1');
figure; imshow(q6,[min(min(q6)) max(max(q6))]); datacursormode; title('Квантованный разностный сигнал e = 5, r = 2');
figure; imshow(q7,[min(min(q7)) max(max(q7))]); datacursormode; title('Квантованный разностный сигнал e = 5, r = 3');
figure; imshow(q8,[min(min(q8)) max(max(q8))]); datacursormode; title('Квантованный разностный сигнал e = 5, r = 4');
prov5 = max(max(abs(x - y5)));
prov6 = max(max(abs(x - y6)));
prov7 = max(max(abs(x - y7)));
prov8 = max(max(abs(x - y8)));


[q9, f9] = MyDifCode(x,e3,r1);
y9 = MyDifDeCode(q9, e3, r1);

q10 = MyDifCode(x,e3,r2);
y10 = MyDifDeCode(q10, e3, r2);

q11 = MyDifCode(x,e3,r3);
y11 = MyDifDeCode(q11, e3, r3);

q12 = MyDifCode(x,e3,r4);
y12 = MyDifDeCode(q12, e3, r4);

figure; imshow(f9, [min(min(f9)) max(max(f9))]); datacursormode; title('Разностный сигнал e = 10, r = 1');
figure; imshow(q9,[min(min(q9)) max(max(q9))]); datacursormode; title('Квантованный разностный сигнал e = 10, r = 1');
figure; imshow(uint8(y9)); datacursormode; title('Восстановленное изображение e = 10, r = 1');
figure; imshow(uint8(y10)); datacursormode; title('Восстановленное изображение e = 10, r = 2');
figure; imshow(uint8(y11)); datacursormode; title('Восстановленное изображение e = 10, r = 3');
figure; imshow(uint8(y12)); datacursormode; title('Восстановленное изображение e = 10, r = 4');
figure; imshow(q9,[min(min(q9)) max(max(q9))]); datacursormode; title('Квантованный разностный сигнал e = 10, r = 1');
figure; imshow(q10,[min(min(q10)) max(max(q10))]); datacursormode; title('Квантованный разностный сигнал e = 10, r = 2');
figure; imshow(q11,[min(min(q11)) max(max(q11))]); datacursormode; title('Квантованный разностный сигнал e = 10, r = 3');
figure; imshow(q12,[min(min(q12)) max(max(q12))]); datacursormode; title('Квантованный разностный сигнал e = 10, r = 4');
prov9 = max(max(abs(x - y9)));
prov10 = max(max(abs(x - y10)));
prov11 = max(max(abs(x - y11)));
prov12 = max(max(abs(x - y12)));

for e=0:50
    q = MyDifCode(x,e,r1);
    p_q = zeros(1, 256);
    sum = 0;
    q1_hist = imhist(uint8(q));
    for i=1:256
        p_q(1, i) = q1_hist(i, 1)/(512*512);
        if (q1_hist(i, 1) ~= 0 )
            sum = sum + p_q(1,i)*log2(p_q(1,i)); 
        end
    end
entr_first(1,e+1) = -sum;
end
%figure; plot(0:50, entr_first);


for e=0:50
    q = MyDifCode(x,e,r2);
    p_q = zeros(1, 256);
    sum = 0;
    q1_hist = imhist(uint8(q));
    for i=1:256
        p_q(1, i) = q1_hist(i, 1)/(512*512);
        if (q1_hist(i, 1) ~= 0 )
            sum = sum + p_q(1,i)*log2(p_q(1,i)); 
        end
    end
%entr_second(1,e+1) = -sum;
end
figure; plot(0:50, entr_second);

function A = predictor(r)
if r == 1
   A = [1, 0, 0, 0];
end
if r == 2
    A = [0.5, 0.5, 0, 0];
end
if r == 3
    A = [0.25, 0.25, 0.25, 0.25];
end
if r == 4
    A = [1, 1, -1, 0];
end
end

function x_pr = x_pred(x, m, n, r)
A = predictor(r);
x_pr = 0;
if n > 1
    x_pr = x_pr + A(1)*x(m,n-1);
end
if m > 1
    x_pr = x_pr + A(2)*x(m-1,n);
end
if m > 1 && n > 1
    x_pr = x_pr + A(3)*x(m-1,n-1);
end
if m > 1 && n < size(x,2)
    x_pr = x_pr + A(4)*x(m-1,n+1);
end
end

function [q,f] = MyDifCode(x,e,r)
m = size(x,1);
n = size(x,2);
q = zeros(m,n);
y = zeros(m,n);
f = zeros(m,n);
for i=1:m
    for j=1:n
        if j == 1
            p = 0;
        else
            p = x_pred(y,i,j-1,r);
        end
        f(i,j) = x(i,j) - p;
        q(i,j) = sign(f(i,j))*floor((abs(f(i,j)) + e)/(2*e + 1));
        y(i,j) = p + q(i,j)*(2*e + 1); % восстановление
    end
end
end

function y = MyDifDeCode(q,e,r)
m = size(q,1);
n = size(q,2);
f = zeros(m,n);
y = zeros(m,n);
for i=1:m
    for j=1:n
        if j == 1
            p = 0;
        else
            p = x_pred(y,i,j-1,r);
        end
        f(i,j) = q(i,j)*(2*e+1);
        y(i,j) = f(i,j) + p;
    end
end
end