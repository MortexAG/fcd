#!/bin/bash

# Install dependencies
echo "Installing fdfind and fzf..."
sudo apt update && sudo apt install -y fd-find fzf

# Ensure fcd.sh exists
if [[ ! -f "fcd.sh" ]]; then
    echo "Error: fcd.sh not found in the current directory!"
    exit 1
fi

# Move fcd.sh to ~/.local/bin/
echo "Moving fcd.sh to ~/.local/bin/"
mkdir -p ~/.local/bin
cp fcd.sh ~/.local/bin/fcd.sh
chmod +x ~/.local/bin/fcd.sh

# Add sourcing to bashrc/zshrc
if [[ -f "$HOME/.bashrc" ]]; then
    if ! grep -q "source ~/.local/bin/fcd.sh" ~/.bashrc; then
        echo "source ~/.local/bin/fcd.sh" >> ~/.bashrc
        echo "Added 'source ~/.local/bin/fcd.sh' to ~/.bashrc"
    fi
fi

if [[ -f "$HOME/.zshrc" ]]; then
    if ! grep -q "source ~/.local/bin/fcd.sh" ~/.zshrc; then
        echo "source ~/.local/bin/fcd.sh" >> ~/.zshrc
        echo "Added 'source ~/.local/bin/fcd.sh' to ~/.zshrc"
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

# Automatically reload the shell
echo "Reloading your shell session..."

# Attempt to source the shell configuration file (bash or zsh)
if [[ -n "$BASH_VERSION" ]]; then
    source ~/.bashrc
    echo "Reloaded bash session."
elif [[ -n "$ZSH_VERSION" ]]; then
    source ~/.zshrc
    echo "Reloaded zsh session."
else
    echo "No supported shell found (bash/zsh). Please reload your terminal manually."
fi

# Inform user to open a new terminal
echo "You can also open a new terminal window to immediately use the 'fcd' command."

