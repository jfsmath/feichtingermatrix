function g = nuclear(A)
% Compute the 1-nuclear norm of a matrix A
    g = sum(abs(A),'all');
end
