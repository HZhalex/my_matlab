function [y_out] = laff_axpy(alpha,x,y)

[m_x,n_x] = size(x);
[m_y,n_y] = size(y);

if (m_x ~= 1 && n_x ~= 1) | (m_y ~= 1 && n_y ~= 1)
    y_out = 'FAILED';
    return
end

if (m_x * n_x ~= m_y * n_y)
    y_out = 'FAILED';
    return
end

if ~isscalar(alpha)
    y_out = 'FAILED';
    return
end

if m_x == 1
    for i = 1:n_x
        x(1,i) = alpha * x(1,i);
    end
    if m_y == 1
        for i = 1:n_x
            y(1,i) = y(1,i) + x(1,i);
        end
    else
        y = 'FAILED';
    end

else 
    for i = 1:m_x
        x(i,1) = alpha * x(i,1);
    end
    if n_y == 1
        for i = 1:m_x
            y(i,1) = y(i,1) + x(i,1);
        end
    else
        y = 'FAILED';
    end
end
y_out = y
end