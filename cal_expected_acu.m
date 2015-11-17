function noisy_exp_acuity= cal_expected_acu(neurons, target_loc, res, ecc_range, sd_m, v)

nSamples = 1e2;
nNeurons = length(neurons);
for i=1:nNeurons   
    for vInd = 1:length(v)
        Xi = normrnd(neurons(i).mean + v(vInd), neurons(i).SD, 1, nSamples);
        %calculate the expected acuity, wihtout motor noise
%         temp = interp1(ecc_range, res, Xi); 
%         exp_acuity(i, vInd) = mean(temp);
%         
        %calculate the expected acuity, wiht motor noise
        motor_vec  = Xi - target_loc;
        l_sqr = motor_vec.^2;% square of saccade amplitude 
        noisy_saccade_loc = normrnd(Xi, l_sqr * sd_m^2 );
        
        %make sure the samples are inside the range
        noisy_saccade_loc(noisy_saccade_loc > max(ecc_range)) = max(ecc_range);
        noisy_saccade_loc(noisy_saccade_loc < min(ecc_range)) = min(ecc_range);
        
        temp2 = interp1(ecc_range, res, noisy_saccade_loc); %calculate the acuity
     
        noisy_exp_acuity(i, vInd) = mean(temp2);
      
    end

    
end
% 
% %plot expected accuity (non-noisy version) for each neuron
% cnt = 1;
% figure('position', [100, 100, 1300, 750]);
% for i=1:5:nRetinalTargets
%     subplot(4,5,cnt)
%     plot(v, exp_acuity(i,:))
%     title(['Neuron ', num2str(i)])
%     cnt = cnt + 1;
%     xlabel('Displacement from the center');
%     ylabel('Expected acuity')
% end


% %plot expected accuity (motor-noise version) for each neuron
% cnt = 1;
% figure('position', [100, 100, 1300, 750]);
% %plot expected accuity for neuron i
% for i=1:5:nRetinalTargets
%     subplot(4,5,cnt)
%     plot(v, noisy_exp_acuity(i,:))
%     title(['Neuron ', num2str(i)])
%     cnt = cnt + 1;
%     xlabel('Displacement from the center');
%     ylabel('Expected acuity')
% end
% 
% 
% 
% figure
% bar(noisy_exp_acuity_for_neuron);
% xlabel('Neuron #')
% ylabel('Expected accuity')



