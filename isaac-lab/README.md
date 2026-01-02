# isaac-lab
事前準備：omniverseキー登録（下記参照）
https://docs.isaacsim.omniverse.nvidia.com/5.1.0/installation/install_container.html

初回のみ
```
xhost +local:
```
コンテナ起動
<!-- ```
docker run --name isaac-sim --entrypoint bash -it --gpus all --rm --network=host \
    -e "ACCEPT_EULA=Y" \
    -e "PRIVACY_CONSENT=Y" \
    -e DISPLAY=$DISPLAY \
    -v ~/docker/isaac-sim/cache/main:/isaac-sim/.cache:rw \
    -v ~/docker/isaac-sim/cache/computecache:/isaac-sim/.nv/ComputeCache:rw \
    -v ~/docker/isaac-sim/logs:/isaac-sim/.nvidia-omniverse/logs:rw \
    -v ~/docker/isaac-sim/config:/isaac-sim/.nvidia-omniverse/config:rw \
    -v ~/docker/isaac-sim/data:/isaac-sim/.local/share/ov/data:rw \
    -v ~/docker/isaac-sim/pkg:/isaac-sim/.local/share/ov/pkg:rw \
    -v /tmp/.X11-unix/:/tmp/.X11-unix:rw \
    -u 1234:1234 \
    nvcr.io/nvidia/isaac-sim:5.1.0
``` -->
```
docker compose up -d
```

isaac-sim起動
```
docker exec -it isaac-deploy bash
runapp
```

## 使用例

単体ナビゲーション（倉庫）
```
docker compose -f docker-compose-warehouse.yml up -d
```

複数台ナビゲーション（病院）
```
docker compose -f docker-compose-hospital.yml up -d
```

複数台ナビゲーション（オフィス）
```
docker compose -f docker-compose-office.yml up -d
```

glimを使用した3D-SLAM
```
docker compose -f docker-compose-glim.yml up -d
```