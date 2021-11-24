from shutil import copyfile
import os

path = os.getcwd()
base_folder = os.path.basename(path)

try:
    version = input("Enter file number version: ")
except:
    version = "0"

bitfile_path = path + "/" + base_folder + ".runs/impl_1/"
for file in os.listdir(bitfile_path):
    if file.endswith(".bit"):
        bitfile = file

source_bitfile = bitfile_path + bitfile

hwhfile_path = path + "/" + base_folder + ".srcs/sources_1/bd/" + bitfile[0:-12] + "/hw_handoff/"

for file in os.listdir(hwhfile_path):
    if file.endswith(".hwh"):
        hwhfile = file
source_hwhfile = hwhfile_path + hwhfile

dest_bitfile = path + "/" + bitfile[0:-12] + "_ver_" + version + ".bit"
dest_hwhfile = path + "/" + bitfile[0:-12] + "_ver_" + version + ".hwh"


copyfile(source_bitfile, dest_bitfile)
copyfile(source_hwhfile, dest_hwhfile)
