function [result] = double2Dec(bits)


sign = 0;
exponent = 1;
mantisa = 0;
p1 = 12;
p2 = 64;
bias = 1023;

if length(bits) == 32 
    p1 = 9;
    p2 = 32;
    bias = 127;
end


for i = 1:length(bits)
    if i == 1 && bits(1) == '1'
        sign = -1;
    else
        sign = 1;
    end

    if i > 1 && i < p1 && bits(i) == '1'
        exponent = exponent + 2^(p1 - i);

    elseif i >= p1 && i <= p2 && bits(i) == '1'
        mantisa = mantisa + 2^(i * (-1) + p1);

    end
end

result = sign * 2^(exponent-bias) * mantisa
end