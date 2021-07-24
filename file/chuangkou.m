function slide_window=chuangkou(image,n)

%image滑动图像
%n窗口大小


[x,y]=size(image);
slide_window=zeros(n,n,(x-1)*(y-1));
p=1;
for i=1:x-1
    for j=1:y-1
        slide_window(:,:,p)=image(i:i+n-1,j:j+n-1);
        p=p+1;
    end
end