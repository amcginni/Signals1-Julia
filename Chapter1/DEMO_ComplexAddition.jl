using DSP, Plots, Interact

@manipulate for x₁ = -5:0.1:5, y₁ = -5:0.1:5, x₂ = -5:0.1:5, y₂ = -5:0.1:5
    O = 0
    z₁ = x₁ + y₁ * 1im
    z₂ = x₂ + y₂ * 1im

    plot( #plot z₁
        [real(O), real(z₁)], #tail point
        [imag(O), imag(z₁)], #head point
        color = :red,
        arrow = :true,
        legend = :true,
        lab = "z_1",
        alpha = 1,
        xlab = "Real",
        ylab = "Imag",
        xlims = [-6, 6],
        ylims = [-6, 6],
        framestyle = :origin,
    )

    plot!( #add plot z₂
        [real(O), real(z₂)], #tail point
        [imag(O), imag(z₂)], #head point
        color = :blue,
        arrow = :true,
        legend = :true,
        lab = "z_2",
        alpha = 1,
    )

    plot!( #add plot
        [real(z₁), real(z₁ + z₂)],
        [imag(z₁), imag(z₁ + z₂)],
        color = :blue,
        arrow = :true,
        legend = :true,
        lab = "z_1",
        alpha = 0.25,
    )

    plot!( #add plot
        [real(z₂), real(z₁ + z₂)],
        [imag(z₂), imag(z₁ + z₂)],
        color = :red,
        arrow = :true,
        legend = :true,
        lab = "z_2",
        alpha = 0.25,
    )

    plot!( #add plot
        [real(O), real(z₁ + z₂)],
        [imag(O), imag(z₁ + z₂)],
        color = :green,
        arrow = :true,
        legend = :true,
        lab = "z_1+z_2",
        alpha = 1,
    )
end
