function minn=Left_index(pt)

 xx=pt(:,1); yy=pt(:,1);
    minn = 1;
    for i=2:length(pt)
        if xx(i) < xx(minn)
            minn = i;
        elseif xx(i) == xx(minn)
        end
        if yy(i) > yy(minn)
            minn = i;
        end
    end
end

