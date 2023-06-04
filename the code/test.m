clear
%%%读取图片
img = imread("C:\liuying\baidupan\LOL\our485\low\2.png");
img0 = im2double(imread("C:\liuying\baidupan\LOL\our485\high\2.png"));
% img = imread('C:\Users\liuying\Desktop\eval15\low\1(1).png');
% img0 = im2double(imread('C:\Users\liuying\Desktop\eval15\high\1(1).png'));
% figure;imshow(img, []);
% title('待增强图像');
% figure;imshow(img0, []);
% title('真实图像');
%%%%%%%参数准备
tic
img_in = im2double(img);
img_out = autocolor(img_in);

toc
% %%%%%%%%%指标
PSNR=psnr(img0,img_out);
SSIM=ssim(img0,img_out);
AB=mean2(img_out);
%%%%%增强图片显示
figure;
imshow(img_out, []);
title(['增强结果 my2 (', 'SSIM:', num2str(SSIM), ' PSNR:',num2str(PSNR),')']);
imwrite(img_out,'04.jpg')
