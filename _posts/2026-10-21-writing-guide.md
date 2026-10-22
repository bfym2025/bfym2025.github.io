---
title: 写作指南：如何发布新文章
date: 2026-10-21 12:00:00 +0800
tags: [教程, Jekyll]
description: 在 _posts 目录新建一个 Markdown 文件即可发布文章，这里演示常用语法。
---

## 新建文章

在 `_posts/` 目录下新建文件，文件名格式为 `YYYY-MM-DD-英文标题.md`，开头写上：

```yaml
---
title: 文章标题
date: 2026-10-21 12:00:00 +0800
tags: [标签1, 标签2]
description: 一句话摘要（可选）
---
```

提交并 push 到 GitHub，大约一分钟后就会自动发布。

## 代码高亮

```python
def fib(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a

print([fib(i) for i in range(10)])
```

```js
const greet = (name) => `Hello, ${name}!`;
console.log(greet("world"));
```

## 表格

| 语法 | 效果 |
| ---- | ---- |
| `**粗体**` | **粗体** |
| `*斜体*` | *斜体* |
| `~~删除线~~` | ~~删除线~~ |

## 任务列表

- [x] 搭建博客
- [ ] 写第三篇文章

## 图片

把图片放到 `assets/images/` 目录下，然后在文章中引用：

{% raw %}
```markdown
![图片描述]({{ '/assets/images/example.png' | relative_url }})
```
{% endraw %}
