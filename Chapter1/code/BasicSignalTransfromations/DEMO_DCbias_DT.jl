# This file demonstates the time-shift property for DT signals
using Plots, Interact

u(n::Integer) = ifelse(n < 0, zero(n), one(n)) #unit step function
x(n::Integer) =  u(n)-u(n-11)

n = -2:15
@manipulate for b in -3:0.1:3

    p1 = plot(n,
            x.(n),
            framestyle = :origin,
            ylims = (-5,5),
            legend=:false,
            xlab = "n",
            ylab = "x[n]",
            line = :stem,
            marker = :circle,
            color = :blue,
            markercolor = :blue,
            )

    p2 = plot(n,
        x.(n).+b,
        framestyle = :origin,
        ylims = (-5,5),
        legend=:false,
        xlab = "n",
        ylab = "x[n]+b",
        line = :stem,
        marker = :circle,
        color = :blue,
        markercolor = :blue,
        )
    plot(p1, p2, layout = (2,1) )

end
