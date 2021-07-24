%%开始尝试调用函数进行计算
tic
oimage=xlsread('ex1.xlsx');
shimitu=xlsread('nex2.xlsx');
size_window=2;
qz_h1=0.8;
qz_h2=0.8;

%%
foimage=oimage(1:2:end,1:2:end);

%% 高度参考窗口截取0307
[~,fslide_window,ysjz,yx_num]=newchuangkou(foimage,size_window);

%% foimage参考图坡度计算
cellsize=30;%原图的分辨率
f_cellsize=cellsize*2;
slope_foimage=podujisuan(foimage,f_cellsize);

%% foimage拆分坡度窗口 0306
fslope_fslide_window=newchuangkou(slope_foimage,size_window);

%% 对foimage坡度窗口归一化0306
[g_diff_slope_fslide_window,~,~]=guiyihua(fslope_fslide_window);

%% 参考高度窗口归一化0306
[g_diff_fslide_window,~,~]=guiyihua(fslide_window);

%% 待扩充（原图）坡度计算
slope_oimage=podujisuan(oimage,cellsize);

%% oimage（待扩充）拆分坡度窗口
slope_ytslide_window=newchuangkou(slope_oimage,size_window);

%% 对待扩充的坡度窗口归一化-0306
[g_diff_slope_ytslide_window,~,~]=guiyihua(slope_ytslide_window);

%% 滑动待扩充高度窗口
ytslide_window=newchuangkou(oimage,size_window);

%% 待扩充高度窗口归一化0306
[g_diff_ytslide_window,ytfmx,ytfmn]=guiyihua(ytslide_window);

%% 计算高度相关性+坡度相关性-修改坡度0306
daiti_number=qzjisuan(g_diff_ytslide_window,g_diff_fslide_window,g_diff_slope_ytslide_window,g_diff_slope_fslide_window,qz_h1,ysjz,yx_num);

%%替换且对应
result_image1=window_tihuan(oimage,daiti_number,ytfmx,ytfmn);

toc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

