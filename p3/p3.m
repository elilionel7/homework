tic
nI=10000; ndim=3:20; 
r=1;
KK = {1,length(ndim)};
nn = 1;
xmat=zeros(1,nI);
psi_nD=zeros(1,length(ndim));%ration of 
for l=1:length(ndim)
    for i=1:ndim(l)
    xmat(i,:) = -1+2*rand(1,nI);
    end
    d=0;
    Rnd_nD=zeros(ndim(l),ndim(l));
    for k=1:nI
    sigma=0;
        for j=1:ndim(l)
            sigma=sigma+ xmat(j,k)^2;
        end
        if sqrt(sigma)<=r
            d=d+1;
            Rnd_nD(:,d)=xmat(:,k);
            
        end 
        
    end
   psi_nD(l)=length(Rnd_nD)/nI;
   KK{nn} = {Rnd_nD};
   nn = nn+1;
end
figure(2)
plot(ndim,psi_nD,'b.')
toc
 