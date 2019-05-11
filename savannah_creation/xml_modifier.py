import xml.etree.ElementTree as et
import os


path = "Savannah_1.xml"
def convert(path):
    tree = et.parse(path)
    root = tree.getroot()
    for x in root.findall('filename'):
        x.text = x.text+".jpg"
    
    tree.write(path)

def change_xmls():
    inputDirPath="savannah_annotations/xmls/"
    for filename in os.listdir(inputDirPath):
        convert(inputDirPath+filename)
        print(inputDirPath+filename)

change_xmls()
