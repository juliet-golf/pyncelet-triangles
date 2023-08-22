ilist=[1,2,3,4,5,6]
for a in range(6):
    phi=0
    for s in range(6-a):
        phi+=ilist[s]
    print(phi)