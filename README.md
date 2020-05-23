# Zealot

[![GitHub release](https://img.shields.io/github/v/release/getzealot/zealot?include_prereleases)](https://github.com/getzealot/zealot/blob/develop/CHANGELOG.md)
[![Docker Pulls](https://img.shields.io/docker/pulls/icyleafcn/zealot.svg)](https://hub.docker.com/r/icyleafcn/zealot/)
[![Maintainability](https://codeclimate.com/github/getzealot/zealot/badges/gpa.svg)](https://codeclimate.com/github/getzealot/zealot)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/bcff7d9de5ba48528bc80aa01bd525c6)](https://www.codacy.com/manual/icyleaf/zealot)
[![License](https://img.shields.io/github/license/getzealot/zealot)](LICENSE)

移动应用上传竟然如此简单、解放开发打包的烦恼，轻松放权给测试、产品、运营等使用 App 的人员，提供丰富组件库，打包流程一键上传，iOS 和 Android 轻松接入，深度与 Jenkins 和 Gitlab 集成。

## 特性

- [x] 支持 iOS 和 Android 应用的上传和下载
- [x] 支持应用创建各种类型（Debug、AdHoc、Release）和渠道（小米、华为、Oppp、Vivo、应用宝等）
- [x] 支持 iOS dSYM 和 Android Progruard 文件的备份管理和解析
- [x] 支持单次上传解析 iOS 和 Android 包信息
- [x] 支持自定义网络（WebHooks）数据来实时发送给通知服务（钉钉、企业微信、Slack 等）
- [x] 支持获取 iOS 设备 UDID
- [x] 支持丰富的 REST APIs
- [x] 支持 OAuth 认证登录（目前以接入 Google，LDAP）
- [x] 提供检查新版本和安装服务的 iOS 和 Android 组件
- [x] 提供 fastlane 插件 [zealot](https://github.com/getzealot/fastlane-plugin-zealot) 提供上传服务
- [x] 可接入 Gitlab 服务直接挂钩源码管理
- [ ] 可接入 Jenkins 服务实现远程构建
- [ ] 支持 GraphGL 接口（进行中）
- [ ] 提供 cli 命令行工具（旧插件需要移植即可但貌似没有啥必要，有用没用先列在这）

## 最新版本

- [x] 测试版本 - develop - `icyleafcn/zealot:nightly` - 基于 develop 分支每次提交构建的版本
- [ ] 稳定版本 - v4.0.0 - `icyleafcn/zealot:latest` - 还在研发测试中，尚未发布。

## 演示

- 演示地址：https://tryzealot.herokuapp.com/
- 电子邮箱: `admin@zealot.com`
- 登录密码：`ze@l0t`

> **注意**: 演示服务的数据每日都会重新初始化，请勿上传重要数据！

## 快速上手

```
$ git clone https://github.com/getzealot/zealot-docker.git
$ cd zealot-docker
$ ./deploy
```

## 安装部署

- [Docker](https://zealot.ews.im/#/deployment)
- [源码](https://zealot.ews.im/#/development)

## 帮助和文档

对 Zealot 感兴趣，看看文档了解下

https://zealot.ews.im

对 Zealot 有疑问或者建议，发个问题告知下

https://github.com/getzealot/zealot/issues/new


[fastlan-plugin-link]: https://github.com/getzealot/fastlane-plugin-zealot
[ios-sdk-link]: https://github.com/getzealot/zealot-ios
[android-sdk-link]: https://github.com/getzealot/zealot-android