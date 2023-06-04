clear
tic
Input_path ="C:\liuying\baidupan\LOL\our485\high\";
path="C:\Users\28371\Desktop\论文修改\color6\";
namelist = dir(strcat(Input_path,'*.png'));  %获得文件夹下所有的 .jpg图片
namelist2=dir(strcat(path,'*.png'));
len = length(namelist2);
PSNR=[];
AB=[];
SSIM=[];
% MSE=[];
for i = 1:len
    name=namelist(i).name;  %namelist(i).name; %这里获得的只是该路径下的文件名
    name2=namelist2(i).name;  %namelist(i).name;
    I=imread(strcat(Input_path, name)); %图片完整的路径名
    I0=im2double(imread(strcat(path, name2)));
    img_in=im2double(I);
    K2 = img_in;
    PSNR=[PSNR,psnr(I0,K2)];
    SSIM=[SSIM,ssim(I0,K2)];
    AB=[AB,mean2(I0)];
%     MSE=[MSE,mse(I0(:),K2(:))];
%     figure,imshow(I0,[]);
%     figure,imshow(K2,[]);
end
P=mean(PSNR);
S=mean(SSIM);
A=mean(AB);
% M=mean(MSE);
AB=AB';
% MSE=MSE';
PSNR=PSNR';
SSIM=SSIM';
toc
 beep
