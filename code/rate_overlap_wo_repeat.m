X = meanrate;
rate_ov = NaN(423,14); 
for current_cell = 1:423
   
        for i = 1:3
            for j = i+1:4
              
            if active_session(current_cell,i)==1 | active_session(current_cell,j)==1
            if maze_short(current_cell,i)==1 & maze_short(current_cell,j)== 2 
              a = X(current_cell,i);
              b = X(current_cell,j);   
             
              try
               rate_ov(current_cell,13)= min(a,b)./max(a,b);   
              catch
                  continue
              end
        
              clear a b ;
              elseif maze_short(current_cell,i)==2 & maze_short(current_cell,j)== 1 
              a = X(current_cell,i);
              b = X(current_cell,j);   
              try
               rate_ov(current_cell,14)= min(a,b)./max(a,b);  
              catch
                  continue
              end    
               clear a b ;   
                 
              else
               
              a = X(current_cell,i);
              b = X(current_cell,j);
              no = i*j;
              try
              rate_ov(current_cell,no)= min(a,b)./max(a,b);  
              catch
                  continue
              end
             clear a b no;
           end
            end              
            end
            end
        end
        

