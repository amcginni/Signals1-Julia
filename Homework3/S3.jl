using Plots
using LaTeXStrings

pgfplots();
n = -15:15;
x1(n::Integer) = 1;
x2(n::Integer) = cos(pi*n/8);
x3(n::Integer) = cos(pi*n/4);
x4(n::Integer) = cos(pi*n/2);
x5(n::Integer) = cos(pi*n);
x6(n::Integer) = cos(3*pi*n/2);
x7(n::Integer) = cos(7*pi*n/4);
x8(n::Integer) = cos(15*pi*n/8);
x9(n::Integer) = cos(2*pi*n);

figa = plot(n, x1.(n), line = :stem, title=L"x[n] = \cos{(0n)} = 1", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figb = plot(n, x2.(n), line = :stem, title=L"x[n] = \cos{(n\pi /8)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figc = plot(n, x3.(n), line = :stem, title=L"x[n] = \cos{(n\pi /4)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figd = plot(n, x4.(n), line = :stem, title=L"x[n] = \cos{(n\pi /2 )}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
fige = plot(n, x5.(n), line = :stem, title=L"x[n] = \cos{(n\pi)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figf = plot(n, x6.(n), line = :stem, title=L"x[n] = \cos{(3n\pi /2)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figg = plot(n, x7.(n), line = :stem, title=L"x[n] = \cos{(7n\pi /4)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figh = plot(n, x8.(n), line = :stem, title=L"x[n] = \cos{(15n\pi /8)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)
figi = plot(n, x8.(n), line = :stem, title=L"x[n] = \cos{(2n\pi)}", xlabel = L"n", ylabel = L"x[n]", legend=:false)

plot(figa, figb, figc, figd, fige, figf, figg, figh, figi)
savefig("/tmp/plotS3.tex")

run(`pdflatex HW3-S3.tex`)
