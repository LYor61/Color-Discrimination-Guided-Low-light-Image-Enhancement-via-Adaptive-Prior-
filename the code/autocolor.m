function img_out=autocolor(img_in)
Image = My_enhance(img_in);
G=Image(:,:,2)*255;
B=Image(:,:,3)*255;
sz = size(Image);
num1=sum(sum(B(:)>=88));
num2=sum(sum(G(:)>=61));
answer1 = num1/(sz(1)*sz(2)) ;
answer2 = num2/(sz(1)*sz(2)) ;
a1=0;b1=0;
%%色系判断统计
if (answer1<0.2976 || (answer1>0.3130 && answer1<0.6140)) && ((answer2>0.4028 && answer2<0.5243) || (answer2>0.5761 && answer2<0.6700) || (answer2>0.6894 && answer2<0.8739) || (answer2>0.9180 && answer2<0.9462))
    a1=a1+1;
end
if (answer1<0.2976 || (answer1>0.3130 && answer1<0.6140)) && (answer2>0.6700 && answer2<0.6894) && (answer2-answer1)>0.2
    a1=a1+1;
end
if ((answer1>0.6452 && answer1<0.6531) && (answer2>0.8366 && answer2<0.9176)) || (((answer1>0.6531 && answer1<0.6770) || (answer1>0.6860 && answer1<0.7170)) && (answer2>0.8861 && answer2<0.9489))
    a1=a1+1;
end
if ((answer1>0.7170 && answer1<0.7320) && (answer2>0.8250 && answer2<0.9489)) || ((answer1>0.7350 && answer1<0.7650) && (answer2>0.8870 && answer2<0.9332))
    a1=a1+1;
end
if ((answer1>0 && answer1<0.1250) || (answer1>0.3292 && answer1<0.3890) || (answer1>0.4799 && answer1<0.4950)) && (answer2>0.5400 && answer2<0.5671)
    a1=a1+1;
end
if ((answer2>0.7895 && answer2<0.8006) && (answer1>0.6500 && answer1<0.6530)) || ((answer2>0.9690 && answer2<0.9790) && (answer1>0.4350 && answer1<0.6890))
    a1=a1+1;
end
if (answer2>0.8820 && answer2<0.9330) && ((answer1>0 && answer1<0.1055) || (answer1>0.2560 && answer1<0.2945) || (answer1>0.4500 && answer1<0.4560) || (answer1>0.8077 && answer1<0.8257))
    a1=a1+1;
end
if (answer2>0.7390 && answer2<0.7770) && (answer1>0.6160 && answer1<0.6340)
    a1=a1+1;
end
if (answer2>0.7210 && answer2<0.8165) && ((answer1>0.2640 && answer1<0.3651) || (answer1>0.5087 && answer1<0.5920) || (answer1>0.5930 && answer1<0.6002) || (answer1>0.6008 && answer1<0.6072))
    b1=b1+1;
end
if ((answer1>0.1640 && answer1<0.1880) && (answer2>0.4050 && answer2<0.4280)) || (((answer1>0.3850 && answer1<0.4000) || (answer1>0.4020 && answer1<0.4300)) && ((answer2>0.4700 && answer2<0.4780) || (answer2>0.6362 && answer2<0.6520) || (answer2>0.7920 && answer2<0.9337)))
    b1=b1+1;
end
if (answer1>0.4640 && answer1<0.6072) && ((answer2>0.5981 && answer2<0.6483) || (answer2>0.6674 && answer2<0.6690) || (answer2>0.7065 && answer2<0.7080) || (answer2>0.7326 && answer2<0.7402) || (answer2>0.7440 && answer2<0.7645) || (answer2>0.8578 && answer2<0.9340) || (answer2>0.9350 && answer2<0.9369) || (answer2>0.9375 && answer2<0.9410))
    b1=b1+1;
end
%%色系判断
if a1>0 && b1<1 %%浅色系
Image1=My_enhance1(img_in);
r = Image1(:,:,1);
g = Image1(:,:,2);
b = Image1(:,:,3);
img_out = Image1;
% figure,imshow(img_out,[]);
percent = 0.00008;
img_out(:,:,1)  = F_color(r,percent);
img_out(:,:,2)  = F_color(g,percent);
img_out(:,:,3)  = F_color(b,percent);
else %%深色系
Image2=new(img_in);
img_out=Image2;
end
end