function v = UpdateVelocities(v, x, xSwarmBest, xParticleBest, c1, c2, deltaT, vMax, inertiaWeight, nParticles,nDimensions)
    
    for i = 1:nParticles
        for j = 1:nDimensions
            v(i,j) =  inertiaWeight.*v(i,j) + (c1*0.5.*(xParticleBest(i,j) - x(i,j))./deltaT) + (c2*0.5.*(xSwarmBest(j) - x(i,j))./deltaT);
            
            % Velocity Restriction
            if sign(v(i,j))*v(i,j) > vMax
                v(i,j) =sign(v(i,j))* vMax;
            else
                v(i,j) = v(i,j);
            end            
        end
    end
end

