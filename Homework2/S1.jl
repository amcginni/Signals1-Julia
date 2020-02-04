using Plots
using LaTeXStrings

pgfplots();
t = [-2:0.01:3];
x1(t::Real) = ifelse(t <0, zero(t), ifelse(t <1, one(t), ifelse(t < 2, -t+2, zero(t)) ) );
x2(t::Real) = ifelse(t <-1, zero(t), ifelse(t <0, one(t), ifelse(t < 1, -t+1, zero(t)) ) );
x3(t::Real) = ifelse(t <-1, zero(t), ifelse(t <0, t + 1, ifelse(t < 1, one(t), zero(t)) ) );
x4(t::Real) = ifelse(t <0, zero(t), ifelse(t <2//3, one(t), ifelse(t < (4//3), -(3//2)*t+2, zero(t)) ) );
figa = plot(t, x1, xlims=(-1, 3), xticks=0:1:2, lab=L"x(t)", xlab="(a)")
figb = plot(t, x2, xlims=(-2, 2), xticks=-1:1:1, lab=L"x(t+1)", xlab="(b)")
figc = plot(t, x3, xlims=(-2, 2), xticks=-1:1:1, lab=L"x(-t+1)", xlab="(c)")
figd = plot(t, x4, xlims=(-1, 2), xticks=0:.66:1.33, lab=L"x(\frac{3}{2}t)", xlab="(d)")

plot(figa, figb, figc, figd)
savefig("../output/fig1.13a.tex")
