# This file demonstates the time-scale property for CT signals
using Plots, Interact

Λ(t::Real) = ifelse(t < -1, zero(t), ifelse(t < 0, t+1, ifelse(t < 1, -t+1, zero(t)) ) ) #unit triangle function
x(t::Real) = Λ(t) + Λ(t-3)

t = -7:0.01:7
@manipulate for a in -3:0.1:3

    p1 = plot(t, x.(t),
            framestyle = :origin,
            ylims = (-5,5),
            legend=:false,
            xlab = "t",
            ylab = "x(t)",
            )

    p2 = plot(t,
        a.*x.(t),
        framestyle = :origin,
        ylims = (-5,5),
        legend=:false,
        xlab = "t",
        ylab = "a x(t)"
        )
    plot(p1, p2, layout = (2,1) )

end
