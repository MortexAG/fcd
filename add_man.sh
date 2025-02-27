# Move man page
if [[ ! -f "fcd.1" ]]; then
    echo "Error: fcd.1 not found in the current directory!"
    exit 1
fi

echo "Moving man page to /usr/local/share/man/man1/"
sudo mkdir -p /usr/local/share/man/man1
sudo cp fcd.1 /usr/local/share/man/man1/
sudo mandb
