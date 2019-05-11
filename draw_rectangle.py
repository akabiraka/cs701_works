import matplotlib.pyplot as plt
import matplotlib.patches as patches
from PIL import Image
import numpy as np
import xml.etree.ElementTree as et

def get_x_y_width_height_bb_annotations (path):
    "path should have full annotation path. extracts x_min, x_max \
    y_min, y_max. then return x, y, width, height"
    tree = et.parse(path)
    root = tree.getroot()
    
    for x in root.iter('bndbox'):
        xmin = int(x.find('xmin').text)
        ymin = int(x.find('ymin').text)
        xmax = int(x.find('xmax').text)
        ymax = int(x.find('ymax').text)

    return xmin, ymin, (xmax-xmin), (ymax-ymin) # returning x, y, width, height

def draw_rectangle (image_path, bb_path):
    "this takes an image path and a bounding box annotation path which \
    contains xmin, ymin, xmax, ymax. from these, it returns an image after \
    drawing a boudning box on the image"

    img = np.array(Image.open(image_path), dtype=np.uint8)             # read image
    x, y, width, height = get_x_y_width_height_bb_annotations(bb_path) # get x,y,width,height
    rect = patches.Rectangle((x,y),width,height,linewidth=1,edgecolor='r',facecolor='none') #create rectangle patch
    fig,ax = plt.subplots(1) # create figure and axes
    ax.imshow(img) # display image
    ax.add_patch(rect) # add the patch to the axes
    plt.show()

draw_rectangle("test_images/Abyssinian_10.jpg", "test_annotations/Abyssinian_10.xml")


