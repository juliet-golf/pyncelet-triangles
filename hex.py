import numpy as np
import sympy as sy
from sympy import I
from sympy import conjugate as conj
import matplotlib.pyplot as plt
fig=plt.figure(figsize=(5,5))
ax = fig.add_subplot(1, 1, 1)
f1=complex(0,.3)
f2=complex(0,.1)
sy.init_printing()
f5=sy.symbols('f5',real=False)
f5c=sy.symbols('f5c',real=False)
a=sy.Eq((f5-f2)/(1-f2*conj(f5))+(f5-f1)/(1-f1*conj(f5))+f1*f2*f5*conj((f5-f2)/(1-f2*conj(f5)))*conj((f5-f1)/(1-f1*conj(f5)))-f5-f1-f2,0)
b=sy.Eq(-f1*f2-f2*f5-f1*f5+f1*f2*f5*(conj((f5-f2)/(1-f2*conj(f5)))+conj((f5-f1)/(1-f1*conj(f5)))),0)
l=sy.solve([a],(f5),I)
print(l)



#plt.scatter(f5.real,f5.imag,color="red",marker="1")
#def f3f4(fn):
    #global f5
    #return (f5-fn)/(1-fn*np.f5c)
#f3=f3f4(f2)
#f4=f3f4(f1)
t=np.linspace(0,2*np.pi,100)  
ax.spines['top'].set_color('none')
ax.spines['left'].set_color('none')
ax.spines['right'].set_color('none')
ax.spines['bottom'].set_color('none')
ax.axes.xaxis.set_visible(False)
ax.axes.yaxis.set_visible(False)
plt.plot(np.cos(t), np.sin(t), linewidth=1)
plt.scatter(f1.real,f1.imag,color="blue",marker="1")
plt.scatter(f2.real,f2.imag,color="blue",marker="1")
#plt.scatter(f3.real,f3.imag,color="yellow")
#plt.scatter(f4.real,f4.imag,color="yellow")
#plt.scatter(f5.real,f5.imag,color="red")
#plt.show()