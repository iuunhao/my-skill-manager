# msm - My Skill Manager

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20Windows-green.svg)](https://github.com/iuunhao/my-skill-manager)

> 轻量级 CLI 工具，管理 AI Agent 技能，支持配置跨机器同步。

**msm** (My Skill Manager) 帮助您从 [skills.sh](https://skills.sh) 市场搜索、安装和管理 AI Agent 技能。将配置导出为单个 JSON 文件，即可跨机器同步。

## 特性

- **搜索** - 从 skills.sh 市场发现技能
- **安装** - 一键安装技能
- **导入/导出** - 便携配置，一个 JSON 文件搞定
- **自动同步** - 用户配置自动同步到 `~/.config/myskills/`
- **跨平台** - 支持 macOS、Linux、Windows (Git Bash/WSL)

## 安装

### 快速安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/iuunhao/my-skill-manager/main/install.sh | bash
```

安装脚本会：
- 下载 `msm` 到 `~/.local/bin/msm`
- 添加 `~/.local/bin` 到 PATH（如需要）
- 设置可执行权限

### 手动安装

```bash
# 下载到 ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/iuunhao/my-skill-manager/main/msm -o ~/.local/bin/msm
chmod +x ~/.local/bin/msm

# 添加到 PATH（二选一）
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc    # zsh 用户
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc   # bash 用户

# 重启终端或执行
source ~/.zshrc
```

### Git 克隆

```bash
git clone https://github.com/iuunhao/my-skill-manager.git
cd my-skill-manager
./msm --help
```

### 环境要求

- [Node.js](https://nodejs.org/) >= 18 (用于 npm/npx)
- bash / zsh / fish shell
- git

## 使用方法

```bash
# 搜索技能
msm search git
msm search "web scraping"

# 安装技能
msm add anthropics/skills@docx
msm add vercel-labs/agent-browser@agent-browser

# 列出已安装技能
msm list
msm ls

# 查看技能详情
msm info docx

# 更新技能
msm update           # 更新全部
msm update docx      # 更新指定

# 导出配置
msm export

# 导入配置（换机器后）
msm import
msm import my-skills.json

# 移除技能
msm remove docx

# 显示帮助
msm help
```

## 配置文件

| 文件 | 说明 |
|------|------|
| `skills.json` | 便携技能配置（导入/导出） |
| `~/.config/myskills/config.json` | 用户配置（自动同步） |
| `~/.agents/.skill-lock.json` | 已安装技能元数据 |
| `~/.agents/skills/` | 技能文件目录 |

## 技能分类

| 类型 | 说明 |
|------|------|
| `dev` | 开发工具和实用程序 |
| `productivity` | 效率工具和工作流 |
| `content` | 内容创建和处理 |
| `integration` | 第三方集成 |

## 工作流

### 跨机器共享技能

```bash
# 机器 A：导出技能
msm export

# 将 skills.json 复制到机器 B，然后：
msm import
```

### 备份和恢复

```bash
# 备份
msm export  # 生成 skills.json

# 恢复
msm import
```

## 项目结构

```
my-skill-manager/
├── msm              # 主 CLI 脚本
├── skills.json      # 示例技能配置
├── LICENSE          # MIT 许可证
├── README.md        # 英文说明
├── README_zh-CN.md  # 中文说明
└── CONTRIBUTING.md  # 贡献指南
```

## 贡献

欢迎贡献！请阅读 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详情。

## 相关项目

- [skills.sh](https://skills.sh) - 技能市场
- [Claude Code](https://claude.ai/code) - AI 编程助手
- [Anthropic Skills](https://github.com/anthropics/skills) - 官方技能

## 许可证

MIT License - 详见 [LICENSE](LICENSE)
