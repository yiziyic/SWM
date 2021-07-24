%% 坡度计算函数
%根据foimage改编

%坡度计算，先计算边缘
function slope_image=podujisuan(image,cellsize)

%初始化
[x,y]=size(image);
f_sqt=zeros(x,y);

%1
i=1;
    for j=2:floor((y+1)/2)-1
f_fx=((image(2,j+1)-image(2,j-1))+sqrt(2)*(image(1,j+1)-image(1,j-1)))/((2+2*sqrt(2))*cellsize);
f_fy=((image(2,j-1)-image(1,j-1))+sqrt(2)*(image(2,j)-image(1,j))+(image(2,j+1)-image(1,j+1)))/((2+sqrt(2))*cellsize);
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

    end
%2
    i=floor((x+1)/2);
    for j=2:floor((y+1)/2)-1
f_fx=((image(i-1,j+1)-image(i-1,j-1))+sqrt(2)*(image(i,j+1)-image(i,j-1)))/((2+2*sqrt(2))*cellsize);
f_fy=((image(i,j-1)-image(i-1,j-1))+sqrt(2)*(image(i,j)-image(i-1,j))+(image(i,j+1)-image(i-1,j+1)))/((2+sqrt(2))*cellsize);
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

    end
%3
j=1;
    for i=2:floor((x+1)/2)-1
f_fx=((image(i-1,2)-image(i-1,1))+sqrt(2)*(image(i,2)-image(i,1))+(image(i+1,2)-image(i+1,1)))/((2+sqrt(2))*cellsize);
f_fy=((image(i+1,2)-image(i-1,2))+sqrt(2)*(image(i+1,1)-image(i-1,1)))/((2+2*sqrt(2))*cellsize);
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

    end
% 4
    j=floor((y+1)/2);
    for i=2:floor((x+1)/2)-1
f_fx=((image(i-1,j)-image(i-1,j-1))+sqrt(2)*(image(i,j)-image(i,j-1))+(image(i+1,j)-image(i+1,j-1)))/((2+sqrt(2))*cellsize);
f_fy=((image(i+1,j-1)-image(i-1,j-1))+sqrt(2)*(image(i+1,j)-image(i-1,j)))/((2+2*sqrt(2))*cellsize);
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

    end
% 5
i=1;
j=1;
f_fx=(image(1,2)-image(1,1))/cellsize;
f_fy=(image(2,1)-image(1,1))/cellsize;
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

%6
i=floor((x+1)/2);
j=1;
f_fx=(image(i,2)-image(i,1))/cellsize;
f_fy=(image(i,1)-image(i-1,1))/cellsize;
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);

%7
i=1;
j=floor((y+1)/2);
f_fx=(image(1,j)-image(1,j-1))/cellsize;
f_fy=(image(2,j)-image(1,j))/cellsize;
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);
%8
i=floor((x+1)/2);
j=floor((y+1)/2);
f_fx=(image(i,j-1)-image(i,j))/cellsize;
f_fy=(image(i-1,j)-image(i,j))/cellsize;
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);
%循环
for i=2:floor((x+1)/2)-1
    for j=2:floor((y+1)/2)-1
f_fx=(image(i-1,j+1)-image(i-1,j-1)+sqrt(2)*(image(i,j+1)-image(i,j-1))+(image(i+1,j+1)-image(i+1,j-1)))/((4+2*sqrt(2))*cellsize);
f_fy=((image(i+1,j+1)-image(i-1,j+1))+sqrt(2)*(image(i+1,j)-image(i-1,j))+(image(i+1,j-1)-image(i-1,j-1)))/((4+2*sqrt(2))*cellsize);
f_sqt(i,j)=sqrt(f_fx^2+f_fy^2);
    end
end
slope_image=roundn((atan(f_sqt)*57.29578),-2);
end