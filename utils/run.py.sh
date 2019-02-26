#!/bin/bash
CUDA_DEV=
CUR_UID=
CUR_GID=$(id -g)
while getopts "d:" opt; do
    case "$opt" in
        d)
            CUDA_DEV="NVIDIA_VISIBLE_DEVICES=$OPTARG"
            #CUDA_DEV="CUDA_VISIBLE_DEVICES=$OPTARG"
            ;;
    esac
done
# オプション部分を切り捨てる。
shift `expr $OPTIND - 1`

CUR_DIR=$(pwd)

sudo docker run -u $(id -u):$(id -g) --runtime=nvidia -e $CUDA_DEV -it --rm -v $CUR_DIR:$CUR_DIR tf-gpu-py3-r-keras:1.0 sh -c "cd $CUR_DIR && python3 $*"
