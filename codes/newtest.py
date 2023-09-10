import subprocess as s
s.run("wsl sage test.sage > output.txt",shell=True)