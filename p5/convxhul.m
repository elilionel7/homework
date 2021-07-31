
%
%% Begin of function
%V = [InputData(1:3,:)]; I = [1:3]'; % Take first three points as initialization
clear
x=[ 160.1671 366.9226 430.7894 540.1208 660.2771 508.7287 252.1787]';
y=[ 223.9615 259.5000 120.5769 245.5000 283.1923 472.7308 469.5000]';
plot(x,y,'b.')
    InputData=[x,y];
    V = InputData(1:3,:); 
    I = 1:3; I=I'; % Take first three points as initialization
    for k=4:length(InputData)
    % Initialization
    pk = InputData(k,:); 
    sup_ver = [];
    ind = []; index = [];
    % End of initialization

    % Localization step
        for i=1:length(V)                       
            vi = V(i,:);O = [];
            for j=1:length(V)
                if i~=j
                    vj = V(j,:);
                    O(j) = det([1 pk;1 vi; 1 vj]);  % Calculate the orientation matrix
                end
            end
            O(O==0) = [];
            if (numel(unique(sign(O)))==1)==1    % if there is a supporting vertex
                sup_ver = [sup_ver;vi];          % accumulate supporting vertices
            end
        end
    % End of localization step

    % Restructure step
        if isempty(sup_ver)==0            % if the point is outside of the hull shape
            P1 = sup_ver(1,:); 
            P2 = sup_ver(2,:); 
            P3 = pk;
            s  = det([P1-P2;P3-P1]);
            n  = 1;

            % Resolving of the PIT problem 
            while n<=length(V)            
                P = V(n,:);
                if P~=P1 & P~=P2 & P~=pk & (s*det([P3-P;P2-P3])>=0 &  ...      % if the query point P inside the triangle (vi,pk,vj)
                        s*det([P1-P;P3-P1])>=0 & s*det([P2-P;P1-P2])>=0)==1
                    V(n,:) = []; 
                    I(n) = [];
                    n = n-1;
                end
                n = n+1;
            end
            % End of resolving the ¨PIT problem

            ind(1) = find(V==P1(:,1));            % Find the position of the 1st supprting vertex
            ind(2) = find(V==P2(:,1));            % Find the position of the 2nd supprting vertex
            index  = find(InputData==pk(:,1));    % Finde the position of the new vertex

            % Updating V and I
            if ind(2)-ind(1)==1
                V = [V(1:ind(1),:);pk;V(ind(1)+1:end,:)];   % Insert the new vertex into V
                I = [I(1:ind(1)); index ;I(ind(1)+1:end)];  % Update indexes I
            else
                V = [pk;V];                                 % Insert the new vertex into V
                I = [index ; I];                            % Update indexes I
            end
            % End of updating V and I
        end
    % End of the Restructure step
    end
  %  time(nt) = cputime-start;
%  end
% V = vertcat(V,V(1,:));
% I = vertcat(I,I(1));
 plot(InputData(:,1),InputData(:,2),'.')
   hold on
   plot(V(:,1), V(:,2), 'r-','LineWidth',2)
   xlabel('x-data');
   ylabel('y-data');

