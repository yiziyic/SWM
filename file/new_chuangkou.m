%% 参考窗口截取

function [slide_window,fslide_window,ysjz,yx_num]=newchuangkou(image,n)

yx_num=1;
[x,y]=size(image);
ysjz=zeros((x-1)*(y-1),1);
slide_window=zeros(n,n,(x-1)*(y-1));
fslide_window=zeros(n,n,(x-1)*(y-1));
for i=1:x-1
for j=1:y-1
p=(i-1)*(y-1)+j;
slide_window(:,:,p)=image(i:i+n-1,j:j+n-1);
if (sum(sum(slide_window(:,:,p))))
fslide_window(:,:,yx_num)=slide_window(:,:,p);
ysjz(yx_num)=p;
yx_num=yx_num+1;
end
end
end
fslide_window(:,:,yx_num:(x-1)*(y-1))=[];
if(yx_num==1)
    fslide_window=0;
end
yx_num=yx_num-1;
end

