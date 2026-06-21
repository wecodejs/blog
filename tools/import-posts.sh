#!/bin/bash
# 批量导入 Markdown 文件到 Hexo 博客
# 用法: ./scripts/import-posts.sh <markdown文件目录>

POSTS_DIR="./source/_posts"

if [ -z "$1" ]; then
    echo "用法: $0 <markdown文件目录>"
    echo "例如: $0 ~/my-markdown-files"
    exit 1
fi

INPUT_DIR="$1"

if [ ! -d "$INPUT_DIR" ]; then
    echo "错误: 目录 '$INPUT_DIR' 不存在"
    exit 1
fi

# 创建 posts 目录（如果不存在）
mkdir -p "$POSTS_DIR"

# 复制所有 .md 文件
count=0
for file in "$INPUT_DIR"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        # 检查文件是否已有 Front-matter
        if head -1 "$file" | grep -q "^---$"; then
            cp "$file" "$POSTS_DIR/"
            echo "已复制（含Front-matter）: $filename"
        else
            # 添加默认 Front-matter
            title="${filename%.md}"
            {
                echo "---"
                echo "title: $title"
                echo "date: $(date '+%Y-%m-%d %H:%M:%S')"
                echo "tags:"
                echo "categories:"
                echo "---"
                echo ""
                cat "$file"
            } > "$POSTS_DIR/$filename"
            echo "已复制（添加Front-matter）: $filename"
        fi
        count=$((count + 1))
    fi
done

echo ""
echo "完成！共导入 $count 篇文章"
echo "运行 'hexo generate' 生成静态文件"
echo "运行 'hexo deploy' 部署到 GitHub Pages"
