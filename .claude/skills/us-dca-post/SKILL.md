---
name: us-dca-post
description: 发布「美股十年定投」系列新一期文章。当用户给出新一期的文字内容（通常还有 00N-wechat.png / 00N-panel.png / 00N-trend.png 三张图）并要求写成 post 时使用。
---

# 美股十年定投 · 新一期发布流程

本系列每期结构固定：封面大图 + 用户原文 + 账户面板图 + 走势图。第 01 期是基准模板，见 `_posts/2026-11-08-us-dca-ten-year-issue-01.md`。

## 0. 先同步远端

按 `CLAUDE.md` 要求，开工前先 `git fetch`，若落后于 `origin/main` 先 `git pull`。

## 1. 识别用户给的图片

用户一般给三张图，按内容和文件名对应：

| 用户给的图 | 内容特征 | 存成 |
| --- | --- | --- |
| `00N-wechat.png` | 宽幅横图，左侧大字「美股十年定投」，右侧「本期定投 / 累计定投」 | `cover` |
| `00N-panel.png` | 竖图，纳指 / 伯克希尔 / SCHD 三张卡片 + 本期合计 | `account` |
| `00N-trend.png` | 竖图，带曲线和「近期走势」表格 | `trend` |

不确定就先 `Read` 图片确认，不要凭文件名硬猜。图片是用户自己生成的，直接复制，不要压缩或改尺寸。

## 2. 复制图片到 assets

命名沿用第 01 期的前缀，加上期号：

```
assets/images/us-dca-YYYY-MM-issue-NN-cover.png
assets/images/us-dca-YYYY-MM-issue-NN-account.png
assets/images/us-dca-YYYY-MM-issue-NN-trend.png
```

`NN` 补零（01、02…），`YYYY-MM` 取发布月份。复制前确认目标文件不存在，避免覆盖历史期数。

## 3. 新建 post

路径：`_posts/YYYY-MM-DD-us-dca-ten-year-issue-NN.md`，日期用发布当天（通常就是对话当天）。

Front matter 固定：

```yaml
---
title: 美股十年定投 · 第 NN 期
date: YYYY-MM-DD 11:00:00 +0800
tags: [美股十年定投]
---
```

**注意**：Jekyll 默认不发布未来日期的文章，`date` 不能晚于构建时间。如果当天构建时还没到 11:00，就改成比如 `08:00:00`。

## 4. 正文排版

顺序固定，和第 01 期一致：

1. 封面图（紧跟 front matter，前后各空一行）
2. 用户原文第一段（行情/投入概述）
3. 若原文是分资产点评的列表，原样保留列表
4. 账户面板图
5. 原文剩余段落（收益、下期打算）
6. 走势图（放文末）

图片语法统一：

```markdown
![alt]({{ '/assets/images/文件名.png' | relative_url }})
```

alt 文案约定：`美股十年定投 · 第 NN 期`（封面）、`第 NN 期账户月报`（面板）、`近一周走势` 或 `近一月走势`（走势图，按图里实际区间写）。

**原文照抄**：用户要求「直接粘贴原文」，不要改写、润色、补充数据或加分析。最多补一个句末标点。原文里的 emoji、口语化表达都保留。

## 5. 检查

- 三处图片路径与 `assets/images/` 里的实际文件名完全一致
- 期号、日期、标题前后一致
- 本地没有 `bundle`，无法跑 `jekyll build`，提醒用户用 `serve.bat` 目视确认

## 6. 提交

用户要求提交时，按 `CLAUDE.md`：`git add` → `git commit` → `git push`。提交信息沿用英文祈使句风格，例如 `Add US stock 10-year DCA issue 02 post`。

## 模板

```markdown
---
title: 美股十年定投 · 第 NN 期
date: YYYY-MM-DD 11:00:00 +0800
tags: [美股十年定投]
---

![美股十年定投 · 第 NN 期]({{ '/assets/images/us-dca-YYYY-MM-issue-NN-cover.png' | relative_url }})

<用户原文第一段>

- <分资产点评，如有>

![第 NN 期账户月报]({{ '/assets/images/us-dca-YYYY-MM-issue-NN-account.png' | relative_url }})

<用户原文剩余段落>

![近一周走势]({{ '/assets/images/us-dca-YYYY-MM-issue-NN-trend.png' | relative_url }})
```
