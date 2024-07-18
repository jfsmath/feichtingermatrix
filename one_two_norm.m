function g = one_two_norm(V)
    dim = length(V(1,:));
    g = 0;
    for i = 1:dim
        g = g + norm(V(:,i),1)^2;
    end
end