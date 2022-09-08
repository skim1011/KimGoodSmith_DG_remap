X = vel_filt_rmap;
corr_diff_AA = NaN(423,1);% remap_index for different shape environments
corr_diff_AB = NaN(423,5);% remap_index for different shape environments
corr_diff_BA = NaN(423,5);% remap_index for different shape environments
corr_ov = NaN(423,10); % remap_index for same shape environments
for current_cell = 1:423
  
    if  ~isempty(vel_filt_rmap{current_cell,5})
        
       if  maze_short(current_cell,5)==1
        No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
        No_2 = find(maze_short(current_cell,:)==2);
        c = X{current_cell,No(1)};
        d = X{current_cell, 5};
        e = X{current_cell, No_2};
        
        try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            B =  corrcoef(c,d,'rows', 'complete');
            corr_ov(current_cell,5) = B(1,2);
            end
        catch
            continue
        end
        
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
            C =  corrcoef(d,e,'rows', 'complete');
            corr_ov(current_cell,6) = C(1,2);
             end
              catch
            continue
        end
         
        
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,No(1))==1
            D =  corrcoef(c,e,'rows', 'complete');
            corr_ov(current_cell,7) = D(1,2);
             end
              catch
            continue
        end
        
        
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            B =  corrcoef(c,d,'rows', 'complete');
            corr_diff_AA(current_cell,1) = B(1,2); % for only non-square repeat
            end
        catch
            continue
        end 
                
        for i=1:4
              a = X{current_cell,5};
              b = X{current_cell,i};
              c = X{current_cell,No(1)};
         
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               C =  corrcoef(a,b,'rows', 'complete');
               corr_diff_BA(current_cell,i) = C(1,2);
               end
              catch
                  continue
              end
              
              
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1
               C =  corrcoef(c,b,'rows', 'complete');
               corr_diff_AB(current_cell,i) = C(1,2);
               end
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
        c = X{current_cell,No(1)};
        d = X{current_cell, 5};
        e = X{current_cell, No_2};
        
        try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            B =  corrcoef(c,d,'rows', 'complete');
            corr_ov(current_cell,5) = B(1,2);
            end
        catch
            continue
        end
        
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
            C =  corrcoef(d,e,'rows', 'complete');
            corr_ov(current_cell,6) = C(1,2);
             end
              catch
            continue
        end
          
          try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,No(1))==1
            D =  corrcoef(c,e,'rows', 'complete');
            corr_ov(current_cell,7) = D(1,2);
             end
              catch
            continue
          end
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            B =  corrcoef(c,d,'rows', 'complete');
            corr_diff_AA(current_cell,1) = B(1,2); % for only non-square repeat
            end
        catch
            continue
        end 
          
           for i=1:4
              a = X{current_cell,5};
              b = X{current_cell,i};
              c = X{current_cell,No(1)};
         
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               C =  corrcoef(a,b,'rows', 'complete');
               corr_diff_BA(current_cell,i) = C(1,2);
               end
              catch
                  continue
              end
              
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1
               C =  corrcoef(c,b,'rows', 'complete');
               corr_diff_AB(current_cell,i) = C(1,2);
               end
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
        c = X{current_cell,No(1)};
        d = X{current_cell, 5};
        
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            B =  corrcoef(c,d,'rows', 'complete');
            corr_diff_AA(current_cell,1) = B(1,2); % for only non-square repeat
            end
        catch
            continue
          end
        
        clear  d B;
                      
           for i=1:4
              a = X{current_cell,5};
              b = X{current_cell,i};
              c = X{current_cell,No(1)};
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               C =  corrcoef(a,b,'rows', 'complete');
               corr_diff_BA(current_cell,i) = C(1,2);
               end
              catch
                  continue
              end
              
               try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1
               C =  corrcoef(c,b,'rows', 'complete');
               corr_diff_AB(current_cell,i) = C(1,2);
               end
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