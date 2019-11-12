# Community

[![Build Status](https://github-ci.bluerain.io/api/badges/elixirchina/community/status.svg)](https://github-ci.bluerain.io/elixirchina/community)
[![GitHub issues](https://img.shields.io/github/issues/elixirchina/community)](https://github.com/elixirchina/community/issues)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)

基于 Phoenix LiveView 的论坛程序。

## 获取并安装依赖

- running `mix deps.get`
- running `npm install --prefix ./assets`

## 启动运行

running `mix phx.server`

## 代码贡献

- 请首先查阅 TODO 列表
- 发现 BUG 请提 issue
- 请保证新增的代码都有测试
- 如有问题请随时在论坛或者 qq 群(912763380)联系

## TODO

- [ ] 用户相关
  - [ ] 用户注册
  - [ ] 用户登录
    - [ ] 手动注册
    - [ ] 快捷登录
      - [ ] GitHub
  - [ ] 退出登录
  - [ ] 找回密码
  - [ ] 邮箱验证
  - [ ] 个人主页
    - [ ] 资料修改
    - [ ] 密码修改
  - [ ] 关注用户
- [ ] 帖子相关
  - [ ] 发表帖子
  - [ ] 提及(@)用户
  - [ ] 编辑帖子
  - [ ] 评论权限(默认不限制，可选：不可回复、允许关注者回复)
  - [ ] 采纳评论(用于求助类型的帖子采纳正确答案)
  - [ ] 关注帖子(关注后会对用户推送帖子动态)
  - [ ] 收藏帖子(帖子出现在个人主页的收藏面板中)
  - [ ] 点赞帖子(奖励积分)
- [ ] 评论相关
  - [ ] 发表评论
  - [ ] 编辑评论
  - [ ] 删除评论
  - [ ] 点赞评论(奖励积分，并高亮优秀评论)
  - [ ] 回复评论(自动提及目标用户)
- [ ] 通知系统
  - [ ] 被关注
  - [ ] 关注的用户发贴
  - [ ] 关注的帖子更新
  - [ ] 发布的帖子被置顶
  - [ ] 被提及(包括被评论被回复)
  - [ ] 阅读通知
  - [ ] 通知的单已读和全部已读
- [ ] 招聘相关
  - [ ] 自动发送至指定的招聘分类
  - [ ] 招聘分类下的文章列表增加城市列表过滤功能
- [ ] 后台系统
  - [ ] 管理用户
    - [ ] 禁言(指定时间或永久)
  - [ ] 管理帖子
    - [ ] 置顶(可选择指定分类或全站置顶)
    - [ ] 取消置顶
    - [ ] 修改可见性(默认：不限制。可选：登录可见或不可见。不可见等同于逻辑删除)
    - [ ] 修改分类
    - [ ] 修改话题列表
  - [ ] 管理评论
    - [ ] 修改可见性(默认：不限制。可选：被折叠，已删除。折叠后的评论需要在前台手动展开才能阅读内容，已删除等同于逻辑删除)
- [x] CI/CD
  - [x] Drone
  - [x] Docker
