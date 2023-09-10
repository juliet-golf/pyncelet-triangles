var('f3,f4,f5,f6')

f1=.25*I
f2=.25+.33333*I

f36=(f5-f1)*(f5-f2)-(1-conjugate(f1)*f5)*(1-conjugate(f2)*f5)*f3*f6
f54=(f6-f1)*(f6-f2)-(1-conjugate(f1)*f6)*(1-conjugate(f2)*f6)*f5*f4
f15=(f3-f1)*(f3-f2)-(1-conjugate(f1)*f3)*(1-conjugate(f2)*f3)*f1*f5
f62=(f4-f1)*(f4-f2)-(1-conjugate(f1)*f4)*(1-conjugate(f2)*f4)*f6*f2
ans=solve([f36,f54,f15,f62],(f3,f4,f5,f6),solution_dict=True)
delete=[]

for n,a in enumerate(ans):
    pop=False
    deloffset=0
    for i in a:
        f=a[i].abs()
        if f>=1 or f<=10**-13:
            pop=True
            break
    if pop==True: delete.append(n)

fn=[a for n,a in enumerate(ans) if n not in delete]
print(str(f1.real()),",",str(f1.imag()))
print(str(f2.real()),",",str(f2.imag()))
for a in fn: 
    for i in a: 
        print(str(a[i].real()),",",str(a[i].imag()))