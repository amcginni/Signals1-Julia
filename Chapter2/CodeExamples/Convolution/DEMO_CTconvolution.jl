using Plots, Interact, QuadGK

Δt = 0.01 #sampling period
t = Vector(-4:Δt:7) #time index
τ = t #convolution index

u(t::Real) = ifelse(t < 0, zero(t), one(t)) #unit step function


x(t) = exp(-0.5t) * u(t)
h(t) = u(t)

#x(t) = u(t)-u(t-1)
#h(t) = u(t)-u(t-2)

#x(t) = exp(-0.5t) * ( u(t) - u(t-2))
#h(t) = 1.5*(u(t) - u(t-1))



function y(t) #output signal
    f(τ) = x(τ)*h(t-τ)
    A = quadgk(f, -10.0, 0.0, 10.0, order=25 )
    return A[1]
end


ylims = (-0.5,2)
f₀(τ,t₀) = x.(τ).*h.(t₀.-τ)
@manipulate for t₀ in -3:0.2:5
    xlims = Vector(-3:8)
    xticks = (   cat(xlims,t₀,dims=1), cat(string.(xlims),"t_0",dims=1)   )

    p1 = plot(τ,
        x.(τ),
        framestyle = :origin,
        xlims = (minimum(t), maximum(t)),
        ylims=ylims,
        lab = "x(tau)",
        xlab="tau",
        xticks=xticks,
        linewidth = 2 )
     plot!(τ,
        h.(t₀.-τ),
        lab = "h(t_0-tau)", linewidth = 2 )
    p2 = plot(τ,
       f₀(τ,t₀),
       framestyle = :origin,
       xlims = (minimum(t), maximum(t)),
       ylims=ylims,
       lab = "x(tau)h(t_0-tau)",
       xlab="tau",
       xticks=xticks,
       c=:purple, linewidth = 2)
     plot!(t,
        f₀(τ,t₀),
        fillrange = 0,
        c=:green,
        fillalpha=0.5,
        lab = "y(t_0)",
        linewidth = 0)
    t_ind = Vector(minimum(t):Δt:t₀)
    p3 = scatter([t₀, Inf],[y(t₀),Inf], c=:green, markersize = 5,lab = "y(t_0)")
     plot!(t_ind,
        y.(t_ind),
        framestyle = :origin,
        xlims = (minimum(t), maximum(t)),
        ylims=ylims,
        lab = "y(t)",
        xlab="t",
        xticks=xticks,
        c=:blue,
        linewidth = 2 )
    plot(p1,p2,p3,layout = (3,1))
    current()
end
