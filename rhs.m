function rhs = rhs(data, h, n)

if h < 0
    disp('Error: h cannot be less than 0!');
else
    
    rhs = zeros(n,1);
    
    for i = 1 : n
        rhs(i) = ( ( data( i + 2 ) - data( i + 1 ) ) / h ) - ( ( data ( i + 1 ) - data ( i ) ) / h );
    end
    rhs = 6 * rhs ;
end

