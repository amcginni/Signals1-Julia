#This demo shows how to generate CT and DT plots, then save the resulting figure as a png file.
using DSP, Plots

x(n::Integer) = n^2 #DT signal
n = -10:10 #discrete time index
p1 = plot(n, x.(n), line = :stem, marker = :circle, color = :red, markercolor = :red, lab = "x[n]", xlab = "n")#p1 is a DT plot

x(t::Real) = sin(t) #CT signal
Δt = 1/100 #time increment
t = -10:Δt:10 #time index
p2 = plot( t, x.(t), color=:red, lab="x(t)", xlab="t") #p2 is a CT plot

plot(p1, p2, layout = (2,1)) #display plots p1 and p2
path = "C:/temp/"
savefig( path*"CTandDTplots.png") #save the plot in path
