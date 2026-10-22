# 奔放游民

基于 [Jekyll](https://jekyllrb.com) + [GitHub Pages](https://pages.github.com) 的个人博客，无需任何第三方主题，开箱即用。

**功能**：文章列表 + 分页 · 归档 · 标签 · 关于页 · 亮/暗色主题切换 · 代码高亮 · RSS · SEO · Sitemap · 移动端适配

## 🚀 部署到 GitHub Pages

1. 在 GitHub 新建仓库，**仓库名必须是** `<你的用户名>.github.io`
2. 修改 `_config.yml` 中的 `title`、`author`、`github_username`、`url` 等信息
3. 推送代码：

   ```bash
   git init
   git add .
   git commit -m "init blog"
   git branch -M main
   git remote add origin https://github.com/<你的用户名>/<你的用户名>.github.io.git
   git push -u origin main
   ```

4. 打开仓库 **Settings → Pages**，Source 选择 `Deploy from a branch`，分支选 `main` / `(root)`
5. 约 1 分钟后访问 `https://<你的用户名>.github.io` 🎉

## ✍️ 写文章

在 `_posts/` 下新建 `YYYY-MM-DD-title.md`：

```markdown
---
title: 文章标题
date: 2026-10-21 12:00:00 +0800
tags: [标签1, 标签2]
description: 一句话摘要（可选）
---

正文内容……
```

push 后自动发布。图片放在 `assets/images/`。

## 💻 本地预览（可选）

需要先安装 [Ruby](https://rubyinstaller.org/)（Windows 选带 DevKit 的版本）：

```bash
gem install bundler
bundle install
bundle exec jekyll serve
```

浏览器打开 <http://localhost:4000>。

## 📁 目录结构

```
├── _config.yml          # 站点配置
├── _layouts/            # 页面模板（default / post / page）
├── _includes/           # 公共片段（header / footer）
├── _posts/              # 博客文章
├── assets/css/style.css # 样式
├── index.html           # 首页
├── archive.html         # 归档
├── tags.html            # 标签
├── about.md             # 关于
└── 404.html
```
