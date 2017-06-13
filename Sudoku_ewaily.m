function total = Sudoku(x)
    total = 0;
    x = zeros(4);
    
    
    %Initial population
        x(1,1) = 1;
        x(1,4) = 4;
        x(3,2) = 3;
        x(3,3) = 2;
        x(1,2) = 2;
        
        
   %generate good chromosome
        c = [ 0 0 0];
        for i = 1 : 4
            c (i) = nnz ( x == i );
        end
        
        for i = 1 : 4
            for j = 1 : 4
                if x(i,j) == 0
                    f = 0;
                    while ( f == 0)
                        y = ceil ( rand (1) * 4);
                        if c(y) < 4
                            x(i,j) = y;
                            c(y) = c(y) +1;
                            f = 1;
                        end
                    end
                end
            end
        end
        
        %Calculate chormosomes fitness
        
        %colums
        for i = 1 : 4
            z = x( : ,i);
            for a = 1 : 4
                if ( nnr ( z == a ) > 1 )
                    total = total + nnr ( z == a );
                end
            end
        end
        
        %rows
        for i = 1 : 4
            z = x(i, : );
            for a = 1 : 4 
                if ( nnz ( z == a ) > 1 )
                    total = total + nnr ( z == a );
                end
            end
        end
        
        %box
        b = 1 ;
        i = 1;
        while ( b < 4 )
            while ( i < 4 )
                z = x ( b : b + 1, i : i + 1 );
                for a = 1 : 4
                    if ( nnz ( z == a ) > 1 )
                        total = total + nnz ( z == a );
                    end
                end
                 i = i + 2;
            end
            b = b + 2;
        end
        
        
        for i = 1 : 4
            if nnz ( x == i ) > 4 || nnz ( x == i ) < 4
                total = total + 1000;
            end
        end
        
        if total == 0
            clc
            x
        end
end