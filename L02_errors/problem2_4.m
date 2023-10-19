clear all
close all
clc

x1 = num2bitstr(single((1+1/4)*2^(-124)));
x2 = num2bitstr(single(-5.87747210^(-38)));

if x1 == x2
    1
else
    -1
end


c = 299792458;

cs = num2bitstr(single(c));
cd = num2bitstr(double(c));

y = double2Dec(cs)
