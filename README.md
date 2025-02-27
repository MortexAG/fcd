# fcd - Fuzzy Change Directory

`fcd` is a simple function that lets you quickly navigate directories using `fzf` and `fdfind`.

## Installation

0. First you Will need `fdfind` and `fzf` installed

sh 
```
sudo apt update
sudo apt install fdfind && sudo apt install fzf
```

1. Clone the repo:
   ``` 
   git clone https://github.com/YOUR_GITHUB_USERNAME/fcd.git
   cd fcd
    ```

2. Add fcd to your shell:

sh 
```
echo "source $(pwd)/fcd.sh" >> ~/.bashrc  # For Bash
echo "source $(pwd)/fcd.sh" >> ~/.zshrc   # For Zsh
```

3. Reload your shell:

sh
```
source ~/.bashrc  # or source ~/.zshrc
```
4. Usage

Search for a directory:

sh
```
fcd projects
```

Pass arguments before the search term:

sh
```
fcd -d 2 projects
```
Uninstall

Remove the `source` line from `~/.bashrc` or `~/.zshrc`.

