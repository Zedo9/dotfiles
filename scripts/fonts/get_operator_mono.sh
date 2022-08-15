#!/bin/sh

output="~/.local/share/fonts/OperatorMono"

git clone git@github.com:keyding/Operator-Mono.git
cd Operator-Mono/Fonts

if [ -d "$output" ]; then
else
    mkdir -p $output
    echo "Created OperatorMono directory"
fi

cp * $output

# Cleanup
cd ../..
rm -rf Operator-Mono