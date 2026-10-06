function QN1F_plot_results_v10
drawnow;

required = {'speed_rpm','slip','torque_Nm','current_A','power_kW','load_torque_Nm'};
for k=1:numel(required)
    if evalin('base',sprintf('exist(''%s'',''var'')',required{k})) ~= 1
        warning('QN1F:v10:MissingData','Brak zmiennej %s w Base Workspace.',required{k});
        return;
    end
end

speed_rpm      = evalin('base','speed_rpm');
slip           = evalin('base','slip');
torque_Nm      = evalin('base','torque_Nm');
current_A      = evalin('base','current_A');
power_kW       = evalin('base','power_kW');
load_torque_Nm = evalin('base','load_torque_Nm');

n_rated = 18000;
isCutting = max(abs(load_torque_Nm.Data)) > 0.05;
if isCutting
    modeText = 'proces skrawania';
else
    modeText = 'bieg jalowy';
end

oldFig = findall(0,'Type','figure','Name','QN-1F v10 - wyniki symulacji');
if ~isempty(oldFig), close(oldFig); end

fig = figure('Name','QN-1F v10 - wyniki symulacji','NumberTitle','off');
tl = tiledlayout(fig,3,2,'TileSpacing','compact','Padding','compact');
title(tl,['Hiteco QN-1F - wyniki symulacji - ' modeText]);

nexttile;
plot(speed_rpm.Time,speed_rpm.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('n [obr/min]');
title('Predkosc obrotowa'); yline(n_rated,'--','18 000 obr/min');

nexttile;
plot(slip.Time,slip.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('s [-]');
title('Poslizg');

nexttile;
plot(torque_Nm.Time,torque_Nm.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('T_e [Nm]');
title('Moment elektromagnetyczny');

nexttile;
plot(current_A.Time,current_A.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('I [A]');
title('Szacowany prad');

nexttile;
plot(load_torque_Nm.Time,load_torque_Nm.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('T_L [Nm]');
title('Moment obciazenia');

nexttile;
plot(power_kW.Time,power_kW.Data,'LineWidth',1.2);
grid on; xlim([0 10]); xlabel('Czas [s]'); ylabel('P_m [kW]');
title('Moc mechaniczna');

drawnow;
end
