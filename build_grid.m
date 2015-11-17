function [new_xi_mean, new_xi_SD, new_xj_mean, new_xj_SD pdf] = build_grid(Dij, xi, xj, common_axis, sd_e, sd_m)

[Xi, Xj] = ndgrid(common_axis, common_axis);
pXi = normpdf(Xi, xi.mean, xi.SD);
pXj = normpdf(Xj, xj.mean, xj.SD);
Y = Xi-Xj;
F = normpdf(Y, xi.mean-xj.mean-Dij, sqrt(Y.^2 * sd_m^2 + xi.SD^2+xj.SD^2+sd_e^2));  %TODO check with Bosco if this is correct

pdf = pXi.*pXj.*F;
pdf = pdf/sum(pdf(:));


new_pXi = sum(pdf,2);  % plot to check if these are gaussian -- they should!
new_pXj = sum(pdf,1);


% assuming the above are gaussian
new_xi_mean = common_axis * new_pXi(:);
new_xi_SD = sqrt( (common_axis-new_xi_mean).^2 * new_pXi(:) );

%the new mean has to be inside the range
if new_xi_mean<min(common_axis)
    new_xi_mean = min(common_axis);
elseif new_xi_mean>max(common_axis)
    new_xi_mean = max(common_axis);
end



%ugly hack
if new_xi_SD == 0
   % new_xi_SD = 1e-20;%avoid NAN values. Also Matlab caanot plot SD below .001
    error('something is wrong, the new SD is 0');
end

new_xj_mean = common_axis * new_pXj(:);
new_xj_SD = sqrt( (common_axis-new_xj_mean).^2 * new_pXj(:) );


