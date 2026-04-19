# Contributing to msm

Thank you for your interest in contributing to msm!

## How to Contribute

### Report Issues

Found a bug or have a feature request? Please open an issue with:

- Clear title and description
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Environment info (OS, shell, Node version)

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make your changes
4. Test locally
5. Commit with clear messages
6. Push and open a PR

### Development Setup

```bash
git clone https://github.com/iuunhao/my-skill-manager.git
cd my-skill-manager
chmod +x msm
./msm --help
```

### Code Style

- Bash scripts: follow [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- Use 2 spaces for indentation
- Maximum line length: 100 characters

## Commands Reference

| Command | Description |
|---------|-------------|
| `msm search <query>` | Search skills from skills.sh |
| `msm add <source@skill>` | Install a skill |
| `msm list` | List installed skills |
| `msm export` | Export config |
| `msm import` | Import config |

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
