function img_out = My_enhance(I0)
I00 = 1- I0; 
sigma=0.001*norm(I00(:));
gausFilter=fspecial('gaussian',5,sigma);
I00=imfilter(I00,gausFilter,'replicate');%figure,imshow(I4,[]);title('高斯平滑的图像')
I = removeHaze(I00,I0); %figure,imshow(I,[]);title('去雾后的图像')
I2 = 1 - I;
I2=gamaV(I2,I00);
img_out = I2;
end

function  I_out = removeHaze( I, I0 )
J =min(I,[],3);
t0=mean2(I0);
al =1-t0;
A=ones(size(I)); 
T_est = 1 - al*J;
gausFilter=fspecial('gaussian',15,1);
T_est=imfilter(T_est,gausFilter,'replicate');
T_est=t0+(1-t0)*T_est; 
dehazed = zeros(size(I));
for c = 1:3
dehazed(:,:,c) =(I(:,:,c) - A(:,:,c))./T_est+ A(:,:,c);
end
I_out = dehazed;
end

function out=gamaV(in,I)
HSV=rgb2ycbcr(in);
V=HSV(:,:,1);
m=mean(I,3)-0.1;
V=V.^m;
HSV(:,:,1)=V;
out=ycbcr2rgb(HSV);
end
