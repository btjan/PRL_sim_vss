%% plot expected acuity curve for the vicinity of each neuron
figure(1)
s1 = subplot(1,2,1);
cla(s1)
hold on
%%plot Expected Acuity
for i=1:nNeurons 
    x_vec = v + neuron(i).mean;
    plot(x_vec, exp_acuity(i,:), 'color', acu_CL(i,:))
    
end
    
rectangle('Position', [-scotomaRad, 0, 2*scotomaRad, 7], ...
    'Facecolor', [.7 .7 .7], 'Edgecolor', 'none')
plot(neuron(current_tar_ind).mean, 0.05,'+','MarkerSize',10 ,'color',[.3 .3 .3]);
plot(ecc_ind-(length(common_axis)+1)/2, res, '--k', 'linewidth', 1)

plot((1:nNeurons)-41, exp_acuity_for_neuron, '--b', 'linewidth',2) 
 

xlabel('Distance from the fovea');
ylabel('Acuity');
xlim([min(disp_axis) max(disp_axis)]); 
set(gca,'FontSize',12)
set(gca, 'xtick', -100:10:100);
ylim([0, 7]);




%% plot simulted trials
s2 = subplot(1,2,2);
cm = colormap('lines');
%     plot([RL;ST],1:t,  '--o', 'MarkerSize', 10,...
%         'LineWidth',2);
hold on
if mod(t,2) == 1 
    trial_clr = [.3 .3 .3];
else
    trial_clr = [.5 .5 .5];
end
% plot(neuron(current_tar_ind).mean, t, '+','MarkerSize',10, 'color', cm(mod(t, length(cm))+1,:))
% plot(neuron(best_RL_ind).mean, t, '.', 'MarkerSize', 30,'color', cm(mod(t, length(cm))+1,:));

plot(neuron(current_tar_ind).mean, t, '+','MarkerSize',10, 'color',[.3 .3 .3] )
plot(neuron(best_RL_ind).mean, t, 'o', 'MarkerSize', 8,'color', [.3 .3 .3]);
%plot(landing_loc(t), t, '+', 'MarkerSize', 10,'color', trial_clr-.3 );
plot(actual_retinal_loc(t), t, '.', 'MarkerSize', 20,'color','r');


xlim([min(disp_axis), max(disp_axis)]);
ylim([0, max_nTrials]);
%      plot(ecc_ind-50, res, '-.k')
%legend('Saccade target','Intended retinal location','Utilized retinal location')
xlabel('Distance from the fovea');ylabel('Trial#');

rectangle('Position', [-scotomaRad, 0, 2*scotomaRad, max_nTrials], ...
    'Facecolor', [.7 .7 .7], 'Edgecolor', 'none');%the scotoma
% title(['T=', num2str(T), ', sd_m=', num2str(sd_m), ', sd_e=', num2str(sd_e)])
%   figure('position', [100, 100, 400, 170]);
set(gca,'FontSize',12)
set(gca, 'xtick', -100:10:100 );
grid on
set(gca, 'ytick', 0:5:max_nTrials);
drawnow
% print('-depsc','-r300',['frames\trial_', num2str(t) '.eps' ]);
