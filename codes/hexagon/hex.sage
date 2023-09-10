var('f5')

f1=.25*I
f2=.25+.33333*I

a=(f5-f2)/(1-f2*conjugate(f5))+(f5-f1)/(1-f1*conjugate(f5))+f1*f2*f5*conjugate((f5-f2)/(1-f2*conjugate(f5)))*conjugate((f5-f1)/(1-f1*conjugate(f5)))-f5-f1-f2
b=-f1*f2-f2*f5-f1*f5+f1*f2*f5*(conjugate((f5-f2)/(1-f2*conjugate(f5)))+conjugate((f5-f1)/(1-f1*conjugate(f5))))

ansa=solve(a,f5,solution_dict=True)
ansb=solve(b,f5,solution_dict=True)
print(ansa)
print(ansb)
