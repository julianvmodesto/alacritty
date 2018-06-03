#!/bin/bash

set -eou pipefail

docker build -t alacritty-builder .

docker run --rm \
  -v $(pwd):/app \
  alacritty-builder

# sudo cp target/release/alacritty /usr/local/bin
# sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
# sudo desktop-file-install extra/linux/Alacritty.desktop
# sudo update-desktop-database
