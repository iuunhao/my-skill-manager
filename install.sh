#!/usr/bin/env bash
# msm install script
# Usage: curl -fsSL https://raw.githubusercontent.com/iuunhao/my-skill-manager/main/install.sh | bash

set -euo pipefail

REPO="iuunhao/my-skill-manager"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
INSTALL_PATH="$INSTALL_DIR/msm"
REPO_URL="https://github.com/$REPO"

echo "Installing msm (My Skill Manager)..."

# Detect OS for error messages
OS="$(uname -s)"
if [ "$OS" = "Darwin" ]; then
    OS="macOS"
elif [ "$OS" = "Linux" ]; then
    OS="Linux"
else
    echo "Warning: $OS may not be fully supported"
fi

# Check for Node.js (required dependency)
if ! command -v node &>/dev/null; then
    echo "Error: Node.js is required but not installed."
    echo "Install from: https://nodejs.org/"
    exit 1
fi

# Check for npx
if ! command -v npx &>/dev/null; then
    echo "Error: npx is required but not found."
    echo "It should come with Node.js. Try: npm install -g npx"
    exit 1
fi

# Create install directory if needed
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR..."
    mkdir -p "$INSTALL_DIR"
fi

# Download msm script
echo "Downloading msm..."
curl -fsSL "$REPO_URL/raw/main/msm" -o "$INSTALL_PATH" || {
    echo "Error: Failed to download msm from $REPO_URL/raw/main/msm"
    exit 1
}

# Make executable
chmod +x "$INSTALL_PATH"

# Add to PATH if not already there
SHELL_RC=""
case "$SHELL" in
    */zsh)  SHELL_RC="$HOME/.zshrc" ;;
    */bash) SHELL_RC="$HOME/.bashrc" ;;
    */fish) SHELL_RC="$HOME/.config/fish/config.fish" ;;
esac

if [ -n "$SHELL_RC" ]; then
    if ! grep -q "$INSTALL_DIR" "$SHELL_RC" 2>/dev/null; then
        echo "Adding $INSTALL_DIR to PATH in $SHELL_RC..."
        printf '\n# My Skill Manager (msm)\nexport PATH="%s:$PATH"\n' "$INSTALL_DIR" >> "$SHELL_RC"
        echo "Added to $SHELL_RC"
        echo "Run 'source $SHELL_RC' or restart your terminal"
    else
        echo "$INSTALL_DIR is already in PATH"
    fi
fi

# Verify installation
if "$INSTALL_PATH" --help &>/dev/null; then
    echo ""
    echo "Successfully installed msm to $INSTALL_PATH"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your terminal or run: source $SHELL_RC"
    echo "  2. Run: msm list"
    echo "  3. Run: msm help"
    echo ""
else
    echo "Error: Installation failed - msm command not working"
    exit 1
fi
