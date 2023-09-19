import LinearAlgebra.eigvals
using Plots

function rho(a)
    r = complex(1-abs(a)^2)^.5
    return r
end

function dial(r,nca)
    m=[-nca[1] r[1]; r[1] conj(nca[1])]
    l=[1 0 0; 0 -nca[2] r[2]; 0 r[2] conj(nca[2])]
    len=length(r)
    if len>2
        for i in range(3,len)
            Θ=[-nca[i] r[i]; r[i] conj(nca[i])]
            zero=zeros(ComplexF64,2,i-1)
            if Bool(i%2)
                m=hcat(vcat(m,zero),vcat(transpose(zero),Θ))
            else
                l=hcat(vcat(l,zero),vcat(transpose(zero),Θ))
            end
        end
    end
    zero=zeros(ComplexF64,1,len)
    Bool(len%2) ? l=hcat(vcat(l,zero),vcat(transpose(zero),1)) : m=hcat(vcat(m,zero),vcat(transpose(zero),1))
    g=l*m
    eigval=[eigvals(g)]
    for i in range(10,350,step=10)
        s=cis(deg2rad(i))
        Bool(len%2) ? g[end,end-1] = s*r[end] : g[end-1,end] = s*r[end]
        g[end,end] = s*conj(nca[end])
        append!(eigval,[eigvals(g)])
    end
    return eigval
end

function plottri(fn,eigval)
    θ = range(0, stop=2π, length=100)
    plt = plot(cos.(θ), sin.(θ), aspect_ratio=1, legend=false)
    for foci in fn
        scatter!([real(foci)],[imag(foci)],color="blue",label="Point")
    end
    for eig in eigval[begin:end-1]
        push!(eig,eig[1])
        plot!(real.(eig),imag.(eig), lw=2,color="grey")
        plot!(axis=false,grid=false)
    end
    eig=eigval[end]
    push!(eig,eig[1])
    plot!(real.(eig),imag.(eig), lw=2,color="red")
    println(pwd())
    savefig(plt,pwd()*"/output.png")
end


