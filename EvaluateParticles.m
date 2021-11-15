function f = EvaluateParticles(x,nParticles)
    
    f=zeros(nParticles,1);
    for i = 1:nParticles
        f(i) = x(i,1)^2  + 2*x(i,2)^2 ;
    end

end

