
num_trial = 100; % number of matrix to search for each dimension
d_max = 20; % maximal dimensnion

ratio = zeros(4,d_max);

for d = 1:d_max
    ratio_temp = zeros(4,num_trial);
    for trial = 1:num_trial

        A_good = gen_psd(d,2); % Using the 'good' PSD
        A_bad = gen_psd_bad(d,2); % Using the 'bad' PSD

        % B_good = gen_psd(d,3);
        % B_bad = gen_psd_bad(d,3);

        ratio_temp(1,trial) = g_plus_eig(A_good,d,2)/nuclear(A_good);
        ratio_temp(2,trial) = g_plus_eig(A_bad,d,2)/nuclear(A_bad);
        
        ratio_temp(3,trial) = g_plus_ldl(A_good,d,2)/nuclear(A_good);
        ratio_temp(4,trial) = g_plus_ldl(A_bad,d,2)/nuclear(A_bad);


        % if ratio_temp(1,trial) > 1.25
        %     A
        % end
        % 
        % if ratio_temp(2,trial) > 1.5
        %     B
        % end
    end
    
    ratio(1,d) = max(ratio_temp(1,:));
    ratio(2,d) = max(ratio_temp(2,:));
    ratio(3,d) = max(ratio_temp(3,:));
    ratio(4,d) = max(ratio_temp(4,:));

    fprintf(append("completed computation in dimension: ", string(d), "\n"))
end





%% Plotting the Ratio


%plotting the ratio
coord = 1:d_max;


figure
% plot(coord, ratio(1,:), coord, ratio(2,:),'Linewidth',2.0)
% plot(coord, ratio(1,:), coord, ratio(2,:), coord, 1.27 + zeros(1,d_max), coord, 1.5 + zeros(1,d_max),'Linewidth',1.5)
plot(coord, ratio(1,:), coord, ratio(2,:), coord, 1.27 + zeros(1,d_max), ...
    coord, ratio(3,:), coord, ratio(4,:), 'Linewidth',1.5)
ylabel("gamma_+/gamma")
xlabel("dimension")
xlim([0 d_max])
ylim([1 1.8])
title('Upper bound of gamma_+/gamma (LDL-perturb)')
% legend({'rank 2', 'rank 3'})
% legend({'rank 2', 'rank 3', '1.27', '1.5'})
legend({'general rk2 eig', 'A_{ij} = \pm a^2 \pm b^2 eig', ...
    '1.27', 'general rk2 ldl', 'rk2 specialrk2 special ldl'})
