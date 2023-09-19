include(raw"C:\Users\cryba\OneDrive\Documents\School\Triangles\codes\generic\dial.jl")

function main()
    #print("f1=")
    #f1=parse(ComplexF64,readline())
    #print("f2=")
    #f2=parse(ComplexF64,readline())
    f1=.5+.2im
    f2=+.3+.2im
    negac1=f1*f2
    negac0=((negac1*(conj(f1)+conj(f2))-f1-f2)/(1-abs(negac1)^2))
    r0=rho(negac0)
    r1=rho(negac1)
    plottri((f1,f2),dial((r0,r1),(negac0,negac1)))
end

main()
