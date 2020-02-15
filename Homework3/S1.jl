using Plots
using LaTeXStrings
using WAV

pgfplots();

x, fs = wavread("Speech.wav");
N1 = 230050;
N2 = N1+100;
n = N1:N2;

plot(n, x[n], line=:stem, title="Problem S-1: Speech signal", xlabel="time-index (n)", ylabel="x[n]", legend=:false)
savefig("/tmp/plotS1.tex")

run(`pdflatex HW3-S1.tex`)
