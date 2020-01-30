# This file demonstates the time-shift property for CT signals
using Plots, Interact

Λ(t::Real) = ifelse(t < -1, zero(t), ifelse(t < 0, t+1, ifelse(t < 1, -t+1, zero(t)) ) ) #unit triangle function
x(t::Real) = Λ(t) + Λ(t-3)

t = -7:0.01:7
@manipulate for α in 0.2:0.2:3

    p1 = plot(t, x.(t),
            framestyle = :origin,
            ylims = (-1,2),
            legend=:false,
            xlab = "t",
            ylab = "x(t)",
            )

    xlims = Vector(-5:8)
    p2 = plot(t,
        x.(α.*t),
        framestyle = :origin,
        ylims = (-1,2),
        legend=:false,
        xlab = "t",
        ylab = "x(αt)",
        )
    plot(p1, p2, layout = (2,1) )

end
