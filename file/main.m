%%��ʼ���Ե��ú������м���
tic
oimage=xlsread('ex1.xlsx');
shimitu=xlsread('nex2.xlsx');
size_window=2;
qz_h1=0.8;
qz_h2=0.8;

%%
foimage=oimage(1:2:end,1:2:end);

%% �߶Ȳο����ڽ�ȡ0307
[~,fslide_window,ysjz,yx_num]=newchuangkou(foimage,size_window);

%% foimage�ο�ͼ�¶ȼ���
cellsize=30;%ԭͼ�ķֱ���
f_cellsize=cellsize*2;
slope_foimage=podujisuan(foimage,f_cellsize);

%% foimage����¶ȴ��� 0306
fslope_fslide_window=newchuangkou(slope_foimage,size_window);

%% ��foimage�¶ȴ��ڹ�һ��0306
[g_diff_slope_fslide_window,~,~]=guiyihua(fslope_fslide_window);

%% �ο��߶ȴ��ڹ�һ��0306
[g_diff_fslide_window,~,~]=guiyihua(fslide_window);

%% �����䣨ԭͼ���¶ȼ���
slope_oimage=podujisuan(oimage,cellsize);

%% oimage�������䣩����¶ȴ���
slope_ytslide_window=newchuangkou(slope_oimage,size_window);

%% �Դ�������¶ȴ��ڹ�һ��-0306
[g_diff_slope_ytslide_window,~,~]=guiyihua(slope_ytslide_window);

%% ����������߶ȴ���
ytslide_window=newchuangkou(oimage,size_window);

%% ������߶ȴ��ڹ�һ��0306
[g_diff_ytslide_window,ytfmx,ytfmn]=guiyihua(ytslide_window);

%% ����߶������+�¶������-�޸��¶�0306
daiti_number=qzjisuan(g_diff_ytslide_window,g_diff_fslide_window,g_diff_slope_ytslide_window,g_diff_slope_fslide_window,qz_h1,ysjz,yx_num);

%%�滻�Ҷ�Ӧ
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

