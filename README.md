# homebrew-eve

`eve` 的 Homebrew tap 仓库。

## 安装

先添加 tap：

```bash
brew tap evelabinsight/eve
```

然后安装：

```bash
brew install eve
```

如果想显式指定 tap，也可以执行：

```bash
brew install evelabinsight/eve/eve
```

安装完成后确认：

```bash
eve --help
```

这个 formula 会自动安装 `python@3.11`，`eve` 主命令以 Python 脚本方式运行，常用命令的启动速度会比之前的冻结二进制版本更快。

## 当前支持情况

- 当前仓库已发布 `macOS x86_64` 包
- 当前仓库已发布 `macOS arm64` 包

Intel Mac 和 Apple Silicon Mac 都可以直接通过当前 formula 安装。

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
