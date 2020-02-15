using Plots
using LaTeXStrings
using WAV

pgfplots();

x, fs = wavread("Speech.wav");
N1 = 230050;
N2 = N1+100;
n = N1:N2;

t = n/fs;

plot(t, x[n], title="Problem S-2: Speech signal", xlabel="time (t)", ylabel="x(t)", legend=:false)
savefig("/tmp/plotS2.tex")

run(`pdflatex HW3-S2.tex`)
