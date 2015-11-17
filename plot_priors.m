
figure(2)
%set(h,'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% set(0, 'DefaultAxesFontSize', 6);
subplot(2,1,2)
%clf%plot initial priors
for i=1:nNeurons
    h1 = plot(disp_axis, normpdf(disp_axis,neuron(i).init_mean, neuron(i).init_SD), 'b','linewidth', 1); hold on
end

%plot updated priors
for i=1:nNeurons
    h2 = plot(disp_axis, normpdf(disp_axis, neuron(i).mean, neuron(i).SD),'r','linewidth', 1);
    resulted_SD(i) = neuron(i).SD;
    resulted_mean(i) = neuron(i).mean;
end
legend('Initial', 'Updated')
hold off
%%find PRLS
% x = resulted_SD;
% outlier_idx = abs(x - median(x)) > 3*std(x);  % Find outlier idx
% PRL_locations = neuron(outlier_idx);

% if isempty(PRL_locations)
%     title('No PRL formed');
% else
%     title(['PRL location(s):  ', num2str(PRL_locations.mean)]);
% end
%for plotting,new_means should be monotically increasing, thus sorting
%set(gca, 'xTick', sort(resulted_mean), 'XTickLabel',round(sort(resulted_mean)*100)/100 );
%legend([h1 h2],{'initial prior', 'updated prior'});

set(gca,'FontSize',14)

%% plot #hits per retinal locus
subplot(2,1,1)
bar(init_neuron_mean, cnt);ylabel('Number of times each retinal location is used');
%set(gca, 'xTick', sort(resulted_mean), 'XTickLabel',round(sort(resulted_mean)*100)/100 );


set(gca,'FontSize',14)
xlabel('Distance from the fovea(mm)')
%print('-depsc','-r300',['priors_SDe', num2str(sd_e), '_SDm' , num2str(sd_m) '.eps']);
% saveas(h, ['priors_SDe', num2str(sd_e), '_SDm' , num2str(sd_m) ], '.fig');%
