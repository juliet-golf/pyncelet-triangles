z=var('z')
fn=[.5*I,.2,.3+.4*I,-.2-.5*I,-.5,-.3+.2*I]
an=[.2-.1*I]
phi=1
phic=1
for f in fn: phi*=(z-f)
for f in fn: phic*=(1-z*f)

for i in range(len(fn)): 
    phi_1(z)=(z*phi-conjugate(an[-1])*phic)/(1-abs(an[-1]))
    phic_1(z)=(phic-an[-1]*z*phi)/(1-abs(an[-1]))
    an.append(-conjugate(phi_1(0)))
    phi=phi_1(z)
    phic=phic_1(z)

print(an)