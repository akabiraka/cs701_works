import cv2, os, sys
import numpy as np
import glob
import random

def convert_rgb_semantic_mask_to_trimap_with_rect_smooth(path):
    img = cv2.imread(path)
    #cv2.imshow("img", img)
    rows = img.shape[0]
    cols = img.shape[1]
    for i in range(0,img.shape[0]):
        for j in range(0,img.shape[1]):
            if 255 in img[i,j]:
                img[i,j] = (1,1,1)
            elif 0 in img[i,j]:
                img[i,j] = (2,2,2)
            else:
                x = (3,3,3)            
                if img[i,j,0]!=3 and img[i,j,2]!=3 and img[i,j,1]!=3:
                    for m in range(i, i+20):
                        for n in range(j, j+20):
                            if m>=0 and n>=0 and m<rows and n<cols:
                                img[m,n] = x

    return img


def convert_rgb_semantic_mask_to_trimap_with_star_smooth(path):
    img = cv2.imread(path)
    #cv2.imshow("img", img)
    rows = img.shape[0]
    cols = img.shape[1]
    for i in range(0,img.shape[0]):
        for j in range(0,img.shape[1]):
            if 255 in img[i,j]:
                img[i,j] = (1,1,1)
            elif 0 in img[i,j]:
                img[i,j] = (2,2,2)
            else:
                x = (3,3,3)            
                if img[i,j,0]!=3 and img[i,j,2]!=3 and img[i,j,1]!=3:
                    for k in range(0,10):
                        if i+k < rows:
                            img[i+k, j] = x
                        if i-k >= 0:
                            img[i-k, j] = x
                        if j+k < cols:
                            img[i, j+k] = x
                        if j-k >= 0:
                            img[i, j-k] = x
                        if i+k < rows and j+k < cols:
                            img[i+k, j+k] = x
                        if i-k>=0 and j-k>=0:                
                            img[i-k, j-k] = x
                        if i+k<rows and j-k>=0:                
                            img[i+k, j-k] = x
                        if i-k>=0 and j+k<cols:
                            img[i-k, j+k] = x

    return img
    
#    cv2.imshow("gray_changes", img)
#    cv2.imwrite("Abyssinian_1_as_wanted.png", img)
#    cv2.imshow("main", cv2.imread("Abyssinian_1.png"))
#    cv2.waitKey(0)

def generate_trimap():
    inputDirPath = "savannah/semantic_mask/"
    outputDirPath = "savannah/trimaps/"
    for fileName in os.listdir(inputDirPath):
        filePath = inputDirPath+fileName
        trimap = convert_rgb_semantic_mask_to_trimap_with_rect_smooth(inputDirPath+fileName)
        fileName = fileName.replace('.jpg', '.png')
        cv2.imwrite(outputDirPath+fileName, trimap)
        print("Done %s" %(fileName))


def generate_list_txt():
    inputDirPath = "savannah/semantic_mask/"
    file = open("list.txt", 'w')
    for fileName in os.listdir(inputDirPath):
        fileName = fileName.replace('.jpg', '')
        file.write(fileName + " 38 1 13\n")

    file.close()


def generate_test_n_trainval_txt():
    testFile = open("test.txt", 'w')
    trainvalFile = open("trinval.txt", 'w')
    randomNums = random.sample(range(1,201), 200)
    print(randomNums)
    for i in range(0, 200):
        num = randomNums[i]
        if i%2==0:
            testFile.write("Savannah_" + str(num) + " 38 1 13\n")
        else:
            trainvalFile.write("Savannah_" + str(num) + " 38 1 13\n")

    testFile.close()
    trainvalFile.close()
            




#generate_trimap()
#generate_list_txt()
#generate_test_n_trainval_txt()






