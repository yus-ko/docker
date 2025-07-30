```
cd
git clone https://github.com/user/docker.git
cd ~/docker/ros2/humble
docker build -t ros2-humble .
```
イメージビルド（イメージ名：ros2-humble）

```
docker run -it -d -p 8080:8080 -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -e HOST_USER=$USER -e DISPLAY=$DISPLAY -e WAYLAND_DISPLAY -e XDG_RUNTIME_DIR -e PULSE_SERVER -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg -v $HOME:$HOME -w $HOME --name ros2-humble_0 ros2-humble bash
```
コンテナ作成（コンテナ名：ros2-humble_0）これは初回のみ

```
docker exec -it -u $USER -e TERM=xterm-256color ros2-humble_0 bash
```
コンテナに入る

```
docker start ros2-humble_0
```
2回目以降はコンテナ起動
