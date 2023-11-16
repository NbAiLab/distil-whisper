#!/usr/bin/env bash

python run_distillation.py \
  --model_name_or_path "distil-whisper/tiny-random-whisper-2-1" \
  --teacher_model_name_or_path "distil-whisper/tiny-random-whisper" \
  --train_dataset_name "distil-whisper/librispeech_asr+distil-whisper/librispeech_asr-timestamped" \
  --train_dataset_config_name "all+all" \
  --train_dataset_samples "100+360" \
  --train_split_name "train.clean.100+train.clean.360" \
  --eval_dataset_name "distil-whisper/gigaspeech-l+esb/diagnostic-dataset" \
  --eval_dataset_config_name "l+librispeech" \
  --eval_split_name "validation+clean" \
  --eval_text_column_name "text+ortho_transcript" \
  --max_train_samples 1024 \
  --max_eval_samples 32 \
  --cache_dir "/home/sanchitgandhi/.cache" \
  --dataset_cache_dir "/home/sanchitgandhi/.cache" \
  --wandb_dir "/home/sanchitgandhi/.cache" \
  --output_dir "./" \
  --do_train \
  --do_eval \
  --per_device_train_batch_size 2 \
  --per_device_eval_batch_size 2 \
  --max_steps 10 \
  --eval_steps 5 \
  --dataloader_num_workers 14 \
  --save_steps 5 \
  --wer_threshold 10 \
  --wandb_project "distil-whisper-debug" \
  --logging_steps 1 \
  --use_scan \
  --gradient_checkpointing \
  --overwrite_output_dir \
  --predict_with_generate \
  --return_timestamps \
  --timestamp_probability 1 \
  --freeze_encoder