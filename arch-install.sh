#!/bin/bash

# Install dependencies
echo "Installing fd and fzf..."
sudo pacman -Sy fd && sudo pacman -Sy fzf

# Ensure fcd.sh exists
if [[ ! -f "arch-fcd.sh" ]]; then
    echo "Error: arch-fcd.sh not found in the current directory!"
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
        echo "Added 'source ~/.local/bin/arch-fcd.sh' to ~/.bashrc"
    fi
fi

if [[ -f "$HOME/.zshrc" ]]; then
    if ! grep -q "source ~/.local/bin/arch-fcd.sh" ~/.zshrc; then
        echo "source ~/.local/bin/arch-fcd.sh" >> ~/.zshrc
        echo "Added 'source ~/.local/bin/arch-fcd.sh' to ~/.zshrc"
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

# Inform the user about shell reload
echo "Installation complete!"
echo "The changes will take effect in a new terminal session."
echo "You can either run 'source ~/.bashrc' or 'source ~/.zshrc' to apply changes in the current terminal."

# Optional: Automatically reload the shell (in a new terminal session)
if [[ -n "$BASH_VERSION" ]]; then
    echo "Attempting to reload bash session..."
    source ~/.bashrc
elif [[ -n "$ZSH_VERSION" ]]; then
    echo "Attempting to reload zsh session..."
    source ~/.zshrc
else
    echo "No supported shell found (bash/zsh). Please reload your terminal manually."
fi

# Reload terminal session in case of a new terminal window
echo "You can also open a new terminal window to immediately use the 'fcd' command."

