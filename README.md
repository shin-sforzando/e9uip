# e9uip

[![ci](https://github.com/shin-sforzando/e9uip/workflows/ci/badge.svg)](https://github.com/shin-sforzando/e9uip/actions?query=workflow:ci)
[![Bump Version](https://github.com/shin-sforzando/e9uip/workflows/Bump%20Version/badge.svg)](https://github.com/shin-sforzando/e9uip/actions?query=workflow:%22Bump+Version%22)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

|![Screenshot 1](https://placehold.jp/32/3d4070/ffffff/720x480.png?text=Screenshot%201)|![Screenshot 2](https://placehold.jp/32/703d40/ffffff/720x480.png?text=Screenshot%202)|
|:---:|:---:|
|Screenshot 1|Screenshot 2|

Office Equipment Management System.

- [Prerequisites](#prerequisites)
- [How to](#how-to)
  - [Help](#help)
  - [Setup](#setup)
  - [Develop](#develop)
  - [Run](#run)
  - [Lint](#lint)
  - [Test](#test)
  - [Deploy](#deploy)
  - [Document](#document)
    - [CHANGELOG.md](#changelogmd)
- [Misc](#misc)
  - [Git](#git)
    - [Commitizen](#commitizen)
    - [Semantic Pull Request](#semantic-pull-request)
  - [LICENSE](#license)
  - [Contributors](#contributors)

## Prerequisites

- Docker (Version `20.10.2` or higher)
  - docker-compose (Version `1.27.4` or higher)
- [Nuxt-Edge](https://www.npmjs.com/package/nuxt-edge)

## How to

### Help

```shell
$ make help
ps                   監視
up                   起動
renew                更新
open                 閲覧
shell                接続
logs                 記録
build                構築
start                開始
lint                 監査
test                 試験
generate             生成
deploy               配備
down                 停止
clean                掃除
prune                破滅
help                 助言
```

### Setup

```shell
make up
```

### Develop

You can also enter the container with the following command.

```shell
make shell
```

### Run

```shell
make start
```

### Lint

```shell
make lint
```

### Test

```shell
make test
```

### Deploy

```shell
make deploy
```

### Document

```shell
(T. B. D.)
```

#### CHANGELOG.md

```shell
cz changelog
```

## Misc

### Git

#### Commitizen

This repository is [Commitizen](https://commitizen.github.io/cz-cli/) friendly.
Use the following command to commit.

```shell
cz c
```

#### Semantic Pull Request

(T. B. D.)

### LICENSE

See [LICENSE](LICENSE).

### Contributors

- [Shin'ichiro Suzuki](https://github.com/shin-sforzando)
