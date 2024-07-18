function A = gen_psd_bad(n,rk)
% This function generates a 'bad' PSD matrix, A = VV', where the columns of
% V is either a one-level vector or bi-level vector, and the bilevel are
% currently given by plus or minus of the same height
    V = zeros(n,rk);
    for i = 1:rk
            V(:,i) = randn(1)*(sign(randn(n,1)));
    end
    A = V*V';
end