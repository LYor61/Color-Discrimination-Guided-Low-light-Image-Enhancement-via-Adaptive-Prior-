function [img_out,A] = new(I0)
t0=mean2(I0);
fg=0.15;
I00 = 1- I0; 
if t0<fg
sigma=0.001*norm(I00(:));
gausFilter=fspecial('gaussian',5,sigma);
I00=imfilter(I00,gausFilter,'replicate');
end
[I ,A]= removeHaze(I00,t0); 
I2 = 1 - I;%figure,imshow(I2,[])
I2=gamaV(I2,I00);
img_out = I2;
end

function  [I_out,A] = removeHaze( I,t0 )
J =min(I,[],3);
al =1-2.05*t0;
A=get_A(I,J);
% A=ones(size(I)); 
T_est = 1 - al*J;
gausFilter=fspecial('gaussian',15,1);
T_est=imfilter(T_est,gausFilter,'replicate');
T_est=t0+(1-t0)*T_est; 
dehazed = zeros(size(I));
for c = 1:3
dehazed(:,:,c) =(I(:,:,c) - A(c))./T_est+ A(c);
end
I_out = dehazed;
end

function out=gamaV(in,I)
ycbcr=rgb2ycbcr(in);
V=ycbcr(:,:,1);
m=max((mean(I,3)-0.2),0.6);
V=V.^m;
M=mean(I(:));
ycbcr(:,:,1)=V+0.08*M;
out=ycbcr2rgb(ycbcr);
end

function A = get_A(image, dark_channel)
[m, n, ~] = size(image);
n_pixels = m * n;
n_search_pixels = floor(n_pixels * 0.01);%选取1%的数据
dark_vec = reshape(dark_channel, n_pixels, 1);
image_vec = reshape(image, n_pixels, 3);
[~, indices] = sort(dark_vec, 'descend');%降序排列后的元素的位置索引
accumulator = zeros(1, 3);
for k = 1 : n_search_pixels%选取反转后图像三通道里最小值中的前1%最大的数据
    accumulator = accumulator + image_vec(indices(k),:);
end
A = accumulator / n_search_pixels;%选取反转后图像三通道里最小值中的前1%最大的数据的均值
end