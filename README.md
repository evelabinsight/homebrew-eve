# homebrew-eve

`eve` 的 Homebrew tap 仓库。

## 安装

先添加 tap：

```bash
brew tap Wuhualiang123/eve
```

然后安装：

```bash
brew install eve
```

如果想显式指定 tap，也可以执行：

```bash
brew install Wuhualiang123/eve/eve
```

安装完成后确认：

```bash
eve --help
```

## 当前支持情况

- 当前仓库已发布 `macOS x86_64` 包
- `macOS arm64` 包暂未发布

如果在 Apple Silicon 机器上安装，当前 formula 会明确提示对应架构的包尚未发布。

## 仓库结构

- `Formula/eve.rb`: Homebrew Formula
- `dist/*.tar.gz`: 已发布的二进制压缩包
- `dist/*.sha256`: 对应压缩包的校验值

## 更新流程

1. 生成新的 `eve` 二进制包
2. 更新 `dist/` 下的压缩包和 `sha256`
3. 更新 `Formula/eve.rb`
4. 提交并推送到本仓库

## 说明

`eve` 项目的源码仓库不在这个 tap 仓库内。  
这个仓库只负责 Homebrew 安装分发。
