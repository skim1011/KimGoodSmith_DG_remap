X = vel_filt_rmap;
corr_ov = NaN(423,14); 
for current_cell = 1:423
          for i = 1:3
            for j = i+1:4
              if active_session(current_cell,i)==1 | active_session(current_cell,j)==1
              if maze_short(current_cell,i)==1 & maze_short(current_cell,j)== 2 
                  
              a = X{current_cell,i};
              b = X{current_cell,j};   
                             
              try
               A =  corrcoef(a,b,'rows', 'complete');
               corr_ov(current_cell,13) = A(1,2);
              catch
                  continue
              end
                            
              clear a b A;
              elseif maze_short(current_cell,i)==2 & maze_short(current_cell,j)== 1 
              
              a = X{current_cell,i};
              b = X{current_cell,j};   
                             
              try
               B =  corrcoef(a,b,'rows', 'complete');
               corr_ov(current_cell,14) = B(1,2);
              catch
                  continue
              end    
                                   
                clear a b B;   
                  
              else
               
              a = X{current_cell,i};
              b = X{current_cell,j};
              no = i*j;
              try
               C =  corrcoef(a,b,'rows', 'complete');
               corr_ov(current_cell,no) = C(1,2);
              catch
                  continue
              end
             clear a b no C;
              end     
              end
            end
            end
        end
       
 