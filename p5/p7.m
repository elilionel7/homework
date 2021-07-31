 

clear variables;
nn = 550:1000:10000;
time = zeros(length(nn),1);
for nt = 1:length(nn)
    start = cputime;
    n = nn(nt);
    L = n/2;
    rmin = 2.0;
    r = rmin*100;
    ran0 = rand(2,1)*L;
    x(1) = ran0(1);
    y(1) = ran0(2);
    k = 1;
    
    %%% Creating Points
    while k < n
        ran = rand(2,1)*L;
        xr = ran(1);
        yr = ran(2);
        for j = length(x):-1:1
            oldr = r;
            r = sqrt((xr-x(j))^2+(yr-y(j))^2);
            r = min(oldr,r);
        end
        if r > rmin
            k = k+1;
            x(k) = xr;
            y(k) = yr;
        end
        r = rmin*100;
    end
     
    
    %%% Creating Convex Hull
    [~, ind] = min(x);
    xleft = x(ind);
    yleft = y(ind);
    i = ind;
    Hullx = xleft;
    Hully = yleft;
        j = 1;
    while j <= n
        %     bool = false;
        count = 1;
        if j ~= i
            for k = 1:n
                % using definition of slope
                cc = (x(k)-x(j))*(y(j)-y(i))-(x(j)-x(i))*(y(k)-y(j));
                if cc >= 0
                    count = count +1;
                end
            end
        end
        %     if bool ~= true
        if count > n
            if j == ind
                break
            end
            Hullx = [Hullx; x(j)];
            Hully = [Hully; y(j)];
            i = j;
            j = 0;
        end
        j = j + 1;
    end
    l = length(Hullx);
    Hullx(l+1) = Hullx(1);
    Hully(l+1) = Hully(1);
    
    
    time(nt) = cputime-start;
end

 figure(1)
 plot(x,y,'k.',Hullx,Hully,'r-','LineWidth',2)

figure(2)
plot(nn,time,'LineWidth',1)
