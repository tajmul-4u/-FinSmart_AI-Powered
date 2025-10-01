# Development Environment Setup Guide

## Prerequisites

### System Requirements

- **Operating System**: Linux (Ubuntu 18.04+), Windows 10+, or macOS 10.14+
- **RAM**: Minimum 4GB, Recommended 8GB+
- **Storage**: At least 2GB free space

### Required Tools

#### 1. C++ Compiler

**Option A: GCC (Recommended for Linux/macOS)**

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install build-essential g++ gdb

# Verify installation
g++ --version  # Should show GCC 7.0 or later
```

**Option B: Visual Studio (Windows)**

- Download Visual Studio Community (free)
- Install with "Desktop development with C++" workload
- Ensure MSVC v143 compiler toolset is selected

**Option C: Clang (Alternative)**

```bash
# Ubuntu/Debian
sudo apt install clang

# macOS (using Homebrew)
brew install llvm
```

#### 2. Make Build System

```bash
# Ubuntu/Debian
sudo apt install make

# Windows (if using MinGW)
# Make is included with MinGW installation

# Verify installation
make --version
```

#### 3. Git Version Control

```bash
# Ubuntu/Debian
sudo apt install git

# Verify installation
git --version
```

### Recommended Development Tools

#### 1. Visual Studio Code

- Download from: https://code.visualstudio.com/
- Install C/C++ extension pack
- Install CMake Tools extension (optional)

#### 2. Debugging Tools

```bash
# GDB (GNU Debugger) - Usually comes with build-essential
gdb --version

# Valgrind (Memory debugging - Linux only)
sudo apt install valgrind
```

#### 3. Static Analysis Tools (Optional)

```bash
# Cppcheck
sudo apt install cppcheck

# Clang-tidy (part of clang-tools)
sudo apt install clang-tidy
```

### Optional Libraries for Future Features

#### 1. OpenGL for Graphics (Optional)

```bash
# Ubuntu/Debian
sudo apt install libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev

# Windows: Download from vendor websites
# macOS: Usually pre-installed
```

#### 2. SDL2 for Cross-platform Graphics (Optional)

```bash
# Ubuntu/Debian
sudo apt install libsdl2-dev

# Windows: Download development libraries
# macOS: brew install sdl2
```

## Environment Variables

### Linux/macOS (.bashrc or .zshrc)

```bash
# Add to your shell configuration file
export CXX=g++
export CXXFLAGS="-std=c++17 -Wall -Wextra"
```

### Windows (System Environment Variables)

- Add MinGW/MSVC to PATH if not done during installation
- Set CXX=g++ (for MinGW) or appropriate compiler

## Verification Script

Create and run this script to verify your setup:

```bash
#!/bin/bash
echo "=== FinSmart++ Development Environment Check ==="

echo "1. Checking C++ Compiler..."
if command -v g++ &> /dev/null; then
    echo "✓ g++ found: $(g++ --version | head -n1)"
else
    echo "✗ g++ not found"
fi

echo "2. Checking Make..."
if command -v make &> /dev/null; then
    echo "✓ make found: $(make --version | head -n1)"
else
    echo "✗ make not found"
fi

echo "3. Checking Git..."
if command -v git &> /dev/null; then
    echo "✓ git found: $(git --version)"
else
    echo "✗ git not found"
fi

echo "4. Testing C++17 compilation..."
cat > test_cpp17.cpp << EOF
#include <iostream>
#include <vector>
#include <memory>

int main() {
    auto numbers = std::vector{1, 2, 3, 4, 5}; // C++17 class template argument deduction
    auto ptr = std::make_unique<int>(42);      // C++14 feature
    std::cout << "C++17 test successful!" << std::endl;
    return 0;
}
EOF

if g++ -std=c++17 test_cpp17.cpp -o test_cpp17 2>/dev/null; then
    echo "✓ C++17 compilation successful"
    ./test_cpp17
    rm test_cpp17 test_cpp17.cpp
else
    echo "✗ C++17 compilation failed"
    rm -f test_cpp17.cpp test_cpp17
fi

echo "=== Setup verification complete ==="
```

## Troubleshooting

### Common Issues

1. **"g++: command not found"**

   - Install build-essential package
   - Check PATH environment variable

2. **"C++17 features not recognized"**

   - Ensure GCC 7.0+ or Clang 5.0+
   - Use -std=c++17 flag

3. **Linker errors**

   - Check library paths
   - Ensure all required libraries are installed

4. **Permission denied**
   - Use sudo for system-wide installations
   - Check file permissions for project directory

### Getting Help

- Check compiler documentation
- FinSmart++ GitHub Issues
- C++ community forums (Stack Overflow, Reddit r/cpp)
