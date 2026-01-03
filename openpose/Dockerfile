FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive 

# ビルドとランタイム依存を導入
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake git wget unzip \
    libopencv-dev libgoogle-glog-dev libgflags-dev \
    libprotobuf-dev protobuf-compiler libboost-all-dev libhdf5-dev \
    libleveldb-dev libsnappy-dev liblmdb-dev libopenblas-dev libatlas-base-dev \
    python3 python3-dev python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /openpose

# # リポジトリ全体をコンテキストからコピー（ローカル変更をそのまま使う）
# COPY . /openpose

# 公式リポジトリのclone
RUN cd / && git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git && cd /openpose

# 依存スクリプト（必要に応じて）を実行
RUN bash scripts/ubuntu/install_deps.sh

# ビルド
# 必要に応じて -DBUILD_PYTHON=ON と Python 依存（pip install numpy opencv-python 等）を追加すれば Python API も利用可能
RUN mkdir -p build && cd build && \
    cmake .. -DBUILD_EXAMPLES=ON -DBUILD_PYTHON=OFF -DGPU_MODE=CUDA -DUSE_CUDNN=ON && \
    make -j"$(nproc)"

# モデルを取得
# RUN bash models/getModels.sh

ENV PATH="/openpose/build/examples/openpose:${PATH}"
CMD ["bash"]