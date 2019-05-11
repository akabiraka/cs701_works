import random
import subprocess
import os

print("alhumdulillah")
class_names = ['Abyssinian', 'american_bulldog', 'american_pit_bull_terrier', 'basset_hound', \
        'beagle', 'Bengal', 'Birman', 'Bombay', 'boxer', 'British_Shorthair', 'chihuahua', 'Egyptian_Mau', 'english_cocker_spaniel', \
        'english_setter', 'german_shorthaired', 'great_pyrenees', 'havanese', 'japanese_chin', 'keeshond', 'leonberger', 'Maine_Coon', \
        'miniature_pinscher', 'newfoundland', 'Persian', 'pomeranian', 'pug', 'Ragdoll', 'Russian_Blue', 'saint_bernard', 'samoyed', \
        'scottish_terrier', 'shiba_inu', 'Siamese', 'Sphynx', 'staffordshire_bull_terrier', 'wheaten_terrier', 'yorkshire_terrier']

def runCommand(command):
   return subprocess.getoutput(command)

def copy_img_annotation_randomly (num_of_images, class_name, img_input_dir, img_output_dir, annotation_input_dir, annotation_output_dir):
    "this function create random image names, copy from input_dir, \
    and paste into output_dir"
    i=0
    while i < num_of_images:
        image_name = class_name + '_' + str(random.randint(1, 190))
        image_path = img_input_dir + image_name + ".jpg"
        img_exists = os.path.isfile(image_path)
        annotation_path = annotation_input_dir + image_name + ".xml"
        annotation_exists = os.path.isfile(annotation_path)
        if img_exists and annotation_exists:
            runCommand("cp " + image_path + " " + img_output_dir)  # copy image to destination
            runCommand("cp " + annotation_path + " " + annotation_output_dir) # copy annotation to destination
            print(i)
            i=i+1
       



num_of_images = 1 
img_input_dir = "../../datasets/pet/real_data/images/"
img_output_dir = "test_images/"
annotation_input_dir = "../../datasets/pet/real_data/annotations/xmls/"
annotation_output_dir = "test_annotations/"
for class_ in class_names:
    copy_img_annotation_randomly(num_of_images, class_, img_input_dir, img_output_dir, annotation_input_dir, annotation_output_dir)
