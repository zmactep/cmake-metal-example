#!/bin/sh

curl -o metal-cpp.zip https://developer.apple.com/metal/cpp/files/metal-cpp_macOS12_iOS15.zip
unzip metal-cpp.zip

mkdir build
cd build
cmake ..

xcrun -sdk macosx metal -c ../src/kernel.metal -o kernel.air
xcrun -sdk macosx metallib kernel.air -o kernel.metallib

make
