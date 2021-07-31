function or=orientation(p, q, r)
        val = (q(2) - p(2)) * (r(1) - q(1)) - ...
        (q(1) - p(1)) * (r(2) - q(2));
        cc=0;
        if val == 0
            or=cc;
        elseif val > 0
            or=cc+1;

        else
            or=cc+2;
        end


end
%6016588980