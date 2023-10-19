clear all;
close all;
clc;
format long;

syms a b c x;

f = (-b-sqrt(b^2 - 4*a*c))/2*a;

df_db = diff(f, b)
simplify(b*df_db/f)


a = 0.5;
b = 1;
c = 0.5;

cond = b/(sqrt(b^2 - (4*a*c))); % "katastrofalne odejmowanie" dzielenie przez 0 -> wynik - inf

a = 0.5;
c = 0.500;                      % im c bliższe dalsze od sredniej tym mniejsa szansa na dzielenie przez 0"
b = 1+0.001*randn(1,1000);

x_tbl = [];
condx_tbl = [];

for i = 1:1000
    x1 = (-b(i) - sqrt(b(i)^2 - 4*a*c))/2*a;    % wzor z 2.12
    condx = b(i)/(sqrt(b(i)^2 - 4*a*c));
    x_tbl(end+1) = x1;
    condx_tbl(end+1) = condx;
end

display("srednia x: " + mean(x_tbl))
display("odchylenie x: " + std(x_tbl))
display("srednia uwarunkowana: " + mean(condx_tbl))
display("odchylenie uwarunkowane: " + std(condx_tbl))
