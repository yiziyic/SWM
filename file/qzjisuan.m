
function daiti_number=qzjisuan(hyt_image,h_image,slopeyt_image,slope_image,qz_h)

%% 计算高度相关性+坡度相关性-修改坡度0306
%计算得到每个替换窗口,daiti_number(60162,1)记录每个原图像窗口想要替换压缩图像的窗口序列号
%已经分别求出窗口，接下来求出对应的情况，对应每一个原图窗口，找出最相似的窗口，并进行替换

% global qz_h_1;
% % global qz_h_2;
% global qz_s_1;
% % global qz_s_2;

qz_s=1.0-qz_h;
global yx_num;
global ysjz;


[x,y,z]=size(hyt_image);
mt=1000;%设定一个较大的值方便替换
daiti_number=zeros(z,1);%60162%记录每一个需要替换的原图的窗口编号
for i=1:z
    for j=1:yx_num    
slope_t=sum(sum((slopeyt_image(:,:,i)-slope_image(:,:,j)).^2));
	 height_t=sum(sum((hyt_image(:,:,i)-h_image(:,:,j)).^2));
     t=qz_s*slope_t+qz_h*height_t;
       if(t<mt)
           mt=t;
           daiti_number(i,1)=ysjz(j);%j的取值为1-14985
       end
    end
    mt=10000000;%重新找的时候，将最小值重新设定
end


end