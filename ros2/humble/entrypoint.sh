#!/bin/bash
set -e

USER_ID=${HOST_UID:-1000}
GROUP_ID=${HOST_GID:-1000}
USERNAME=${HOST_USER:-hostuser}  # ホストのユーザー名を使用、なければデフォルト

# グループ作成（存在しなければ）
if ! getent group $GROUP_ID >/dev/null; then
    groupadd -g $GROUP_ID $USERNAME
fi

# ユーザー作成（存在しなければ）
if ! id -u $USERNAME >/dev/null 2>&1; then
    useradd -m -u $USER_ID -g $GROUP_ID -s /bin/bash $USERNAME
    passwd -d $USERNAME
    usermod -aG sudo $USERNAME  # ★ sudo 権限を付与
fi

# $@ が空なら bash を実行（docker exec 時に便利）
if [ $# -eq 0 ]; then
    exec su - $USERNAME
else
    exec su - $USERNAME -c "$@"
fi

