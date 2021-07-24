%%归一化

function [gy_slide_window,ytfmx,ytfmn]=guiyihua(image)

%% 对待扩充的坡度窗口归一化-0306
%归一化原图窗口image
%求完差值窗口后，进行归一化
%可以直接在循环中判断，其实最后需要求出的还是归一后的窗口，然后还可以直接除最大值
[x,y,z]=size(image);
gy_slide_window=zeros(x,y,z);
ytfmx=zeros(z,1);
ytfmn=zeros(z,1);

parfor i=1:z
%记得把最大最小变成一个数组
%有先后顺序，先把其全部变成正数，所以找出最小值最重要
%找出最小值
ytfmn(i,1)=min(min(image(:,:,i)));
gy_slide_window(:,:,i)=image(:,:,i)-ytfmn(i,1);
%找出最大值
%已经将其全部变为非负数，如果以前为负数，则存在某一个值为0的情况
%记得判断窗口全为0的情况
%归一化则就是除以最大值
ytfmx(i,1)=max(max(gy_slide_window(:,:,i)));
if(ytfmx(i,1)~=0)
    %如果是0的话除以还是0
    gy_slide_window(:,:,i)=gy_slide_window(:,:,i)/ytfmx(i,1);

end
end
end