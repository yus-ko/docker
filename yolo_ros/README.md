<!-- ```
git clone https://github.com/mgonzs13/yolo_ros.git
cd yolo_ros
docker build -t yolo_ros .
docker run -it --rm --gpus all yolo_ros
``` -->
```
xhost +local:
docker compose up -d --build
docker compose down
```