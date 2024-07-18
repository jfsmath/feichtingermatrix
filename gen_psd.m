function A = gen_psd(dim,rk)
% Generate a random n by n psd matrix with rank two
    V = 10*(rand(dim,rk)-rand(dim,rk));
    A = V*V';
end