X = meanrate;
corr_diff_AA = NaN(423,1);% remap_index for different shape environments
corr_diff_AB = NaN(423,5);% remap_index for different shape environments
corr_diff_BA = NaN(423,5);% remap_index for different shape environments
corr_ov = NaN(423,10); % remap_index for same shape environments

for current_cell = 1:423
   
    if  ~isempty(meanrate(current_cell,5))
       
       if  maze_short(current_cell,5)==1
        No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
        No_2 = find(maze_short(current_cell,:)==2);
        c = X(current_cell,No(1));
        d = X(current_cell,  5);
        e = X(current_cell, No_2);
        
        try
           corr_ov(current_cell,5)= min(c,d)./max(c,d);
         catch
            continue
        end
        
        try
          corr_ov(current_cell,6)= min(d,e)./max(d,e);
            catch
            continue
        end
        
        try
            corr_ov(current_cell,7)= min(c,e)./max(c,e);
             catch
            continue
        end
        
          try
            corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);       
        catch
            continue
        end 
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,  i);
              c = X(current_cell,No(1));
         
              try
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);               
              catch
                  continue
              end
              
              try
                corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);
               catch
                  continue
              end
              clear a b C;
           end
           corr_diff_AB(current_cell, No(1))=NaN;
           corr_diff_BA(current_cell, No(1))=NaN;
           corr_diff_AB(current_cell, No_2)=NaN;
           corr_diff_BA(current_cell, No_2)=NaN;
           clear No NO_2;   
           clear  B C D c d e;
           clear No No_2;
           
       elseif maze_short(current_cell,5)==2
          No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
          No_2 = find(maze_short(current_cell,:)==1);
        c = X(current_cell,No(1));
        d = X(current_cell,  5);
        e = X(current_cell,  No_2);
        try
             corr_ov(current_cell,5)= min(c,d)./max(c,d);
        catch
            continue
        end
        
        try
             corr_ov(current_cell,6)= min(d,e)./max(d,e);
              catch
            continue
        end
        
          try
            corr_ov(current_cell,7)= min(c,e)./max(c,e);
              catch
            continue
          end
        
          try
             corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);
          catch
            continue
        end 
          
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,  i);
              c = X(current_cell,No(1));
         
              try
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);
              catch
                  continue
              end
              try
               corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);
              catch
                  continue
              end              
              clear a b C;
             
           end
           corr_diff_AB(current_cell, No(1))=NaN;
           corr_diff_BA(current_cell, No(1))=NaN;
           corr_diff_AB(current_cell, No_2)=NaN;
           corr_diff_BA(current_cell, No_2)=NaN;
           clear No NO_2;
           clear  B C D c d e;
           clear No No_2;
           
       else
        No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
        c = X(current_cell,No(1));
        d = X(current_cell,  5);
          try
             corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);
        catch
            continue
          end
        
        clear  d B
        for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,  i);
              c = X(current_cell,No(1));              
              try
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);
           
              catch
                  continue
              end
                            
              try
               corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);
               catch
                  continue
              end
              clear a b C;
           end
           corr_diff_AB(current_cell, No(1))=NaN;
           corr_diff_BA(current_cell, No(1))=NaN;
           clear No;           
       end
       
    end
end


%% remap_index for same_shape
corr_buz = corr_ov(:,5:7); 
 for current_cell = 1:423
       No_1 = find(maze_short(current_cell,:)==1); 
       No_2 = find(maze_short(current_cell,:)==2);
   
   if active_session(current_cell,No_1(1))== 0 & active_session(current_cell,No_2)== 0 & active_session(current_cell,5)==0
    corr_buz(current_cell,:)=NaN;
   end
   clear No_1 No_2
 end
 
    
%% remap_index for different shape
   clear X;
   sum = NaN(423,1);
   remap_diff = NaN(423,4);
   remap_diff_ab_ba = NaN(423,4);

   for  i = 1:423
      for j = 1:4
       try
       X(1) = corr_diff_AB(i,j);
       X(2) = corr_diff_BA(i,j);
   
       remap_diff(i,j) = corr_diff_AA(i,1) - nanmean(X);
       remap_diff_ab_ba(i,j)= nanmean(X);
        catch
          continue
       end
       clear X;
   end
   end
   
remap_diff_buz = remap_diff; 
remap_diff_ab_ba_buz = remap_diff_ab_ba;
corr_diff_AA_buz = corr_diff_AA;

 for current_cell = 1:423
     for j = 1:4
       
       No = find(maze_short(current_cell,:)== maze_short(current_cell,5));  
       No_1 = find(maze_short(current_cell,:)==1); 
       No_2 = find(maze_short(current_cell,:)==2);
      
   if active_session(current_cell,No(1))== 0 & active_session(current_cell,j)== 0 & active_session(current_cell,5)==0
    remap_diff_buz(current_cell,j)=NaN;
    remap_diff_ab_ba_buz(current_cell,j)=NaN;
    
   end
   clear No_1 No_2 No;
 end
 end
 