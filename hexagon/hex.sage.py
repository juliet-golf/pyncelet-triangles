

# This file was *autogenerated* from the file hex.sage
from sage.all_cmdline import *   # import sage library

_sage_const_p25 = RealNumber('.25'); _sage_const_p33333 = RealNumber('.33333'); _sage_const_1 = Integer(1)
var('f5')

f1=_sage_const_p25 *I
f2=_sage_const_p25 +_sage_const_p33333 *I

a=(f5-f2)/(_sage_const_1 -f2*conjugate(f5))+(f5-f1)/(_sage_const_1 -f1*conjugate(f5))+f1*f2*f5*conjugate((f5-f2)/(_sage_const_1 -f2*conjugate(f5)))*conjugate((f5-f1)/(_sage_const_1 -f1*conjugate(f5)))-f5-f1-f2
b=-f1*f2-f2*f5-f1*f5+f1*f2*f5*(conjugate((f5-f2)/(_sage_const_1 -f2*conjugate(f5)))+conjugate((f5-f1)/(_sage_const_1 -f1*conjugate(f5))))

ansa=solve(a,f5,solution_dict=True)
ansb=solve(b,f5,solution_dict=True)
print(ansa)
print(ansb)

