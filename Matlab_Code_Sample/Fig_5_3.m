dynare BGM2008_BS_MP_A.mod noclearall
load('BGM2008_BS_MP_A_results.mat', 'oo_')
irf1=oo_.irfs;
save irf1
load irf1

dynare BGM2008_BS_MP_B.mod noclearall
load('BGM2008_BS_MP_B_results.mat', 'oo_')
irf2=oo_.irfs;
save irf2
load irf2

dynare BGM2008_BS_MP_C.mod noclearall
load('BGM2008_BS_MP_C_results.mat', 'oo_')
irf3=oo_.irfs;
save irf3
load irf3

ending_cell={'_eps_Z'};

for ii=1:length(ending_cell);
var={'i','pi','pai','r','C','Ne','N','Le','Lc','L','w','rho','mu','d','v','ve','yy','Y','Yr'};
figure('Name','Replication of Figure 5.3');
Horizon = 0:0.25:25;
zeroline = (zeros(length(oo_.irfs.rho_eps_Z)+1,1))';
for jj=1:length(var)
subplot(4,5,jj)
plot(Horizon,[0 eval(['irf1.' var{1,jj},ending_cell{1,ii}])],'Color','r','LineWidth',1,'LineStyle','-'); hold on
plot(Horizon,[0 eval(['irf2.' var{1,jj},ending_cell{1,ii}])],'Color','b','LineWidth',1,'LineStyle','-'); hold on
plot(Horizon,[0 eval(['irf3.' var{1,jj},ending_cell{1,ii}])],'Color','g','LineWidth',1,'LineStyle','-'); hold on
plot(Horizon,zeroline,'Color','k','LineWidth',0.5);
title(var{1,jj}+" to csi",'Fontsize',12)
lwbd=[min(eval(['irf1.' var{1,jj},ending_cell{1,ii}])) min(eval(['irf2.' var{1,jj},ending_cell{1,ii}])) min(eval(['irf3.' var{1,jj},ending_cell{1,ii}])) ];
upbd=[max(eval(['irf1.' var{1,jj},ending_cell{1,ii}])) max(eval(['irf2.' var{1,jj},ending_cell{1,ii}])) max(eval(['irf3.' var{1,jj},ending_cell{1,ii}])) ];
xlim([0 max(Horizon)])
ylim([min(lwbd) max(upbd)]);
end
end
