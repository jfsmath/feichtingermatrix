num_samples = 100;


function A = gen_psd(dim)
% Generate a random n by n psd matrix with rank two
    V = rand(dim,2);
    A = V*V';
end

function g = gamma(A)
% Compute the 1-nuclear norm of a matrix A
    g = sum(abs(A),'all');
end

function gp = g_plus(A,dim)
% Approximate the symmmetric 1-nuclear norm of a psd matrix A
    num_trials = 200;
    length = dim*num_trials; % total number of repetition
    gp_temp = zeros(1,length); 
    [V,~] = eig(A); 
    for i = 1:(length)
        J = randn(dim,dim);
        [O,~] = qr(J); % generate a random rotation matrix via QR decomposition
        V_temp = V*O;  % rotate the eigendecomposition of A by O
        for j = 1:dim
            gp_temp(1,i) = gp_temp(1,i) + norm(V_temp(:,j),1)^2; % Keep track of gamma_plus for each rotation
        end
    end
    gp = min(gp_temp);
end

