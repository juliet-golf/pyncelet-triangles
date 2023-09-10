import subprocess as s
import pandas as pd
#s.run("wsl sage hept_s.sage > output.csv",shell=True)
input=pd.read_csv('output.csv',header=None,encoding='utf-16')
#s.run("del output.csv",shell=True)
fn=[]
for i in range(input.shape[0]):
    fn.append(complex(input.iloc[i][0],input.iloc[i][1]))

an=[]
an.append(fn[0]*fn[1]*fn[2]*fn[3]*fn[4]*fn[5])
