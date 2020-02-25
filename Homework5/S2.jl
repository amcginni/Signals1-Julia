using Plots
using LaTeXStrings
using DSP

pgfplots();

a = 1.4;
n = collect(1:6);

h = collect(a .^ n);
x = [1.0; 1.0; 1.0; 1.0; 1.0]
y = conv(h, x)
p1 = plot(h, line=:stem, xlabel="index-n", ylabel="h[n]", legend=:false)
p2 = plot(x, line=:stem, xlabel="index-n", ylabel="x[n]", legend=:false)
p3 = plot(y, line=:stem, xlabel="index-n", ylabel="y[n]", legend=:false)

plot(p1, p2, p3, layout = 3)

savefig("/tmp/plotS2.tex")

run(`pdflatex HW5-S2.tex`)
