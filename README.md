# homebrew-eve

`eve` 的 Homebrew tap 仓库。

`eve` 是 DeviceKing 设备的局域网控制 CLI 工具，用于在本机终端直接连接设备并执行调试、运维和检测任务。它支持查询设备版本、触发拍照、安装升级 APK、导出成片和日志，也支持把本机原图导入设备执行图片检测，并将检测结果拉回本机。

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

这个 formula 会安装 `eve` 主命令脚本和当前架构对应的 `eve-wifi` helper，安装后可直接运行 `eve`。

## 使用说明

查看内置帮助：

```bash
eve --help
```

首次使用先匹配设备并保存设备信息：

| 指令 | 说明 |
| --- | --- |
| `eve match <device-id>` | 自动匹配设备，并保存默认 DeviceId 和设备地址。 |

匹配成功后，默认 DeviceId 和设备地址会保存到本机配置中，日常调用不需要再传 `--host` 和 `--device-id`。如果需要手动覆盖设备地址，再执行：

| 指令 | 说明 |
| --- | --- |
| `eve config set-host <device-ip>` | 手动保存默认设备地址，用于覆盖 `match` 保存的地址。 |

常用设备命令：

| 指令 | 说明 |
| --- | --- |
| `eve version` | 获取设备版本号、主板信息和左右从板版本信息。 |
| `eve take_picture` | 触发设备拍照流程。 |
| `eve install /path/to/app.apk` | 上传本地 APK 并触发设备安装升级。 |
| `eve export_complete` | 拉取设备全部成片文件到本机 `~/Downloads/complete`。 |
| `eve log` | 拉取左右从机和中机日志到本机 `~/Downloads/logs`。 |

图片检测：

| 指令 | 说明 |
| --- | --- |
| `eve detect_image /path/to/ORIGINAL` | 检测单套原图，结果返回到输入路径同级的 `RERUN` 目录。 |
| `eve detect_images /path/to/cases` | 批量扫描多套原图，跳过资源不完整的目录，并输出检测成功和失败列表。 |

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
