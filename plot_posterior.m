figure(3);
clf
temp = log(post_pdf+eps);
contour(common_axis, common_axis,temp, 'linewidth', 2)
hold on


new_SD_j = new_xj_SD;
new_SD_i = new_xi_SD;
 
new_j = new_xj_mean;
new_i = new_xi_mean;
 
patch_X = [new_j-1.96*new_SD_j, new_j-1.96*new_SD_j, new_j+1.96*new_SD_j, new_j+1.96*new_SD_j];
patch_Y = [-100, 100, 100, -100];
patch(patch_X, patch_Y,  'r', 'facealpha', .3,'edgecolor', 'none')
 
patch_Y = [new_i+1.96*new_SD_i, new_i+1.96*new_SD_i, new_i-1.96*new_SD_i, new_i-1.96*new_SD_i];
patch_X = [-100, 100, 100, -100];
patch(patch_X, patch_Y,  'r', 'facealpha', .3,'edgecolor', 'none')
% 

SD_j = neuron(current_tar_ind).SD;
SD_i = neuron(best_RL_ind).SD;

j = neuron(current_tar_ind).mean;
i = neuron(best_RL_ind).mean;
        

p1 = min(common_axis);
p2 = max(common_axis);
plot([j j], [p1 p2], 'b','linewidth' , 2)
plot([p1,p2],[i i], 'b', 'linewidth' , 2)
plot([new_j new_j], [p1 p2], '--r', 'linewidth' , 2)
plot([p1,p2],[new_i new_i], '--r','linewidth' , 2)

patch_X = [j-1.96*SD_j, j-1.96*SD_j, j+1.96*SD_j, j+1.96*SD_j];
patch_Y = [-100, 100, 100, -100];
patch(patch_X, patch_Y,  'b', 'facealpha', .3,'edgecolor', 'none')
 
patch_Y = [i+1.96*SD_i, i+1.96*SD_i, i-1.96*SD_i, i-1.96*SD_i];
patch_X = [-100, 100, 100, -100];
patch(patch_X, patch_Y,  'b', 'facealpha', .3,'edgecolor', 'none')

axis equal

xlabel('xj');ylabel('xi')
xlim([-60, 60])
ylim([-60, 60])
% print('-depsc','-r300',['posterior', num2str(sd_e), '_SDm' , num2str(sd_m), '.eps' ]);