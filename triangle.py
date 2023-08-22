import numpy as np
from numpy import linalg as la
import math as m
import matplotlib.pyplot as plt
r1=float(input("r1="))
i1=float(input("i1="))
r2=float(input("r2="))
i2=float(input("i2="))
f1=complex(r1,i1)
f2=complex(r2,i2)
negac1=f1*f2

def phi2(z,f1,f2):
    p2=(z-f1)*(z-f2)
    return p2

negac0=((negac1*(np.conj(f1)+np.conj(f2))-f1-f2)/(1-abs(negac1)**2))

def rho(a):
    r=(1-abs(a)**2)**(1/2)
    return r

r0=rho(negac0)
r1=rho(negac1)
a=np.array([[-1*negac0,r0*-negac1],[r0,negac1*-np.conj(negac0)]])

#dial adds zeros to the back and bottem edges and s=1 to the bottem corner of a.

def dial(a,r0,r1,nca0,nca1):    
    col=np.array([[r0*r1],[np.conj(nca0)*r1]])
    row=np.array([[0,r1,np.conj(nca1)]])
    a=np.append(np.append(a,col,1),row,0)
    ev,trash=la.eig(a)
    eigvals=[ev]
    rot=[]
    for i in range(16,360,16):
        t=m.radians(i)
        rot.append((np.e**(complex(0,1)*t)))
    for s in rot:
        a[2][1]=s*r1
        a[2][2]=s*np.conj(nca1)
        evt,trash=la.eig(a)
        eigvals.append(evt)
    return eigvals

#Sets up plot parameters
def plot(f1,f2,eigvals):
    fig=plt.figure(figsize=(8,8))
    ax = fig.add_subplot(1, 1, 1)
    ax.spines['top'].set_color('none')
    ax.spines['left'].set_color('none')
    ax.spines['right'].set_color('none')
    ax.spines['bottom'].set_color('none')
    ax.axes.xaxis.set_visible(False)
    ax.axes.yaxis.set_visible(False)
    #Plots unit circle and foci
    t=np.linspace(0,2*np.pi,100)  
    plt.plot(np.cos(t), np.sin(t), linewidth=1)
    plt.scatter(f1.real,f1.imag,color="blue")
    plt.scatter(f2.real,f2.imag,color="blue")
    #Plots triangles
    for i in range(len(eigvals)-1):
        plotev=[[],[]]
        for c in eigvals[i]:
            plotev[0].append(c.real)
            plotev[1].append(c.imag)
        plotev[0].append(plotev[0][0])
        plotev[1].append(plotev[1][0])
        plt.plot(plotev[0],plotev[1],color="grey")
    plotev=[[],[]]
    for c in eigvals[-1]:
        plotev[0].append(c.real)
        plotev[1].append(c.imag)
    plotev[0].append(plotev[0][0])
    plotev[1].append(plotev[1][0])
    plt.plot(plotev[0],plotev[1],color="red")
    plt.show()
    
plot(f1,f2,dial(a,r0,r1,negac0,negac1))