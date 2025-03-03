#!/bin/bash

# Install dependencies
echo "Installing fdfind and fzf..."
sudo pacman -Sy fd && sudo pacman -Sy fzf

# Ensure fcd.sh exists
if [[ ! -f "fcd.sh" ]]; then
    echo "Error: fcd.sh not found in the current directory!"
    exit 1
fi

# Move fcd.sh to ~/.local/bin/
echo "Moving arch-fcd.sh to ~/.local/bin/"
mkdir -p ~/.local/bin
cp arch-fcd.sh ~/.local/bin/arch-fcd.sh
chmod +x ~/.local/bin/arch-fcd.sh

# Add sourcing to bashrc/zshrc
if [[ -f "$HOME/.bashrc" ]]; then
    if ! grep -q "source ~/.local/bin/arch-fcd.sh" ~/.bashrc; then
        echo "source ~/.local/bin/arch-fcd.sh" >> ~/.bashrc
        echo "Added fcd to ~/.bashrc"
    fi
fi

if [[ -f "$HOME/.zshrc" ]]; then
    if ! grep -q "source ~/.local/bin/arch-fcd.sh" ~/.zshrc; then
        echo "source ~/.local/bin/arch-fcd.sh" >> ~/.zshrc
        echo "Added fcd to ~/.zshrc"
    fi
fi

# Move man page (inside man/ directory)
if [[ ! -f "man/fcd.1" ]]; then
    echo "Error: man/fcd.1 not found!"
    exit 1
fi

echo "Moving man page to /usr/local/share/man/man1/"
sudo mkdir -p /usr/local/share/man/man1
sudo cp man/fcd.1 /usr/local/share/man/man1/
sudo mandb

# Reload shell
echo "Installation complete! Run 'source ~/.bashrc' or 'source ~/.zshrc' to apply changes."

