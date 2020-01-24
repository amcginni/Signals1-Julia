# This file demonstates the time shift property for CT signals

using Plots, Interact

Λ(t::Real) = ifelse(t < -1, zero(t), ifelse(t < 0, t+1, ifelse(t < 1, -t+1, zero(t)) ) ) #unit triangle function

t = -5:0.01:10
@manipulate for t₀ in -3:0.2:5

    p1 = plot(t, Λ.(t),
            framestyle = :origin,
            ylims = (-1,2),
            legend=:false,
            xlab = "t",
            ylab = "f(t)",
            )

    xlims = Vector(-5:8)
    xticks = ( cat(xlims,t₀,dims=1), cat(string.(xlims),"t_0",dims=1) )
    p2 = plot(t,
        Λ.(t.-t₀),
        framestyle = :origin,
        ylims = (-1,2),
        legend=:false,
        xlab = "t",
        ylab = "f(t-t_0)",
        xticks=xticks,
        )
    plot(p1, p2, layout = (2,1) )

end
