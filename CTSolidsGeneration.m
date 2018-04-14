%% % 201304 GAEB Gabriel Andres Espinosa Barrios ID:1102798647 Sincelejo,
% Sucre, Colombia. University of los Andes Code:200311728
% Computing Tools Project  - Bone Fingers Stress Strain IGA-NURBS-BSplines Applications 
% Computing Tools(Herramientas Computacionales) - Uniandes. 

% Student:
% GAEB(Gabriel Andrés Espinosa Barrios)
%  PhD Graduate Student. Cod:200311728 Id:110279864X. 
% University of the Andes(Universidad de los Andes). Bogota(Bogotá) D.C., Colombia.

% Gabe Espinosa Start codes in Matlab
% email: gabrielespinosa@gmail.com ; g-espino@uniandes.edu.co
% Ph.D. Student. 
% University of los Andes (Universidad de los Andes). Bogota D.C., Colombia.
%% %-----MANUAL EDITING------%
%---Manual modifications of control points---%
cmod=Points(:,:,:);
%-----------------------------
cmod(4,:)=1; % Including weigths
%% NURBS Generation
% polinomials order
p=2;
q=1;
s=1;
% Knot vectors
n=size(cmod,2);
m=size(cmod,3);
uknot=knotvector1D(n,p);
vknot=knotvector1D(m,q);

% spmod=rsmak({uknot,vknot},cmod);
% figure()
% fnplt(spmod)

%% initializing solid Control Points
 csolid=cmod(:,:,:);
 csolid(:,:,:,2)=csolid(:,:,:,1);
 for i=1:size(csolid,3)
     xm=mean(cmod(1,:,i));
     ym=mean(cmod(2,:,i));
     csolid(1,:,i,2)=xm;
     csolid(2,:,i,2)=ym;
 end
wknot=knotvector1D(size(csolid,4),s);
coefs = csolid;
knots = {uknot vknot wknot};
bone = nrbmak(coefs,knots);
geo=bone;
figure()    
nrbplot(bone, [40 40 40], 'light', 'off');
hold on
%2 D-Surface for testing ctrlpnt
% coefs = cmod;
% knots = {uknot vknot};
% bone = nrbmak(coefs,knots);
% figure()    
% nrbctrlplot(bone);

%% Saving adquired geometry
 save ('geof2Mp32', 'geo')
 save ('bpcf2Mp32.mat', 'coefs')
