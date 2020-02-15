# This file demonstates the time-shift property for DT signals
using Plots, Interact

u(n::Integer) = ifelse(n < 0, zero(n), one(n)) #unit step function
x(n::Integer) = n *( u(n)-u(n-11) )

n = -2:15
@manipulate for a in 1:5

    p1 = plot(n,
            x.(n),
            framestyle = :origin,
            ylims = (-1,12),
            legend=:false,
            xlab = "n",
            ylab = "x[n]",
            line = :stem,
            marker = :circle,
            color = :blue,
            markercolor = :blue,
            )

    xlims = Vector(-5:8)
    p2 = plot(n,
        x.(a.*n),
        framestyle = :origin,
        ylims = (-1,12),
        legend=:false,
        xlab = "n",
        ylab = "x[an]",
        line = :stem,
        marker = :circle,
        color = :blue,
        markercolor = :blue,
        )
    plot(p1, p2, layout = (2,1) )

end
