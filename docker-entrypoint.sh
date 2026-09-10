#!/bin/sh
set -e

# MAGS 会在 /tmp 中执行固定启动命令。
# 将应用复制到当前工作目录，再执行 node index.js。
cp /app/index.js /tmp/index.js
cp /app/index.html /tmp/index.html
cp /app/package.json /tmp/package.json

if [ -d /app/node_modules ]; then
  cp -R /app/node_modules /tmp/node_modules
fi

# 自动重启循环：node 进程退出后等 3 秒重启
while true; do
  "$@" || true
  echo "[mags] App exited, restarting in 3s..."
  sleep 3
done
