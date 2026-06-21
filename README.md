# 个人博客

基于 Hexo + Replica 主题的静态博客，GitHub 风格设计，支持标签、分类和归档。

## 快速开始

### 1. 安装依赖

```bash
npm install
```

### 2. 添加文章

#### 方法一：直接放入 Markdown 文件（推荐）

将你的 `.md` 文件放入 `source/_posts/` 目录即可。

如果 Markdown 文件没有 Front-matter（文章元数据），可以使用脚本自动添加：

```bash
./tools/import-posts.sh <你的markdown文件目录>
```

#### 方法二：使用命令创建

```bash
./run.sh new "文章标题"
```

然后在 `source/_posts/文章标题.md` 中编辑内容。

### 3. 本地预览

```bash
./run.sh server
```

访问 http://localhost:4000 查看博客。

或使用 npm：

```bash
npm run server
```

### 4. 生成静态文件

```bash
./run.sh generate
```

或使用 npm：

```bash
npm run build
```

生成的文件在 `public/` 目录，可以直接部署到任何静态网站托管服务。

### 5. 部署到 GitHub Pages

首先编辑 `_config.yml`，修改 deploy 配置：

```yaml
deploy:
  type: git
  repo: https://github.com/你的用户名/你的仓库名.git
  branch: gh-pages
```

然后部署：

```bash
./run.sh deploy
```

## 项目结构

```
.
├── _config.yml          # 博客配置文件
├── source/              # 源文件目录
│   ├── _posts/          # 文章目录（放置你的 .md 文件）
│   └── ...
├── themes/              # 主题目录（Replica - GitHub 风格）
├── tools/               # 工具脚本
│   └── import-posts.sh  # 批量导入文章脚本
├── run.sh               # 博客管理脚本
└── public/              # 生成的静态文件（已加入 .gitignore）
```

## 文章格式

每篇文章需要在顶部添加 Front-matter（元数据）：

```yaml
---
title: 文章标题
date: 2026-06-20 10:00:00
tags:
  - 标签1
  - 标签2
categories:
  - 分类1
---

文章内容支持标准 Markdown 语法...
```

## 常用命令

| 命令 | 说明 |
|------|------|
| `./run.sh` | 显示帮助信息 |
| `./run.sh server` | 启动本地服务器预览 |
| `./run.sh generate` | 生成静态文件 |
| `./run.sh deploy` | 部署到 GitHub Pages |
| `./run.sh clean` | 清除缓存和生成的文件 |
| `./run.sh new "标题"` | 创建新文章 |

也可以使用 npm 命令：`npm run build`、`npm run server`、`npm run deploy`

## GitHub Pages 设置步骤

1. 在 GitHub 创建一个新的仓库（例如 `myblog`）
2. 在仓库的 Settings -> Pages 中，Source 选择 "Deploy from a branch"，Branch 选择 `gh-pages`
3. 编辑 `_config.yml` 中的 URL 配置：
   ```yaml
   url: https://你的用户名.github.io/你的仓库名
   ```
4. 运行 `./run.sh generate` 生成静态文件
5. 运行 `./run.sh deploy` 部署到 GitHub

## 功能特性

- **GitHub 风格主题**：Replica 主题复刻 GitHub 经典界面设计
- **标签和分类**：支持为文章添加多个标签和分类
- **归档页面**：按时间归档所有文章
- **代码高亮**：支持多种编程语言的语法高亮
- **RSS 订阅**：自动生成 RSS feed

## 自定义配置

编辑 `_config.yml` 可以修改：
- 博客标题、副标题、描述
- 作者信息
- 每页显示文章数
- URL 格式
- 时区和语言

Replica 主题的详细配置见 [Replica GitHub 仓库](https://github.com/sabrinaluo/hexo-theme-replica)
