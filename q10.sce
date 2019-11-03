clc;
clear;

function [a,b]=linlsq(X,Y)
    [n,m]=size(X);
    n=n*m;
    sumx = sum(X);
    sumy = sum(Y);
    sumxx = sum(X.*X);
    sumxy = sum(X.*Y);
    a=(sumx*sumy-n*sumxy)/(sumx*sumx-n*sumxx);
    b=(sumy-a*sumx)/n;
endfunction

function [y]=func_linear(a, b, x)
    y = a*x + b 
endfunction

t = [0.8 1.8 2.8 3.8 4.8 5.8 6.8 7.8 8.8 9.8 10 10.2 10.4 10.6 10.8 11 11.2 11.4 11.6 11.8]
d = [0.15 0.52 0.76 1.12 1.47 1.71 2.08 2.56 3.19 4.35 4.55 5.64 6.76 8.17 10.1 12.7 16.2 20.3 30 60]

func1 = []
[a, b] = linlsq(t(1:10), d(1:10));
for i = 1:10
    func1(i) = func_linear(a, b, t(i))
end
plot(t(1:10), d(1:10), "blue o");
plot(t(1:10), func1, "red");





func3 = []
[a, b] = linlsq(t(18:20), d(18:20));
for i = 1:3
    func3(i) = func_linear(a, b, t(i+17))
end
plot(t(18:20), d(18:20), "blue o");
plot(t(18:20), func3, "red");
