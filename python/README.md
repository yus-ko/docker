```
cd
git clone https://github.com/user/docker.git
cd ~/docker/python/
docker build -t python3 .
```
イメージビルド（イメージ名：python3）

```
docker run -it -d -p 8090:8080 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:$HOME -w $HOME --name python3_0 python3 bash
```
コンテナ作成（コンテナ名：python3_0）これは初回のみ

```
docker exec -it -e TERM=xterm-256color python3_0 bash
```
コンテナに入る

```
docker start python3_0
```
2回目以降はコンテナ起動
