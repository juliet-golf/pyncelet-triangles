import LinearAlgebra.eigvals
import Base.MathConstants.e
using Plots

function rho(a)
    r = complex(1-abs(a)^2)^.5
    return r
end

function dial(a,r0,r1,nca0,nca1)
    col=[r0*r1; conj(nca0)*r1]
    row=[ 0 r1 conj(nca1)]     
    a=vcat(hcat(a,col),row)
    eigval=[eigvals(a)]
    for i in range(10,350,step=10)
        t=deg2rad(i)
        s=e^(1im*t)
        a[3,2] = s*r1
        a[3,3] = s*conj(nca1)
        append!(eigval,[eigvals(a)])
    end
    return eigval
end

function plottri(fn,eigval)
    θ = range(0, stop=2π, length=100)
    plt = plot(cos.(θ), sin.(θ), aspect_ratio=1, legend=false)
    for foci in fn
        scatter!([real(foci)],[imag(foci)],color="blue",label="Point")
    end
    eig=eigval[1]
    push!(eig,eig[1])
    plot!(real.(eig),imag.(eig), lw=2,color="red")
    for eig in eigval[2:end]
        push!(eig,eig[1])
        plot!(real.(eig),imag.(eig), lw=2,color="grey")
        plot!(axis=false,grid=false)
        savefig(plt,"output.png")
    end
end

function main()
    print("f1=")
    f1=parse(ComplexF64,readline())
    print("f2=")
    f2=parse(ComplexF64,readline())
    #f1=.5+.2im
    #f2=-.3-.2im
    negac1=f1*f2
    negac0=((negac1*(conj(f1)+conj(f2))-f1-f2)/(1-abs(negac1)^2))
    r0=rho(negac0)
    r1=rho(negac1)
    a=[-1*negac0 r0*-negac1 ; r0 negac1*-conj(negac0)]
    plottri((f1,f2),dial(a,r0,r1,negac0,negac1))
end

main()
