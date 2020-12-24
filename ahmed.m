function fx = ahmed(a, b, x, N, a0)

fx = zeros(100, 1);

for i = 1 : length(x)
    for j = 1 : N
        fx(i) =  a(j) * cos( 2 * j * pi * x(i) ) + b(j) * sin ( 2 * j * pi * x(i) ) + fx(i) ;
    end
    fx(i) = fx(i) + a0;
end