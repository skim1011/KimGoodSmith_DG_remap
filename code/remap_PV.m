%% Remap Index of Population Vector
% same(class=0)/different(class=1) shape environment
% shuffle only B
% population vector with only active session (SK method)
sum0 = sum;
clearvars sum;

%% Parameters
repeating = 1000;
class = 1; %same,0; different,1

%% 

pair = [1,3;1,2;2,3];
remap_all_sh = cell(1,2);
remap_d = NaN(repeating,2);


%% Remap index using Population vector
%extract units satisfying requirments

%% Remap Index for Population Vector in the same shape environment
if class == 0
figure()

order = cell(1,2);
order{1} = order_mc;
order{2} = order_gc;

for type = 0 %mc=0/gc=1
    tic    
    unit_id = order{type+1};
    %unit_id(26)=[];
    pop_vec = NaN(48,64,length(unit_id),6);%A,A',A,B,B,A'
    n = 1;
    dif_total = [];
    ex_unit  =0;
    for uniti = 1:length(unit_id)
        unitn = unit_id(uniti);
        repeatno  = maze_short(unitn,5);
        firsten = find(maze_short(unitn,1:4)==repeatno);
        sameen = find(maze_short(unitn,1:4)==(3-repeatno));
        if isempty(firsten) || isempty(sameen)
           fprintf('type = %d, unitn = %d\n',type, unitn) %removed from analysis
           ex_unit = ex_unit+1;
           continue
        end
        envec = [firsten,sameen,5];
        for eni = 1:3
            tentative{eni} = vel_filt_rmap{unitn,envec(eni)};
        end 

        for eni = 1:3
            if active_session(unitn,envec(pair(eni,1)))==1 || active_session(unitn,envec(pair(eni,2)))==1          
                pop_vec(:,:,n,(eni-1)*2+1) = tentative{pair(eni,1)};
                pop_vec(:,:,n,eni*2) = tentative{pair(eni,2)};
            else
                pop_vec(:,:,n,(eni-1)*2+1) = NaN(48,64);
                pop_vec(:,:,n,eni*2) = NaN(48,64);
            end
        end
        n = n+1;
    end
    pop_vec(:,:,end-ex_unit+1:end,:)=[];


    [remap_all_sh,remap_data] = remap_bootstrap_PV_SK(pop_vec,repeating,57); %bootstrap
end
end

%% Remap Index for Population Vector in the different shape environment
% random pick up
% population vector with only active session (SK method)
if class == 1

figure()
order = cell(1,2);
%{
order_gc_removed_diff = order_gc_diff;
order_gc_removed_diff(order_gc_removed_diff==186)=[];
order_gc_removed_diff(order_gc_removed_diff==195)=[];
order_gc_removed_diff(order_gc_removed_diff==311)=[];
%}

order{1} = order_mc_diff;
order{2} = order_gc_diff; %or removed_diff;

pair = [1,3;1,2;2,3]; %AA', AB, BA'

for type = 0 %mc=0/gc=1
    tic    
    unit_id = order{type+1};
    unit_id(26)=[];
    pop_vec = NaN(48,64,length(unit_id),6);%A,A',A,B,B,A'
    n = 1;
    dif_total = [];
    ex_unit = 0;
   
    for uniti = 1:length(unit_id)
        unitn = unit_id(uniti);
        repeatno  = maze_short(unitn,5);
        firsten = find(maze_short(unitn,1:4)==repeatno);
        sameen = find(maze_short(unitn,1:4)==(3-repeatno));
        if isempty(firsten)
            fprintf('type = %d, unitn = %d\n',type, unitn) %removed from analysis
            ex_unit = ex_unit+1;
            continue
        end
        difen = [1,2,3,4];% difen can be from 1 to 4;
        if ~isempty(sameen)
            difen(difen-sameen==0)=[]; %exclude same shape
        end
        %difen = difen(difen>firsten); % if the order should be A→B→A'

        difen(difen-firsten==0)=[];
        if isempty(difen)
            fprintf('type = %d, unitn = %dn',type, unitn) %removed from analysis
            ex_unit = ex_unit+1;
            continue
        end
        dif_total = [dif_total,length(difen)];

        %pick up one dif environment randomly     
        %choseni = randi(length(difen),1);
        %difen = difen(choseni);
        %difsession_vec = [difsession_vec,difen];

        
        %difen = difsession2{type+1}(n); %use the previous chosen session
        difen = difsesmat{1,type+1}(1,uniti);
        envec = [firsten,difen,5];
        for eni = 1:3
            tentative{eni} = vel_filt_rmap{unitn,envec(eni)};
        end 

        %make population vector for each pair
        for eni = 1:3
            if active_session(unitn,envec(pair(eni,1)))==1 || active_session(unitn,envec(pair(eni,2)))==1          
                pop_vec(:,:,n,(eni-1)*2+1) = tentative{pair(eni,1)};
                pop_vec(:,:,n,eni*2) = tentative{pair(eni,2)};
            else
                pop_vec(:,:,n,(eni-1)*2+1) = NaN(48,64);
                pop_vec(:,:,n,eni*2) = NaN(48,64);
            end
        end
        n = n+1;
    end
    %difsession3{type+1} = difsession_vec;
    pop_vec(:,:,end-ex_unit+1:end,:)=[];

    [remap_all_sh,remap_data] = remap_bootstrap_PV_SK(pop_vec,repeating,86);
end
end
