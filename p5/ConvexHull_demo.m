clear all
close all
clc

% Single data shape demo :
   x = random('Normal',0,1,1,150);
   y = random('Normal',0,1,1,150);
   InputData = [x' y'];
   [V,I] = ConvexHull(InputData);
   figure(1)
   plot(InputData(:,1),InputData(:,2),'.'); hold on
   plot(V(:,1), V(:,2),'Marker','o','LineStyle','--')
   xlabel('x-data');
   ylabel('y-data');
   legend('InputData' , 'Convex hull');
   
   
% Two data shapes demo :

   % First shape
   x = random('Normal',0,1,1,150); % x-data shape 1
   y = random('Normal',0,1,1,150); % y-data shape 1
   InputData = [x' y'];
   [V,I] = ConvexHull(InputData);
   figure(2)
   plot(InputData(:,1),InputData(:,2),'.'); hold on
   plot(V(:,1), V(:,2),'Marker','o','LineStyle','--');
  
   
   % Second shape
   x = 3+random('Normal',0,1,1,150); % x-data shape 2
   y = 4+random('Normal',0,1,1,150); % x-data shape 2
   InputData = [x' y'];
   [V,I] = ConvexHull(InputData);
   figure(2)
   plot(InputData(:,1),InputData(:,2),'.'); hold on
   plot(V(:,1), V(:,2),'Marker','o','LineStyle','--');
   xlabel('x-data');
   ylabel('y-data');
   legend('InputData 1' , 'Convex hull 1', 'InputData 2' , 'Convex hull 2');
   
