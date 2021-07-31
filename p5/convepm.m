function convepm(x,y)
    pnts=[x,y]; pts=pnts;
    lef = Left_index(pnts);
  
    hull = [];
      
    n=length(x);
    p1 = lef;
    q1 = 0;
      while p1==lef

            hull=[hull p1];


            q1 = q1+(p1 + 1); % n

            for k=1:n


                if orientation(pts(p1,:), pts(k,:), pts(q1,:)) == 2
                    q1 = k;
                end


            p1 = q1;

            end
            if (p1 == lef)
                break
            end

      end
   
%     for each in hull
%         print(points[each].x, points[each].y)
  
end
                

