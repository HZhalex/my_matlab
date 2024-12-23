function [alpha] = laff_dot(x,y)
[m_x,n_x] = size(x);
[m_y,n_y] = size(y);

if (m_x ~= 1 && n_x ~= 1) | (m_y ~= 1 && n_y ~= 1)
    alpha = 'FAILED';
    return
end

if (m_x * n_x ~= m_y * n_y)
    alpha = 'FAILED';
    return
end
alpha = 0;
if (m_x == 1 )
    if (m_y == 1 ) 
        for i = 1:n_x
            alpha = alpha + x(1,i) * y(1,i);
        end
    else
        for i = 1:n_x
            alpha = alpha + x(1,i)*y(i,1);
        end
    end
else 
    if (m_y == 1 ) 
        for i = 1:m_x
            alpha = alpha + x(i,1)*y(1,i);
        end
    else
        for i = 1:m_x
            alpha = alpha + x(i,1)*y(i,1);
        end
    end
end

return
end