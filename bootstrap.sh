echo "Starting Dotfiles Install Script"

FILES=$(find "." -maxdepth 2 -name "install.sh")

# loop through FILES
for file in $FILES; do
  echo "Running $file"
  sh -c "$file"
if [ $? -eq 0 ]; then
    echo "Success"
  else
    echo "Failed on $file"
    exit 1
  fi
done
