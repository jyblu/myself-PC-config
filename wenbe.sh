#!/bin/bash

# 文件列表的路径
file_list="txt"  # 请将此路径修改为你的实际文件路径

# 检查文件列表是否存在
if [[ ! -f "$file_list" ]]; then
    echo "文件列表 $file_list 不存在！"
    exit 1
fi

# 循环处理每个文件
while IFS= read -r file; do
    # 去除文件名两端的空格
    file=$(echo "$file" | xargs)

    # 检查文件是否存在
    if [[ -f "$file" ]]; then
        # 使用 sed 修改文件内容，不创建备份
        sed -i -e 's/utf[[:space:]]*-*[[:space:]]*8/utf-8/g' -e 's/20240524/20241008/g' "$file"
        echo "已修改文件: $file"
    else
        echo "文件 $file 不存在，跳过。"
    fi
done < "$file_list"

echo "所有文件处理完成。"
