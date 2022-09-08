X = meanrate;
rate_ov = NaN(423,6); 
for current_cell = 1:423
           
       if  maze_short(current_cell,5)==1
        No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
        No_2 = find(maze_short(current_cell,:)==2);
        c = X(current_cell,No(1));
        d = X(current_cell, 5);
        e = X(current_cell, No_2);
        
       if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
        rate_ov(current_cell,5)= min(c,d)./max(c,d);               
         end
         
       if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
    
         rate_ov(current_cell,6)= min(e,d)./max(e,d);        
          end
        clear c d e;
                      
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,i);
              
               if active_session(current_cell,5)==1 | active_session(current_cell,i)==1
          
              rate_ov(current_cell,i)= min(a,b)./max(a,b);
               end
             clear a b;
           end
           rate_ov(current_cell, No(1))=NaN;
           rate_ov(current_cell, No_2)=NaN;
           clear No No_2;
           
       elseif maze_short(current_cell,5)==2
          No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
          No_2 = find(maze_short(current_cell,:)==1);
        c = X(current_cell,No(1));
        d = X(current_cell, 5);
        e = X(current_cell, No_2);
        
        if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
         rate_ov(current_cell,5)= min(c,d)./max(c,d);
        end
        if active_session(current_cell,No_2)==1 | active_session(current_cell,5)==1
         rate_ov(current_cell,6)= min(e,d)./max(e,d);
        end
        clear c d;
                      
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,i);
              if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
              rate_ov(current_cell,i)= min(a,b)./max(a,b);
              end
             clear a b;
           end
           rate_ov(current_cell, No(1))=NaN;
           rate_ov(current_cell, No_2)=NaN;
           clear No No_2;
                     
       else
           
        No = find(maze_short(current_cell,:)== maze_short(current_cell,5));
        c = X(current_cell,No(1));
        d = X(current_cell, 5);
        
        if active_session(current_cell,No(1))==1 | active_session(current_cell,5)==1
         rate_ov(current_cell,5)= min(c,d)./max(c,d);
        end
        clear c d;
                      
           for i=1:4
              a = X(current_cell,5);
              b = X(current_cell,i);
               if active_session(current_cell,i)==1 | active_session(current_cell,5)==1
                rate_ov(current_cell,i)= min(a,b)./max(a,b);
               end
             clear a b;
           end
           rate_ov(current_cell, No(1))=NaN;
           clear No;
                     
       end
   end

