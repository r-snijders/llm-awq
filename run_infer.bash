#!/usr/bin/env bash

export PYTHONPATH=.
#python3 tinychat/vlm_demo_new.py \
#    --model-path VILA1.5-13b-AWQ \
#    --quant-path VILA1.5-13b-AWQ/llm/vila-1.5-13b-w4-g128-awq-v2.pt \
#    --precision W4A16 \
#    --image-file /PATH/TO/INPUT/IMAGE \
#    --vis-image #Optional

#python3 tinychat/vlm_demo_new.py \
#    --model-path VILA1.5-3b-AWQ \
#    --quant-path VILA1.5-3b-AWQ/llm/vila-1.5-3b-w4-g128-awq-v2.pt \
#    --precision W4A16 \
#    --image-file christof_with_beer.jpg \
#    --vis-image #Optional

#python3 tinychat/vlm_demo_new.py \
#    --help

python3 tinychat/vlm_demo_new_2.py \
    --model-path VILA1.5-3b-AWQ \
    --quant-path VILA1.5-3b-AWQ/llm/vila-1.5-3b-w4-g128-awq-v2.pt \
    --precision W4A16 \
    --image-file web-cam-shot.jpg \
    --single_round \
    --vis-image #Optional
