setlocal omnifunc=necoghc#omnifunc

function! TagProject()

python << EOF

import vim
import os

def existsCabalFileInCurrentDir():
    for f in os.listdir("."):
        if f.endswith(".cabal"):
            return True
    return False


oldDir = os.getcwd()

while(not existsCabalFileInCurrentDir()):
    if os.getcwd() == "/":
        print "No se encontró fichero cabal"
        exit
    os.chdir("..")

# Asumimos que el código estará en el folder src y dejaremos el fichero de
# tags en el folder dist para que no moleste a GIT u otros 
if not os.path.exists("dist"):
    os.mkdir("dist")

os.chdir("dist")
os.system("find ../src | egrep '\.hs$' | xargs hothasktags > tags")

vim.command("set tags+="+os.getcwd()+"/tags")
os.chdir(oldDir)

EOF

endfunction

