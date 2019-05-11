#!/usr/bin/sh
#SBATCH --job-name=with_additional_data_object_detection
#SBATCH --qos=csqos
#SBATCH --workdir=/home/akabir4/tensorflow-object-detection-api
#SBATCH --output=/scratch/akabir4/pet/with_additional_data/output/metric-evaluation-%N-%j.output
#SBATCH --error=/scratch/akabir4/pet/with_additional_data/output/metric-evaluation-%N-%j.error
#SBATCH --mail-user=<akabir4@gmu.edu>
#SBATCH --mail-type=BEGIN,END,FAIL

#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --mem=16G


##this is the first testing file. 
#python models/research/object_detection/builders/model_builder_test.py 

##This will create data into TFRecord format.
#python models/research/object_detection/dataset_tools/create_pet_tf_record.py \
#--label_map_path=models/research/object_detection/data/pet_label_map.pbtxt \
#--data_dir=models/research \
#--output_dir=/scratch/akabir4/pet_data_tfrecord \
#--num_shards=100


##Training job
##PIPELINE_CONFIG_PATH=/scratch/akabir4/pet/real_data/others/faster_rcnn_resnet101_pets.config
##MODEL_DIR=/scratch/akabir4/pet/real_data/output/models
##NUM_TRAIN_STEPS=50000
##SAMPLE_1_OF_N_EVAL_EXAMPLES=1
##
##python ~/tensorflow-object-detection-api/models/research/object_detection/model_main.py \
##--pipeline_config_path=${PIPELINE_CONFIG_PATH} \
##--model_dir=${MODEL_DIR} \
##--num_train_steps=${NUM_TRAIN_STEPS} \
##--sample_1_of_n_eval_examples=$SAMPLE_1_OF_N_EVAL_EXAMPLES \
##--alsologtostderr

##echo "label_map_path: 'others/pet_label_map.pbtxt' 
##tf_record_input_reader: { input_path: 'path/to/validation_detection_tfrecords-000-of-003' }
##" > evaluation_metics/validation_input_config.pbtxt
##
##echo "
##metrics_set: 'coco_detection_metrics'
##" > ${SPLIT}_eval_metrics/${SPLIT}_eval_config.pbtxt

## This will evaluate validation detections. Bellow two .pbtxt files are created by above echo commands (no need gpus for that)
## Validation evaluation metrics generator
##python ~/tensorflow-object-detection-api/models/research/object_detection/metrics/offline_eval_map_corloc.py \
##--eval_dir=/scratch/akabir4/pet/with_additional_data/evaluation_metics \
##--eval_config_path=/scratch/akabir4/pet/with_additional_data/evaluation_metics/validation_eval_config.pbtxt \
##--input_config_path=/scratch/akabir4/pet/with_additional_data/evaluation_metics/validation_input_config.pbtxt


## Test evaluation metrics generator
python ~/tensorflow-object-detection-api/models/research/object_detection/metrics/offline_eval_map_corloc.py \
--eval_dir=/scratch/akabir4/pet/with_additional_data/evaluation_metics \
--eval_config_path=/scratch/akabir4/pet/with_additional_data/evaluation_metics/test_eval_config.pbtxt \
--input_config_path=/scratch/akabir4/pet/with_additional_data/evaluation_metics/test_input_config.pbtxt



