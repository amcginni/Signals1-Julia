using Plots
using LaTeXStrings

pgfplots();
t = [-2:0.01:2];
x1(t::Real) = exp(0.8 * t);
x2(t::Real) = exp(-0.8 * t);

figa = plot(t, x1, title=L"x(t) = e ^ {0.8t}", xlabel = L"t", ylabel = L"x(t)", legend=:false)
figb = plot(t, x2, title=L"x(t) = e ^ {-0.8t}", xlabel = L"t", ylabel = L"x(t)", legend=:false)

plot(figa, figb) 
savefig("/tmp/plotS4.tex")

run(`pdflatex HW3-S4.tex`)
