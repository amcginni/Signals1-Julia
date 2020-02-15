# This file demonstates the time-shift property for DT signals
using Plots, Interact


u(n::Integer) = ifelse(n < 0, zero(n), one(n)) #unit step function
x(n::Integer) = u(n)-u(n-3)

inspectdr();

n = -5:10
@manipulate for n₀ in -3:5

    p1 = plot(n,
            x.(n),
            framestyle = :origin,
            ylims = (-1,2),
            legend=:false,
            xlab = "n",
            ylab = "x[n]",
            line = :stem,
            marker = :circle,
            color = :blue,
            markercolor = :blue,
            )

    xlims = Vector(-5:8)
    xticks = ( cat(xlims,n₀,dims=1), cat(string.(xlims),"n_0",dims=1) )
    p2 = plot(n,
        x.(n.-n₀),
        framestyle = :origin,
        ylims = (-1,2),
        legend=:false,
        xlab = "n",
        ylab = "x[n-n_0]",
        xticks=xticks,
        line = :stem,
        marker = :circle,
        color = :blue,
        markercolor = :blue,
        )
    fig = plot(p1, p2, layout = (2,1) )
	display(fig);
end
