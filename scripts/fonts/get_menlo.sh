#!/bin/sh

output="~/.local/share/fonts/Menlo"

git clone https://github.com/lxbrtsch/Menlo-for-Powerline.git
cd Menlo-for-Powerline

if [ -d "$output" ]; then
    echo "Output Exists"
else
    mkdir -p $output
    echo "Created OperatorMono directory"
fi

cp * $output

# Cleanup
cd ../..
rm -rf Operator-Mono
