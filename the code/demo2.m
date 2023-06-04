clear
tic
Input_path ="C:\liuying\baidupan\LOL\our485\low\";
% output_path="C:\Users\28371\Desktop\论文修改\color\";
namelist = dir(strcat(Input_path,'*.png'));  %获得文件夹下所有的 .jpg图片
len = length(namelist);
DirCell = struct2cell(namelist);%把结构体数组转换成元胞数组
Dir = sort_nat(DirCell(1,:)); %DirCell(1,:)表示第一1列（文件名）
for i = 1:len
    Dir1 = Dir{i};
    image =  imread(strcat(Input_path,Dir1));
%     fprintf('第%d个：%s\n',i,strcat(Input_path,Dir1));
    I=image; %图片完整的路径名
    img_in=im2double(I);
    K2=autocolor(img_in); 
    imwrite(K2,['color3\',char(Dir1)]); 
end
toc