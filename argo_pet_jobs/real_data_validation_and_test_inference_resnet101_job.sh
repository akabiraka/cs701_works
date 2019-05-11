#!/usr/bin/sh
#SBATCH --job-name=real_data_object_detection_train
#SBATCH --qos=csqos
#SBATCH --workdir=/home/akabir4/tensorflow-object-detection-api
#SBATCH --output=/scratch/akabir4/pet/real_data/output/inference-%N-%j.output
#SBATCH --error=/scratch/akabir4/pet/real_data/output/inference-%N-%j.error
#SBATCH --mail-user=<akabir4@gmu.edu>
#SBATCH --mail-type=BEGIN,END,FAIL

#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --mem=16G


###this is the first testing file. 
##python models/research/object_detection/builders/model_builder_test.py 
#
###This will create data into TFRecord format.
##python models/research/object_detection/dataset_tools/create_pet_tf_record.py \
##--label_map_path=models/research/object_detection/data/pet_label_map.pbtxt \
##--data_dir=models/research \
##--output_dir=/scratch/akabir4/pet_data_tfrecord \
##--num_shards=100
#
#
###Training job
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

MY_SCRATCH=/scratch/akabir4/pet
SPLIT=validation
echo ${MY_SCRATCH}
echo $(ls -1 ${MY_SCRATCH}/real_data/tfrecords/${SPLIT}/* | tr '\n' ',') \

##python -m ~/tensorflow-object-detection-api/models/research/object_detection/inference/infer_detections \
##--input_tfrecord_paths=$(ls -1 ${MY_SCRATCH}/real_data/tfrecords/${SPLIT}/* | tr '\n' ',') \
##--output_tfrecord_path=${MY_SCRATCH}/real_data/output/${SPLIT}_detections.tfrecord-00000-of-00001 \
##--inference_graph=${MY_SCRATCH}/real_data/output/exported_graphs/frozen_inference_graph.pb \
##--discard_image_pixels

SPLIT=test
python ~/tensorflow-object-detection-api/models/research/object_detection/inference/infer_detections.py \
--input_tfrecord_paths=$(ls -1 ${MY_SCRATCH}/real_data/tfrecords/${SPLIT}/* | tr '\n' ',') \
--output_tfrecord_path=${MY_SCRATCH}/real_data/output/${SPLIT}_detections.tfrecord-00000-of-00001 \
--inference_graph=${MY_SCRATCH}/real_data/output/exported_graphs/frozen_inference_graph.pb \
##--discard_image_pixels


##python ~/tensorflow-object-detection-api/models/research/object_detection/inference/infer_detections.py \
##--input_tfrecord_paths=$(ls -1 /scratch/akabir4/pet/real_data/tfrecords/validation/* | tr '\n' ',') \
##--output_tfrecord_path=/scratch/akabir4/pet/real_data/output/validation_detections.tfrecord-00000-of-00001 \
##--inference_graph=/scratch/akabir4/pet/real_data/output/exported_graphs/frozen_inference_graph.pb \
##--discard_image_pixels

