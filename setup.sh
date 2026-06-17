#!/usr/bin/env bash
# 新机器上 clone 后运行一次：从 _TEMPLATE 生成本地私有工作文件。
# 这些生成的文件已被 .gitignore，不会上传——你的真实内容只留在本地。
set -euo pipefail
cd "$(dirname "$0")"

copy_if_absent() {  # $1=模板 $2=目标
  if [ -e "$2" ]; then echo "  跳过（已存在）：$2"; else cp "$1" "$2"; echo "  生成：$2"; fi
}

echo "初始化本地私有文件…"
copy_if_absent reviews/_TEMPLATE/recurring.md      reviews/recurring.md
copy_if_absent style/_TEMPLATE/english-profile.md  style/english-profile.md
copy_if_absent style/_TEMPLATE/sharing-profile.md  style/sharing-profile.md

echo "✓ 完成。"
echo "  · 新建项目：cp -r projects/_TEMPLATE projects/<项目名>"
echo "  · 每日复盘文件由「复盘」skill 按 reviews/_TEMPLATE/daily.md 生成。"
