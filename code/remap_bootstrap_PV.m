function [remap_all_sh_m,remap_data] = remap_downsample_PV(pop_vec,repeating,cellnum)

%% shuffle 
% only vector of B is shuffled
% B: different shuffled cell id order from AA'
% pop_vec; A,A',A,B,B,A'
% everytime of shuffling, randomly pick up 16 (same) or 19 (different) cell ids with overlapped from all of the cells

remap_all_sh_m = zeros(3,4);
type = 0;

txt = cell(4,1);
txt{1} = 'AA^\prime';
txt{2} = 'AB';
txt{3} = 'BA^\prime';
txt{4} = 'remap index';
col = ['r','b'];
o = [-0.05,0.05];

len = size(pop_vec,3);

%calculate corraltaion coefficient
%bootstrap
coef_shuffle = NaN(48,64,repeating,4);
for si = 1:repeating
    downi = randi(len,cellnum,1); %down-sample
    pop_new = pop_vec(:,:,downi,:);
    for rowi = 1:48
        for coli = 1:64
            t_vec = squeeze(pop_new(rowi,coli,:,:));
            t_vec = squeeze(t_vec);
            cshuffle = NaN(1,3);
            for j = 1:3
                c = corrcoef(squeeze(t_vec(:,(j-1)*2+1)),squeeze(t_vec(:,j*2)),'rows', 'complete'); %AA'/AB/BA'
                cshuffle(j) = c(1,2);
            end
            coef_shuffle(rowi,coli,si,1:3) = cshuffle;
            coef_shuffle(rowi,coli,si,4) = cshuffle(1)-mean(cshuffle(2:3),'omitnan');
        end 
    end
end

%average out
for j = 1:4 %AA', AB, BA', remap
    %include boundary
    remap_index_shuffle = mean(squeeze(coef_shuffle(:,:,:,j)),[1,2],'omitnan');
    remap_index_shuffle = squeeze(remap_index_shuffle);
    %all_remap_index = mean(coef_all,[1,2],'omitnan');

    %store data
    ave_remap_shuffle = mean(remap_index_shuffle,'omitnan');
    sd_remap_shuffle = std(remap_index_shuffle,'omitnan');
    sem_remap_shuffle = sd_remap_shuffle/sqrt(repeating);
    %remap_all_sh_m(1,j) = all_remap_index(j);
    remap_all_sh_m(1,j) = ave_remap_shuffle;
    remap_all_sh_m(2,j) = sd_remap_shuffle;
    remap_all_sh_m(3,j) = sem_remap_shuffle;
    %remap_all_sh_m(5,j) = nnz(remap_index_shuffle>all_remap_index(j))/repeating*100;
    %remap_all_sh{type+1} = remap_all_sh_m;

    %figure
    %scatter(j-0.1+o(type+1),all_remap_index(j),col(type+1),'LineWidth',2,'Marker','+');
    %hold on
    errorbar(j+0.1+o(type+1),ave_remap_shuffle,sd_remap_shuffle,col(type+1),'LineWidth',2,'Marker','o');
    hold on
    
    xlim([0,5])    
    xticks(1:4)
    xticklabels(txt)
    ylim([-0.5 1])
    title(txt(j))
    ax=gca;
    ax.YGrid = 'on';
end
remap_data = remap_index_shuffle;
end
