```
cd
git clone https://github.com/user/docker.git
cd ~/docker/ubuntu/22
docker build -t ubuntu22.04 .
```
イメージビルド（イメージ名：ubuntu22.04）

```
docker run -it -d -p 8080:8080 -e HOST_UID=$(id -u) -e HOST_GID=$(id -g) -e HOST_USER=$USER -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:$HOME -w $HOME --name ubuntu22.04_0 ubuntu22.04 bash
```
コンテナ作成（コンテナ名：ubuntu22.04_0）これは初回のみ

```
docker exec -it -u $USER -e TERM=xterm-256color ubuntu22.04_0 bash
```
コンテナに入る

```
docker start ubuntu22.04_0
```
2回目以降はコンテナ起動
