clf;
pet_labels = {'german_shorthaired', 'Abyssinian', 'american_bulldog', 'american_pit_bull_terrier', 'basset_hound', 'beagle', 'Bengal', 'Birman', 'boxer', 'British_Shorthair', 'chihuahua', 'Egyptian_Mau', 'english_cocker_spaniel', 'english_setter', 'Bombay', 'great_pyrenees', 'havanese', 'japanese_chin', 'keeshond', 'leonberger', 'Maine_Coon', 'miniature_pinscher', 'newfoundland', 'Persian', 'pomeranian', 'pug', 'Ragdoll', 'Russian_Blue', 'saint_bernard', 'samoyed', 'scottish_terrier', 'shiba_inu', 'Siamese', 'Sphynx', 'staffordshire_bull_terrier', 'wheaten_terrier', 'yorkshire_terrier', 'Savannah'};
inference_matrix = [18 2; 17 3; 20 0; 15 5; 19 1; 15 5; 14 6; 17 3; 17 3; 16 4;
                    15 5; 17 3; 15 5; 15 5; 17 3; 15 5; 18 2; 17 3;
                    16 4; 20 0; 13 7; 16 4; 17 3;  19 1; 19 1; 18 2;
                    16 4; 18 2; 17 3; 18 2; 17 3; 17 3; 19 1; 19 1; 18 2; 
                    16 4; 19 1; 18 2];
                    
h = bar (inference_matrix);
set (gca, 'xticklabel', pet_labels) ;
set (h(1), "facecolor", "g");
set (h(2), "facecolor", "r");
legend ({"Correct Predictions", "Incorrect Predictions"}, "location", "eastoutside");
xlabel("Categories");
ylabel("Number of Images");
title ("Inference Graph");

x = [];
correct_outputs = [];
incorrect_outputs = [];
for i = [1:37]
  x(end+1) = i;
  correct_outputs(end+1) = inference_matrix(i,1);
  incorrect_outputs(end+1) = inference_matrix(i,2);
endfor
figure, plot(x, correct_outputs, 'o-g');
hold on
plot(x, incorrect_outputs, 'o-r');
legend ({"Correct Predictions", "Incorrect Predictions"}, "location", "eastoutside");
set (gca, 'xticklabel', pet_labels) 
gca
xlabel("Categories");
ylabel("Number of Images");
title ("Inference Graph");


"{'german_shorthaired': 16, 'Abyssinian': 17, 'american_bulldog': 20, 'american_pit_bull_terrier': 15, \
'basset_hound': 19, 'beagle': 15, 'Bengal': 14, 'Birman': 17, 'boxer': 17, 'British_Shorthair': 16, \
'chihuahua': 15, 'Egyptian_Mau': 17, 'english_cocker_spaniel': 15, 'english_setter': 15, 'Bombay': 17, \
'great_pyrenees': 15, 'havanese': 18, 'japanese_chin': 17, 'keeshond': 16, 'leonberger': 20, 'Maine_Coon': 13, \
'miniature_pinscher': 16, 'newfoundland': 17, 'Persian': 19, 'pomeranian': 19, 'pug': 18, 'Ragdoll': 16, \
'Russian_Blue': 18, 'saint_bernard': 17, 'samoyed': 18, 'scottish_terrier': 17, 'shiba_inu': 17, 'Siamese': 19, \
'Sphynx': 19, 'staffordshire_bull_terrier': 18, 'wheaten_terrier': 16, 'yorkshire_terrier': 19}";

