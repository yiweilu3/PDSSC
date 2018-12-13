clc
close all
clear
%acc=[0.61818 .63646 .62424 .60606 .55152;.62424 .62424 .61212 .58788 .6;.56364 .54545 .5697 .55152 .44242];%1e-5
%acc=[.50909 .43636 .4909 .4424 .4606;.61818 .62424 .6303 .62424 .61818;.5697 .5697 .58182 .56364 .46667];%1e-4
% acc=[.4303 .424 .43636 .48485 .43;.4 .44242 .442 .41818 .4727;.533 .55758 .612 .5939 .50909];%1e-3
%  acc=[0.4773 0.57576 0.58782;0.53273 0.58782 0.58182;.6 0.58182 0.528];%1e-3
%  acc=[0.47211 0.59412 0.61382;	0.53551 0.59237 0.58912;0.60504 0.60804 0.53726];
 acc=[0.6262 0.6216 0.5788;0.6199 0.6136 0.6418;0.5643 0.5705 0.5741;0.6192 0.6031 0.625;0.5419 0.5224 0.6039];


size1 = 20; size2 = 10;

bar3(acc,0.9)
aa = [1e-5 1e-3 1e-1]; 
bb = strread(num2str(aa),'%s');
cc = [1e-5 1e-3 1e-1 10 100];
dd = strread(num2str(cc),'%s');
% ee = strread(num2str(cc),'%f');
 set(gca,'xTick',1:3,'xTickLabel',bb)
ee = strread(num2str([0:0.2:0.9]),'%f');
set(gca,'zTick',0:.2:1,'zTickLabel',ee)
set(gca,'yTick',1:5,'yTickLabel',dd)
 
xlabel('$\beta$','interpreter','latex')
ylabel('$\alpha$','interpreter','latex')
zlabel('NMI')
zlim([0 0.9])

set(get(gca,'XLabel'),'FontSize',size1);
set(get(gca,'YLabel'),'FontSize',size1);
set(get(gca,'ZLabel'),'FontSize',size1);
set(gca,'FontSize',size2)

% saveas(gcf,[filename,'_avg.eps'],'psc2')
% saveas(gcf,[filename,'_avg_nuclear.eps'],'psc2')

% figure
% 
% mi = MEDACC;
% bar3(mi,0.9)
% aa = [100 200 300 400 500];
% bb = strread(num2str(aa),'%s');
% cc = [0.4 0.6 0.8 1.0 1.2];
% dd = strread(num2str(cc),'%f');
% set(gca,'xTick',1:5,'xTickLabel',bb)
% set(gca,'yTick',1:5,'yTickLabel',dd)
% set(gca,'zTick',0:0.2:1,'yTickLabel',ee)
% xlabel('$M$','interpreter','latex')
% ylabel('$\lambda$','interpreter','latex')
% zlabel('Median Accuracy')
% zlim([0 1.0])
% 
% set(get(gca,'XLabel'),'FontSize',size1);
% set(get(gca,'YLabel'),'FontSize',size1);
% set(get(gca,'ZLabel'),'FontSize',size1);
% set(gca,'FontSize',size2)
% 
% saveas(gcf,[filename,'_med.eps'],'psc2')
% % saveas(gcf,[filename,'_med_nuclear.eps'],'psc2')
