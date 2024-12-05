function [alpha] = laff_norm2(x)
% phai su dung va nam trong thu muc co laff_dot moi su dung duoc
% su khac biet ve 2 cai norm(x,2) va laff_norm(x) TEST FAILED  But could
% this be due to roundoff? co the su dung isequal de so sanh
if  ~isvector(x)
    alpha = 'FAILED';
    return
end
alpha = sqrt(laff_dot(x,x));

end