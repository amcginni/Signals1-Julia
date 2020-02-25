using WAV
using DSP

x, fs = wavread("Speech.wav")
h = [1; zeros(Float64,Int64(fs/2-1),1); 1/4]
h = collect(h)
y = conv(h, x)
y = y./abs.(max.(y))

wavwrite(y, "echo_speech.wav", Fs=fs)

run(`pdflatex HW5-S3.tex`)
