#FROM pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel
FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-devel

RUN apt-get update
RUN apt-get -y install python3-pip
RUN apt-get -y install wget

RUN pip install --upgrade pip  # enable PEP 660 support

# Use Conda? 
#RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#RUN bash Miniconda3-latest-Linux-x86_64.sh -b
#RUN /root/miniconda3/bin/conda install -c nvidia cuda-toolkit -y

# Doesn't work, seems to take 1.5h and then crashes with unknown subprocess error:
COPY pyproject.toml .
RUN MAKEFLAGS="-j$(nproc)" pip install -vvv -e .

ENV TORCH_CUDA_ARCH_LIST=8.6
COPY awq /awq
WORKDIR /awq/kernels
RUN python3 setup.py install

RUN apt-get install -y git

WORKDIR /
COPY VILA /VILA
WORKDIR /VILA
RUN pip install -e .

#RUN git clone https://huggingface.co/datasets/mit-han-lab/awq-model-zoo awq_cache

RUN pip install git+https://github.com/suno-ai/bark.git
RUN apt-get install -y alsa-utils

WORKDIR /code
