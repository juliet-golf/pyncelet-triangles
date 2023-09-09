import LinearAlgebra.eigvals
import Base.MathConstants.e

function rho(a)
    r = complex(1-abs(a)^2)^.5
    return r
end

function dial(a,r0,r1,nca0,nca1)
    col=[r0*r1; conj(nca0)*r1]
    row=[ 0 r1 conj(nca1)]     
    a=vcat(hcat(a,col),row)
    eigval=[eigvals(a)]
    for i in range(16,360,step=16)
        t=deg2rad(i)
        s=e^(1im*t)
        a[3,2] = s*r1
        a[3,3] = s*conj(nca1)
        append!(eigval,[eigvals(a)])
    end
    println(length(eigval))
end

f1=.5+.2im
f2=-.3-.2im

negac1=f1*f2
negac0=((negac1*(conj(f1)+conj(f2))-f1-f2)/(1-abs(negac1)^2))
r0=rho(negac0)
r1=rho(negac1)
a=[-1*negac0 r0*-negac1 ; r0 negac1*-conj(negac0)]
println(typeof(a))
dial(a,r0,r1,negac0,negac1)