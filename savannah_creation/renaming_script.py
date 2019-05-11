import os 
  
# Function to rename multiple files 
def main(): 
    i = 1
      
    for filename in os.listdir("savannah"): 
        dst ="Savannah_" + str(i) + ".jpg"
        src ='savannah/'+ filename 
        dst ='savannah/'+ dst 
          
        # rename() function will 
        # rename all the files 
        os.rename(src, dst) 
        i += 1
  
# Driver Code 
if __name__ == '__main__': 
      
    # Calling main() function 
    main() 
