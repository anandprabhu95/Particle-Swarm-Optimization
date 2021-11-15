function [x, v] = InitializeParticles(variableRange,nDimensions,nParticles,alpha,deltaT)

    for i = 1:nParticles
        for j = 1:nDimensions
            
            x(i,j) = variableRange(1) + rand*(variableRange(2) - variableRange(1));
            v(i,j) = alpha/deltaT * (-(variableRange(2) - variableRange(1))/2 + rand*(variableRange(2) - variableRange(1)));
        
        end
    end
            

end

