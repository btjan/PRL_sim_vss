for i=1:nNeurons
    moving_dist_toward_fovea(i) = neuron(i).mean - neuron(i).init_mean;
    if i>floor(nNeurons/2)
        moving_dist_toward_fovea(i) = -moving_dist_toward_fovea(i);
    end
    SD(i) = neuron(i).SD ;
end

x = [init_neuron_mean, fliplr(init_neuron_mean)];
y1 = moving_dist_toward_fovea + SD;
y2 = moving_dist_toward_fovea - SD;
y = [y1, fliplr(y2)];

figure(4)
% plot the patch for prior distributions
patch([init_neuron_mean(1) init_neuron_mean(1) init_neuron_mean(end) init_neuron_mean(end)],...
    [-neuron(1).init_SD, neuron(1).init_SD,...
    neuron(1).init_SD, -neuron(1).init_SD], 'b', 'facealpha', .3, 'edgecolor', 'none');
hold on
patch(x,y, 'r', 'edgecolor', 'none')

%plot the patch for updated distributions
patch([init_neuron_mean(sct_ind(1)) init_neuron_mean(sct_ind(1)),...
    init_neuron_mean(sct_ind(end)) init_neuron_mean(sct_ind(end))],...
    [-neuron(sct_ind(1)).init_SD, neuron(sct_ind(1)).init_SD,...
    neuron(sct_ind(1)).init_SD, -neuron(sct_ind(1)).init_SD], 'k',  'edgecolor', 'none');

errorbar(init_neuron_mean, moving_dist_toward_fovea, SD, '.')
ylim([-neuron(1).init_SD-1 neuron(1).init_SD+1])
xlim([init_neuron_mean(1) , init_neuron_mean(end)]);
ylabel('Change of x_i towards the fovea(mm)');
xlabel('Presumed location (x_i) on cortex(mm)')
print('-depsc','-r300',['Change_towards_fovea_', num2str(sd_e), '_SDm' , num2str(sd_m), '.eps' ]);