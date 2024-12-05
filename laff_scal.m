function [x_out] = laff_scal(x,alpha)

[m_alpha,n_alpha] = size(alpha);
[m_x,n_x] = size(x);


if ~isvector(x)

    x_out = 'FAILED in vector';
    return
end

if ~isscalar(alpha)

    x_out = 'FAILED in scalar';
    return
end

if m_x == 1
    for i = 1:n_x
        x(1,i) = alpha * x(1,i);
    end
else 
    for i = 1:m_x
        x(i,1) = alpha * x(i,1);
    end
end
%can u use x' to change row to column or reversed
x_out = x
return
end