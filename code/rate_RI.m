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
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            corr_ov(current_cell,5)= min(c,d)./max(c,d);           
            end
        catch
            continue
        end
        
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
            corr_ov(current_cell,6)= min(d,e)./max(d,e);
             end
              catch
            continue
        end
         
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,No(1))==1           
            corr_ov(current_cell,7)= min(c,e)./max(c,e);            
             end
              catch
            continue
        end
        
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
            corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);
            end
        catch
            continue
        end 
        
        
        for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,  i);
              c = X(current_cell,No(1));
         
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);               
               end
              catch
                  continue
              end
                            
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1
                corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);
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
        c = X(current_cell,No(1));
        d = X(current_cell,  5);
        e = X(current_cell,  No_2);
                  
        try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
             corr_ov(current_cell,5)= min(c,d)./max(c,d);            
            end
        catch
            continue
        end
        
        try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
             corr_ov(current_cell,6)= min(d,e)./max(d,e);            
             end
              catch
            continue
        end
                  
          try
             if active_session(current_cell,No_2)==1 | active_session(current_cell,No(1))==1            
            corr_ov(current_cell,7)= min(c,e)./max(c,e);            
             end
              catch
            continue
          end
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
             corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);
            end
        catch
            continue
        end 
          
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,i);
              c = X(current_cell,No(1));
         
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);
               end
              catch
                  continue
              end
              
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1
               corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);             
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
        c = X(current_cell,No(1));
        d = X(current_cell,  5);        
          try
            if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
             corr_diff_AA(current_cell,1)= min(c,d)./max(c,d);            
            end
        catch
            continue
          end
           clear  d B;
                      
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,  i);
              c = X(current_cell,No(1));           
              
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
               corr_diff_BA(current_cell,1)= min(a,b)./max(a,b);
               end
              catch
                  continue
              end
              
              
              try
               if active_session(current_cell,i)==1 | active_session(current_cell,No(1))==1              
               corr_diff_AB(current_cell,i) = 1- (abs(c-b)./(c+b));
               corr_diff_AB(current_cell,1)= min(c,b)./max(c,b);
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


