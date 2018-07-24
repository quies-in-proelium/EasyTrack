import sys, os, subprocess

### Setup ###
# Put the location of your AddonBuilder.exe here
basepath = os.path.dirname(sys.argv[0])
builder = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe'
toolsdir = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools'
# Put your signkey name here (should be in the same directory as this script)
signkey = "qip.biprivatekey"
# Put the source of the Project here ( where the addon folders are ) ::
source = basepath + "\dev"
# Put the place where you want the pbos to land here ::
destination = basepath + "\@EasyRFTrack\\addons"


### DON'T CHANGE BELOW ###
signkeypath = basepath + "\\" + signkey

if not os.path.exists(destination):
    os.makedirs(destination)

for addon in os.listdir(source):
    if os.path.isdir(source + "\\" + addon):
        sourceAddon = source + "\\" + addon
        if os.path.isfile(sourceAddon + "\$PBOPREFIX$"):
            with open(sourceAddon + "\$PBOPREFIX$", 'r') as pboprefix:
                prefix = "-prefix=" + pboprefix.read()
        build = subprocess.Popen([builder,sourceAddon,destination,"-toolsDirectory=" + toolsdir,"-sign=" + signkeypath,"-packonly","-clear",prefix])
        build.wait()
        print("")

input("Press the <ENTER> key to continue...")
