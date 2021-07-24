%%决定统一将这一段变成函数了


function result_image=window_tihuan(oimage,daiti_number,ytfmx,ytfmn)

[x,y]=size(oimage);
%%
%记录替换到的1/2大小的原图（即参考图2x2窗口来源）的顶点坐标（先默认是对的了）
%tmx对应到原图顶点x坐标
%tmy对应到原图顶点y坐标
tmx=zeros((x-1)*(y-1),1);%60162
tmy=zeros((x-1)*(y-1),1);%60162%272/2=136
parfor i=1:((x-1)*(y-1))%60162
    if(mod(daiti_number(i,1),floor((y+1)/2)-1)==0)   %floor((y+1)/2)-1=135
    tmx(i,1)=2*(daiti_number(i,1)/(floor((y+1)/2)-1))-1;     %(floor((y+1)/2)-1)=135%136列
    tmy(i,1)=2*(floor((y+1)/2)-1)-1;
    else
    tmx(i,1)=2*(floor(daiti_number(i,1)/(floor((y+1)/2)-1))+1)-1;    %行(floor((y+1)/2)-1)=135
    tmy(i,1)=2*mod(daiti_number(i,1),(floor((y+1)/2)-1))-1;   %行(floor((y+1)/2)-1)=135
    end
end
%扩张至3x3窗口的时候,在原图的顶点坐标
%tmx为原图顶点x坐标，tmy对应原图顶点y坐标
%但是实上对应坐标还是没有用的，应该得对每一个坐标归一化之后，进行替换


%%
%按需要替换的顺序列出所有3x3窗口
%%按照2x2窗口滑动顺序，列出所有待扩充图的2x2滑动窗口对应的3x3窗口

sytslide_window=zeros(3,3,(x-1)*(y-1));     %60162%((223-1)/2=111)*(272/2=136)=111*136
%原图yt滑动窗口
parfor i=1:(x-1)*(y-1)%60162
    sytslide_window(:,:,i)=oimage(tmx(i,1):tmx(i,1)+2,tmy(i,1):tmy(i,1)+2);
end

%% 替代窗口归一化0306
%改为函数
g_diff_sytslide_window=guiyihua(sytslide_window);
%% 替换
%将2x2窗口全部替换成3x3窗口平铺开来，得到一个大小666,813的矩阵a_ftm
p=1;
a_ftm=zeros(3*(x-1),3*(y-1));    %(223-1)*3=666,(272-1)*3=813);
for i=1:3:3*(x-1)-2
for j=1:3:3*(y-1)-2
a_ftm(i:i+2,j:j+2)=g_diff_sytslide_window(:,:,p)*ytfmx(p,1)+ytfmn(p,1);
p=p+1;
end
end
%对重合的地方合并
result_image=a_ftm;
%对于每一行i
for i=3:3:3*(x-1)-1
    for j=1:3*(y-1)
        result_image(i,j)=1/2*(a_ftm(i,j)+a_ftm(i+1,j));
    end
end
%对于每一列j
for j=3:3:3*(y-1)-1
    for i=1:3*(x-1)
        result_image(i,j)=1/2*(a_ftm(i,j)+a_ftm(i,j+1));
    end
end
%删除多余的行和列
%构造要删除的行和列的数组
result_image(4:3:3*(x-1),:)=[];
result_image(:,4:3:3*(y-1))=[];

[f1,f2]=size(result_image);
%然后再重新赋上各个顶点的值
for i=1:2:f1
    for j=1:2:f2
        result_image(i,j)=oimage(floor(1/2*(i+1)),floor(1/2*(j+1)));
    end
end