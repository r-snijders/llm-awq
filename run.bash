#!/usr/bin/env bash

docker run \
    --gpus all \
    --rm \
    -ti \
    -v $PWD:/code \
    -v $PWD/../huggingface:/root/.cache/huggingface \
    -v $PWD/../suno:/root/.cache/suno \
    --privileged=true \
    --device /dev/snd \
    vila-awq
    bash

#    -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
#    -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native \
#    -v ~/.config/pulse/cookie:/root/.config/pulse/cookie \
#    --group-add $(getent group audio | cut -d: -f3) \

