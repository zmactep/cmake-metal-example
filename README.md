CMake Metal Minimal Example
===========================


What is it?
-----------

Recently, Apple announced [C++ interface](https://developer.apple.com/metal/cpp/) for its Metal Framework to use it without Swift or Objective-C. That is great, as many different bindings for high-level programming languages can be created now.

Of course, Apple has a manual on working with these headers in XCode. But if you hate this IDE as I do, you would like to use CMake to build your project without it. So here we have a minimal example of how to build a Metal-based project using CLI.

Build
-----

All the magic is stored in `compile.sh` file. But let us understand it.

```bash
curl -o metal-cpp.zip https://developer.apple.com/metal/cpp/files/metal-cpp_macOS12_iOS15.zip
unzip metal-cpp.zip
```

Download and unzip headers from Apple Developer. All the staff will be in `metal-cpp` directory.

```bash
mkdir build
cd build
cmake ..
```

Standard CMake operations to create a Makefile. CMake will use `metal-cpp` as additional headers path, so `Metal/Metal.hpp` will be available.

```bash
xcrun -sdk macosx metal -c ../src/kernel.metal -o kernel.air
xcrun -sdk macosx metallib kernel.air -o kernel.metallib
```

CMake cannot build Metal shaders by itself, so we have to do this work by ourselfs. The explanation of this lines can be found [here](https://developer.apple.com/documentation/metal/libraries/building_a_library_with_metal_s_command-line_tools).

```bash
make
```

Nothing to comment. Just build the executable.
