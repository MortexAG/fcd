# fcd - Fuzzy Change Directory

`fcd` is a simple function that lets you quickly navigate directories using `fzf` and `fdfind`.
## Installation

You can just run the installation script
```sh
bash install_fcd.sh
```

## Manual Installation

 First you Will need `fdfind` and `fzf` installed


```sh
sudo apt update
sudo apt install fdfind && sudo apt install fzf
```
# 1. Clone the repo:
   ``` 
   git clone https://github.com/MortexAG/fcd.git
   cd fcd
   ```

# 2. Add `fcd` to your shell:
```sh
echo "source $(pwd)/fcd.sh" >> ~/.bashrc  # For Bash
echo "source $(pwd)/fcd.sh" >> ~/.zshrc   # For Zsh
```

# 3. Reload your shell:

```sh
source ~/.bashrc  # or source ~/.zshrc
```

# 3.1 Optional

Add the man page
```sh
bash add_man.sh
```

# 4. Usage

Search for a directory:

```sh
fcd projects
```

Pass arguments before the search term:

```sh
fcd -d 2 projects
```
For how to use the command

it mainly takes the arguments of the `fdfind`
```sh
fcd --help
```
and for `fdfind`

```sh
fdfind --help
```
## Uninstall

Remove the `source` line from `~/.bashrc` or `~/.zshrc`.

