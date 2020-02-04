using Plots
using LaTeXStrings

pgfplots();
C = 1;
alpha1 = 1.2;
alpha2 = 0.5;
alpha3 = -0.5;
alpha4 = -1.2;

n = -15:15;
x1(n::Integer) = C * alpha1 ^ n;
x2(n::Integer) = C * alpha2 ^ n;
x3(n::Integer) = C * alpha3 ^ n;
x4(n::Integer) = C * alpha4 ^ n;

figa = plot(n, x1.(n), line = :stem, lab=L"x[n] = C\alpha ^ n , \alpha < 1", xlab="(a)")
figb = plot(n, x2.(n), line = :stem, lab=L"x[n] = C\alpha ^ n , 0 < \alpha < 1", xlab="(b)")
figc = plot(n, x3.(n), line = :stem, lab=L"x[n] = C\alpha ^ n , -1 < \alpha < 0", xlab="(c)")
figd = plot(n, x4.(n), line = :stem, lab=L"x[n] = C\alpha ^ n , \alpha > -1", xlab="(d)")

plot(figa, figb, figc, figd)
savefig("../output/fig1.24.tex")

run(`pdflatex HW2-S2.tex`)
