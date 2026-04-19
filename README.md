# msm - My Skill Manager

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-blue.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20Windows-green.svg)](https://github.com/iuunhao/my-skill-manager)

> A lightweight CLI to manage AI agent skills with portable configuration.

**msm** (My Skill Manager) helps you search, install, and manage AI agent skills from [skills.sh](https://skills.sh) marketplace. Export your setup to a single JSON file and sync it across machines.

## Features

- **Search** - Discover skills from skills.sh marketplace
- **Install** - One-command skill installation
- **Export/Import** - Portable configuration, share with one JSON file
- **Auto-sync** - User config automatically synced to `~/.config/myskills/`
- **Cross-platform** - Works on macOS, Linux, and Windows (via Git Bash/WSL)

## Install

### Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/iuunhao/my-skill-manager/main/install.sh | bash
```

This will:
- Download `msm` to `~/.local/bin/msm`
- Add `~/.local/bin` to your PATH (if needed)
- Make it executable

### Manual Install

```bash
# Download to ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/iuunhao/my-skill-manager/main/msm -o ~/.local/bin/msm
chmod +x ~/.local/bin/msm

# Add to PATH (pick one)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc    # for zsh
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc   # for bash

# Restart terminal or source
source ~/.zshrc
```

### Via Git Clone

```bash
git clone https://github.com/iuunhao/my-skill-manager.git
cd my-skill-manager
./msm --help
```

### Requirements

- [Node.js](https://nodejs.org/) >= 18 (for npm/npx)
- bash / zsh / fish shell
- git

## Usage

```bash
# Search for skills
msm search git
msm search "web scraping"

# Install a skill
msm add anthropics/skills@docx
msm add vercel-labs/agent-browser@agent-browser

# List installed skills
msm list
msm ls

# Get skill info
msm info docx

# Update skills
msm update           # update all
msm update docx      # update specific

# Export your setup
msm export

# Import on another machine
msm import
msm import my-skills.json

# Remove a skill
msm remove docx

# Show help
msm help
```

## Configuration

| File | Description |
|------|-------------|
| `skills.json` | Portable skill configuration (export/import) |
| `~/.config/myskills/config.json` | User config (auto-synced) |
| `~/.agents/.skill-lock.json` | Installed skill metadata |
| `~/.agents/skills/` | Skill files directory |

## Skill Types

| Type | Description |
|------|-------------|
| `dev` | Development tools and utilities |
| `productivity` | Productivity and workflow tools |
| `content` | Content creation and processing |
| `integration` | Third-party integrations |

## Workflow

### Share Skills Across Machines

```bash
# Machine A: export your skills
msm export

# Copy skills.json to Machine B, then:
msm import
```

### Backup and Restore

```bash
# Backup
msm export  # creates skills.json

# Restore
msm import
```

## Project Structure

```
my-skill-manager/
├── msm              # Main CLI script
├── skills.json      # Sample skill configuration
├── LICENSE          # MIT License
├── README.md        # This file
└── CONTRIBUTING.md  # Contribution guidelines
```

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Related

- [skills.sh](https://skills.sh) - Skills marketplace
- [Claude Code](https://claude.ai/code) - AI coding assistant
- [Anthropic Skills](https://github.com/anthropics/skills) - Official skills

## License

MIT License - see [LICENSE](LICENSE) for details.
