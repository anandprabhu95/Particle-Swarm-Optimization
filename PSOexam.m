clear all
close all
clc;

variableRange = [-5 5];
nDimensions = 2;
nParticles = 3;
alpha = 1;
deltaT = 1;
c1 = 2;
c2 = 2;
nIterations = 1;
inertiaWeight = 1;
vMax = 1;

%%% Initialization %%%%%%%
%[position, velocity] = InitializeParticles(variableRange,nDimensions,nParticles,alpha,deltaT);

position =[0 1; 1 1; 1 0];
velocity=[0 -1; -1 0; 0 1];
fParticleBest = 100*ones(nParticles,1); %Assign a high value
positionParticleBest = position;


 for k = 1:nIterations

    %%% Evaluation %%%%%%%%%%%%%%
    f = EvaluateParticles(position,nParticles);


    %%% Update best positions %%%
    [fSwarmBest, index] = min(f);
    positionSwarmBest = position(index,:);

    for i = 1:nParticles    
        if f(i) < fParticleBest(i)
            fParticleBest(i) = f(i);
            positionParticleBest(i,:) = position(i,:);
        end       
    end


    %%%% Update Velocity and positions %%%%%
    velocity = UpdateVelocities(velocity, position, positionSwarmBest, positionParticleBest, c1, c2, deltaT, vMax, inertiaWeight, nParticles, nDimensions);
    position = UpdatePositions(position, velocity, deltaT);
    
 end

disp(sprintf('xBest: %0.2f  yBest: %0.2f Function Value: %.3f',positionSwarmBest(1),positionSwarmBest(2),fSwarmBest))
%%% Countour Plot %%%%%%
x = linspace(variableRange(1),variableRange(2),1000);
y = linspace(variableRange(1),variableRange(2),1000);
[x,y] = meshgrid(x,y);
functionValue = (x.^2 + y - 11).^2 + (x + y.^2 - 7).^2;
figure()
contour(x,y,log(0.01+functionValue),30)
hold on
scatter(positionSwarmBest(1),positionSwarmBest(2),[],'r','filled')

