#!/bin/bash
# Hexo 博客运行脚本

export PATH="/home/lianyi/soft/nodejs/bin:$PATH"

case "$1" in
    server|s)
        echo "启动本地服务器..."
        node -e "
const Hexo = require('hexo');
const hexo = new Hexo(process.cwd(), { _: ['server'] });
hexo.env.init = true;
hexo.init().then(() => hexo.call('server', {}));
"
        ;;
    generate|g|build)
        echo "生成静态文件..."
        rm -rf public
        node -e "
const Hexo = require('hexo');
const hexo = new Hexo(process.cwd(), { _: ['generate'] });
hexo.env.init = true;
hexo.init().then(() => hexo.call('generate', {})).then(() => console.log('生成完成！'));
"
        ;;
    deploy|d)
        echo "部署到 GitHub Pages..."
        node -e "
const Hexo = require('hexo');
const hexo = new Hexo(process.cwd(), { _: ['deploy'] });
hexo.env.init = true;
hexo.init().then(() => hexo.call('deploy', {}));
"
        ;;
    clean)
        echo "清除缓存..."
        rm -rf public db.json
        echo "清除完成！"
        ;;
    new|n)
        if [ -z "$2" ]; then
            echo "用法: $0 new <文章标题>"
            exit 1
        fi
        echo "创建新文章: $2"
        node -e "
const Hexo = require('hexo');
const hexo = new Hexo(process.cwd(), { _: ['new'] });
hexo.env.init = true;
hexo.init().then(() => hexo.call('new', { _: ['$2'] }));
"
        ;;
    *)
        echo "Hexo 博客管理脚本"
        echo ""
        echo "用法: $0 <命令> [参数]"
        echo ""
        echo "命令:"
        echo "  server, s     启动本地服务器预览"
        echo "  generate, g   生成静态文件"
        echo "  build         同 generate"
        echo "  deploy, d     部署到 GitHub Pages"
        echo "  clean         清除缓存和生成的文件"
        echo "  new, n        创建新文章 (需要标题参数)"
        echo ""
        echo "示例:"
        echo "  $0 server          # 启动预览服务器"
        echo "  $0 generate        # 生成静态文件"
        echo "  $0 new '我的文章'   # 创建新文章"
        ;;
esac
