# Community

[![Build Status](https://github-ci.bluerain.io/api/badges/elixirchina/community/status.svg)](https://github-ci.bluerain.io/elixirchina/community)
[![GitHub issues](https://img.shields.io/github/issues/elixirchina/community)](https://github.com/elixirchina/community/issues)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)

基于 Phoenix LiveView 的论坛程序。

## 获取并安装依赖
* running mix deps.get
* running mix deps.compile
* running cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development

## 启动运行
$ mix phx.server

## 代码贡献
* 请首先查阅TODO列表
* 发现BUG请提issue
* 请保证新增的代码都有测试
* 如有问题请随时在论坛或者qq群(912763380)联系

## TODO
* [ ] 用户相关
  * [ ] 用户注册
  * [x] 用户登录
  * [ ] 用户退出登录
  * [ ] 找回密码
  * [ ] 邮箱验证
  * [x] github登录
  * [ ] 个人主页
  * [ ] 个人资料修改
  * [ ] 修改密码
  * [ ] 用户关注
* [ ] 帖子相关
  * [x] 发帖
  * [ ] 可以在帖子中@用户
  * [x] 编辑帖子
  * [ ] 关闭帖子(帖子关闭之后不再接受任何回复，允许再次打开)
  * [ ] 关注帖子(关注后会对用户推送帖子动态)
  * [ ] 收藏帖子(帖子出现在个人主页的收藏面板中)
  * [ ] 点赞帖子(奖励积分)
  * [ ] 置顶帖子
* [ ] 帖子评论相关
  * [ ] 创建评论(不可编辑)
  * [ ] 删除评论
  * [ ] 点赞评论(奖励积分，并高亮优秀评论)
  * [ ] 回复评论(@功能)
* [ ] 通知系统(接受 用户关注、关注的用户发帖和评论、关注的帖子有回帖、发布的帖子被置顶、被其他用户@ 等消息)
  * [ ] 通知阅读
  * [ ] 通知单条删除和全部删除
* [ ] 招聘相关
  * [ ] 发贴
* [ ] Wiki相关
  * [ ] 创建Wiki
* [ ] 后台系统
  * [ ] 管理用户
  * [ ] 管理帖子
  * [ ] 管理评论
* [ ] GraphQL接口
* [ ] Build & CI
  * [ ] Travis
  * [x] Docker




