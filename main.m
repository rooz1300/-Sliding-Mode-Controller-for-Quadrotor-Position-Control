clear;
close all;
clear global;
warning off;
clc;
%% 2021b version
out = sim('main_adaptive.slx')
out_smc = sim('main_smc')
%% x y z
fig1=figure(1)
t = tiledlayout(3,1);
nexttile
% subplot(3,1,1)
h=plot(out_smc.x_real.Time,out_smc.x_real.Data ,'-xr','LineWidth',1,'DisplayName','x_{real smc}');
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.x_real.Time,out.x_real.Data ,'-xk','LineWidth',1,'DisplayName','x_{real}');
h.MarkerIndices = 5:200:length(out.x_real.Time );
hold on
plot(out_smc.time,out_smc.xd,'b','LineWidth',1,'DisplayName','x_{desired}')
title('x_{desired} vs  x_{real}')
legend()
xlabel('Time',Interpreter='latex')
ylabel('position',Interpreter='latex')
grid minor

nexttile
% subplot(3,1,2)
name='y';
h=plot(out_smc.y_real.Time,out_smc.y_real.Data ,'-xr','LineWidth',1,'DisplayName',[name '_{real smc}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.y_real.Time,out.y_real.Data ,'-xk','LineWidth',1,'DisplayName','x_{real}');
h.MarkerIndices = 5:200:length(out.x_real.Time );
hold on
plot(out_smc.time,out_smc.yd,'b','LineWidth',1,'DisplayName',[name '_{desired}'])
title([name '_{desired} vs  ' name '_{real}'])
legend()
xlabel('Time',Interpreter='latex')
ylabel('position',Interpreter='latex')
grid minor

nexttile
% subplot(3,1,3)
name='z';
h=plot(out_smc.z_real.Time,out_smc.z_real.Data ,'-xr','LineWidth',1,'DisplayName',[name '_{real smc}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.z_real.Time,out.z_real.Data ,'-xk','LineWidth',1,'DisplayName',[name '_{real}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
plot(out_smc.time,out_smc.zd,'b','LineWidth',1,'DisplayName',[name '_{desired}'])
title([name '_{desired} vs  ' name '_{real}'])
xlabel('Time',Interpreter='latex')
ylabel('position',Interpreter='latex')
legend()
grid minor

set(gcf, 'Position',  [100, 100, 600, 500])
movegui(fig1,"southwest")
saveas(fig1, 'fig1.png')

%% sps
fig2=figure(2)
t = tiledlayout(3,1);
nexttile
name='\psi';
h=plot(out_smc.psi_real.Time,out_smc.psi_real.Data ,'-xr','LineWidth',1,'DisplayName',[name '_{real smc}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.psi_real.Time,out.psi_real.Data ,'-xk','LineWidth',1,'DisplayName',[name '_{real}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
plot(out_smc.time,out_smc.psid,'b','LineWidth',1,'DisplayName',[name '_{desired}'])
title([name '_{desired} vs  ' name '_{real}'])
legend()
xlabel('Time',Interpreter='latex')
ylabel('angle',Interpreter='latex')
grid minor

nexttile
name='\theta';
h=plot(out_smc.theta_real.Time,out_smc.theta_real.Data ,'-xr','LineWidth',1,'DisplayName',[name '_{real smc}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.theta_real.Time,out.theta_real.Data ,'-xk','LineWidth',1,'DisplayName',[name '_{real}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
plot(out_smc.theta_d,'b','LineWidth',1,'DisplayName',[name '_{desired}'])
title([name '_{desired} vs  ' name '_{real}'])
legend()
xlabel('Time',Interpreter='latex')
ylabel('angle',Interpreter='latex')
grid minor

nexttile
name='\phi';
h=plot(out_smc.phi_real.Time,out_smc.phi_real.Data ,'-xr','LineWidth',1,'DisplayName',[name '_{real smc}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.phi_real.Time,out.phi_real.Data ,'-xk','LineWidth',1,'DisplayName',[name '_{real}']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
plot(out_smc.phid,'b','LineWidth',1,'DisplayName',[name '_{desired}'])
title([name '_{desired} vs  ' name '_{real}'])
legend()
xlabel('Time',Interpreter='latex')
ylabel('angle',Interpreter='latex')
grid minor

set(gcf, 'Position',  [100, 100, 600, 500])
movegui(fig2,"northeast")
saveas(fig2, 'fig2.png')

%% u1 u2 u3 u4
fig3=figure(3)
t = tiledlayout(4,1);

nexttile
name='u1';
h=plot(out_smc.u1 ,'-xr','LineWidth',1,'DisplayName',[name 'smc']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.u1 ,'-xk','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name,Interpreter="latex")
xlabel('Time',Interpreter='latex')
ylabel(name,Interpreter='latex')
grid minor

nexttile
name='u2';
h=plot(out_smc.u2 ,'-xr','LineWidth',1,'DisplayName',[name 'smc']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.u2 ,'-xk','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name,Interpreter="latex")
xlabel('Time',Interpreter='latex')
ylabel(name,Interpreter='latex')
grid minor

nexttile
name='u3';
h=plot(out_smc.u3 ,'-xr','LineWidth',1,'DisplayName',[name 'smc']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.u3 ,'-xk','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name,Interpreter="latex")
xlabel('Time',Interpreter='latex')
ylabel(name,Interpreter='latex')
grid minor

nexttile
name='u4';
h=plot(out_smc.u4 ,'-xr','LineWidth',1,'DisplayName',[name 'smc']);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
hold on
h=plot(out.u4 ,'-xk','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name,Interpreter="latex")
xlabel('Time',Interpreter='latex')
ylabel(name,Interpreter='latex')
grid minor

set(gcf, 'Position',  [100, 100, 600, 500])
movegui(fig3,"northwest")
saveas(fig3, 'fig3.png')

%% wi only for adaptive smc
fig4=figure(4)
t = tiledlayout(4,1);
nexttile
name=[char(949) '_z'];
h=plot(out.epsilon_z ,'-xb','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name)
xlabel('Time',Interpreter='latex')
ylabel(name)
grid minor

nexttile
name=['w' '_z'];
h=plot(out.w_z ,'-xb','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name)
xlabel('Time',Interpreter='latex')
ylabel(name)
grid minor

nexttile
name=[char(949) '_\psi'];
h=plot(out.epsilon_psi ,'-xb','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name)
xlabel('Time',Interpreter='latex')
ylabel(name)
grid minor

nexttile
name=['w' '_\psi'];
h=plot(out.w_psi ,'-xb','LineWidth',1,'DisplayName',[name]);
h.MarkerIndices = 5:200:length(out_smc.x_real.Time );
legend()
title(name)
xlabel('Time',Interpreter='latex')
ylabel(name)
grid minor
title(t,'Wiegths only for Neural network-based adaptive sliding mode control',Interpreter='latex')
set(gcf, 'Position',  [100, 100, 600, 500])
movegui(fig4,"southeast")
saveas(fig4, 'fig4.png')

%%  3dplot
fig5=figure(5)
out_smc = sim('main_smc')
plot3(out.x_real.Data,out.y_real.Data,out.z_real.Data,'LineWidth',1,'Color',[0 0 0],'DisplayName','real')
hold on
plot3(out.xd,out.yd,out.zd,'LineWidth',1,'Color',[1 0 0],'DisplayName','desired')
hold on
plot3(out_smc.x_real.Data,out_smc.y_real.Data,out_smc.z_real.Data,'LineWidth',1,'Color',[0 0.5 0.5],'DisplayName','smc')
xlabel('X position',Interpreter='latex')
ylabel('Y position',Interpreter='latex')
zlabel('Z position',Interpreter='latex')
set(gcf, 'Position',  [100, 100, 600, 500])
legend(Interpreter="latex")
grid minor
set(gcf, 'Position',  [100, 100, 800, 500])
movegui(fig5,"center")
saveas(fig5, 'fig5.png')



