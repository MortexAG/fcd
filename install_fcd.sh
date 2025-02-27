#!/bin/bash

# Install dependencies
echo "Installing fdfind and fzf..."
sudo apt update && sudo apt install -y fdfind fzf

# Ensure fcd.sh exists
if [[ ! -f "fcd.sh" ]]; then
    echo "Error: fcd.sh not found in the current directory!"
    exit 1
fi

# Move fcd.sh to ~/.local/bin/ for global use
echo "Moving fcd.sh to ~/.local/bin/"
mkdir -p ~/.local/bin
cp fcd.sh ~/.local/bin/fcd.sh
chmod +x ~/.local/bin/fcd.sh

# Add sourcing to bashrc/zshrc
if [[ -f "$HOME/.bashrc" ]]; then
    echo "source ~/.local/bin/fcd.sh" >> ~/.bashrc
    echo "Added fcd to ~/.bashrc"
fi

if [[ -f "$HOME/.zshrc" ]]; then
    echo "source ~/.local/bin/fcd.sh" >> ~/.zshrc
    echo "Added fcd to ~/.zshrc"
fi

# Move man page
if [[ ! -f "fcd.1" ]]; then
    echo "Error: fcd.1 not found in the current directory!"
    exit 1
fi

echo "Moving man page to /usr/local/share/man/man1/"
sudo mkdir -p /usr/local/share/man/man1
sudo cp fcd.1 /usr/local/share/man/man1/
sudo mandb

# Reload shell
echo "Installation complete! Run 'source ~/.bashrc' or 'source ~/.zshrc' to apply changes."

