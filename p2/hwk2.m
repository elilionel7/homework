%Problem 2

%defining parameters
n = 200; %n # random points.
L = 20;
%rmin = .7; r1=70; rmax = sqrt(2*L^2); %rmax is the maximum distance two adjcent vertices
xyz = rand(3,1)*L;
 
x = [xyz(1) zeros(1,n-1)];  y = [xyz(2) zeros(1,n-1)]; z = [xyz(2) zeros(1,n-1)];%initialize the random points
xx=x; yy=y;
%k = 1;

% %a:
% for i =2: n
%     xya = rand(2,1)*L;
%     xa = xya(1);
%     ya = xya(2);
%     xx(i) = xa;
%     yy(i) = ya;
% end
% figure(1)
% plot(xx,yy,'b.')
% 
% %b:
% tic
% while k < n
%     cen = rand(2,1)*L; %starting point(centers)
%     cx = cen(1);        % x component
%     cy = cen(2);        % y component
%     for j = 1:n
%         rm = rmax;
%         rmax = sqrt((x(j)-cx)^2+(y(j)-cy)^2);
%         rmax = min(rm,rmax);
%     end
%     if rmax > rmin
%         k = k+1;
%         x(k) = cx;
%         y(k) = cy;
%     end
%     rmax = rmin*r1;
% end
% toc
% figure(2)
% plot(x,y,'k.')

%c:
rmin = 2; 
rmax = L*sqrt(L);
k = 1;
while k < n
    cen = rand(3,1)*L;
    cx = cen(1);
    cy = cen(2);
    cz = cen(3);
    for j = 2:n
        rm = rmax;
        rmax = sqrt((x(j)-cx)^2+(y(j)-cy)^2+(z(j)-cz)^2);
        rmax = min(rm,rmax);
    end
    if rmax > rmin
        k = k+1;
        x(k) = cx;
        y(k) = cy;
        z(k) = cz;
    end
    rmax = rmin*L*sqrt(L);
end
 figure(3)
 plot3(x,y,z,'k.')
%x=sort(x);y=sort(y);z=sort(z);
%%% locate nearest neighbors
xa=x; ya=y; za=z;
rc = 3;
lenx = length(x);
ind = zeros(10,10);
adj=zeros(10,10); adj0=zeros(10,10);
nn = zeros(lenx,1); nn1=zeros(lenx,1);
for i = 1:lenx
    
    for j = 1:lenx
        rm= sqrt((x(i)-x(j))^2+(y(i)-y(j))^2+(z(i)-z(j))^2);
        if j ~= i && rm < rc
            nn(i) = nn(i)+1;
            ind(i, nn(i)) = j;
            adj(i,j)=1;
            figure(4)
            plot3([x(i) x(j)],[y(i) y(j)],[z(i) z(j)],'r-o')
            hold on
            %plot3([xa(i) xa(j)],[ya(i) ya(j)],[za(i) za(j)],'b-')

            
        else 
            adj(i,j)=0;
        end
        
    end
end
adj1=sparse(adj);

% Data =zeros( size(ind,1),size(ind,2)+2);
% Data(:,1) = 1:length(nn);
% Data(:,2) = nn;
% Data(:,3:end) = ind;
% colname = {};
% colname(1) = {'pnt ind'};
% colname(2) = {'#NN'};
% for j = 3:size(ind,2)+2
%     colname(j) = {'NN ind'};
% end
% f=figure('Name','Nearest Neighbors','NumberTitle','off','position',[100 100 800 500]);
% uit=uitable(f,'data',Data,'columnname',colname,'position',[30 3 700 470]);

%us
%2nd neighbor
ind1=zeros(10,10);
for i = 1:lenx
    for j = 1:lenx
        rm= sqrt((x(i)-x(j))^2+(y(i)-y(j))^2+(z(i)-z(j))^2);
        if j ~= i && rm > rc && rm < 2*rc
            nn1(i) = nn1(i)+1;
            ind1(i, nn1(i)) = j;
            adj0(i,j)=2;
            plot3([x(i) x(j)],[y(i) y(j)],[z(i) z(j)],'b-*')
            hold on
           
        else 
            adj0(i,j)=0;
        end
    end
end
% adj2=sparse(adj0);


%// Do the plot
% figure(4)
% cmap = jet; %// choose a colormap
% s = 1; %// dot size
% colormap(cmap); %// use it
% [ii, jj, Mnnz] = find(adj1); %// get nonzero values and its positions
% scatter(1,1,s,0) %// make sure the first color corresponds to 0 value.
% hold on
% scatter(ii,jj,s,Mnnz); %// do the actual plot of the nonzero values
% set(gca,'color',cmap(1,:)) %// set axis backgroud to first color
% colorbar %// show colorbar
% hold off
