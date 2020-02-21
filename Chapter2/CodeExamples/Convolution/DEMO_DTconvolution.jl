using Plots, Interact


n = Vector(-5:1:10) #time index
k = n #convolution index

u(t::Integer) = ifelse(t < 0, zero(t), one(t)) #unit step function

x(n::Integer) = 0.5*u(n) + 0.5*u(n-1) - u(n-2)
h(n::Integer) = (3.0-n)*(u(n) - u(n-3)) #inpulse response

function y(n) #output signal
    return sum(x.(k).*h.(n.-k))
end


ylims = (-1,5)
f₀(k,n₀) = x.(k).*h.(n₀.-k)
@manipulate for n₀ in -5:1:8
    xlims = Vector(-3:8)
    xticks = (   cat(xlims,n₀,dims=1), cat(string.(xlims),"n_0",dims=1)   )

    p1 = plot(k,
        x.(k),
        framestyle = :origin,
        xlims = (minimum(n), maximum(n)),
        ylims=ylims,
        lab = "x[n]",
        xlab="n",
        linewidth = 2,
        c = :blue,
        line = :stem,
        marker = :rect,
        markercolor=:blue,
        markersize = 5)
p2 = plot(k,
            h.(k),
            framestyle = :origin,
            xlims = (minimum(n), maximum(n)),
            ylims=ylims,
            lab = "h[n]",
            xlab="n",
            linewidth = 2,
            c = :red,
            line = :stem,
            marker = :circle,
            markercolor=:red,
            markersize = 5)
    p3 = plot(k,
                 h.(n₀.-k),
                 framestyle = :origin,
                 xlims = (minimum(n), maximum(n)),
                 xticks=xticks,
                 ylims=ylims,
                 lab = "h[n-k]",
                 xlab="k",
                 linewidth = 2,
                 c = :red,
                 line = :stem,
                 marker = :circle,
                 markercolor=:red,
                 markersize = 4 )
   p4 = plot(k,
        x.(k),
        framestyle = :origin,
        xlims = (minimum(n), maximum(n)),
        ylims=ylims,
        lab = "x[k]",
        xlab="k",
        xticks=xticks,
        linewidth = 2,
        c = :blue,
        line = :stem,
        marker = :rect,
        markercolor=:blue,
        markersize = 5)
     plot!(k,
        h.(n₀.-k),
        lab = "h[n-k]",
        linewidth = 2,
        c = :red,
        line = :stem,
        marker = :circle,
        markercolor=:red,
        markersize = 4 )
    p5 = plot(k,
       f₀(k,n₀),
       framestyle = :origin,
       xlims = (minimum(n), maximum(n)),
       ylims=ylims,
       lab = "x[k]]h[n-k]",
       xlab="k",
       xticks=xticks,
       c=:purple,
       line = :stem,
       marker = :circle,
       markercolor=:purple,
       linewidth = 2)
    n_ind = Vector(minimum(n):1:n₀)
    p6 = scatter([n₀, Inf],[y(n₀),Inf], c=:purple, markersize = 10, marker=:star7 ,lab = "y[n_0]")
     plot!(n_ind,
        y.(n_ind),
        framestyle = :origin,
        xlims = (minimum(n), maximum(n)),
        ylims=ylims,
        lab = "y[n]",
        xlab="n",
        xticks=xticks,
        c=:green,
        line = :stem,
       marker = :circle,
       markercolor=:green,
       linewidth = 2,
       markersize = 3 )
    plot(p1,p2,p3,layout = (3,1))
   plot(p4,p5,p6,layout = (3,1))
    current()
end
