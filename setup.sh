#!/bin/bash

# FinSmart++ Project Setup Script
# This script automates the initial setup and verification of the development environment

echo "🚀 FinSmart++ Project Setup Script"
echo "===================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Main setup function
main() {
    echo
    print_info "Checking system requirements..."
    
    # Check for required tools
    local requirements_met=true
    
    if command_exists g++; then
        print_status "g++ compiler found: $(g++ --version | head -n1)"
    else
        print_error "g++ compiler not found"
        requirements_met=false
    fi
    
    if command_exists make; then
        print_status "make build system found: $(make --version | head -n1)"
    else
        print_error "make not found"
        requirements_met=false
    fi
    
    if command_exists git; then
        print_status "git version control found: $(git --version)"
    else
        print_warning "git not found (optional but recommended)"
    fi
    
    # Check C++17 support
    echo
    print_info "Testing C++17 compiler support..."
    
    cat > temp_cpp17_test.cpp << 'EOF'
#include <iostream>
#include <vector>
#include <memory>

int main() {
    auto numbers = std::vector{1, 2, 3}; // C++17 feature
    auto ptr = std::make_unique<int>(42);
    std::cout << "C++17 test successful!" << std::endl;
    return 0;
}
EOF
    
    if g++ -std=c++17 temp_cpp17_test.cpp -o temp_cpp17_test 2>/dev/null; then
        print_status "C++17 compilation successful"
        ./temp_cpp17_test
        rm -f temp_cpp17_test temp_cpp17_test.cpp
    else
        print_error "C++17 compilation failed"
        rm -f temp_cpp17_test.cpp temp_cpp17_test
        requirements_met=false
    fi
    
    if [ "$requirements_met" = false ]; then
        echo
        print_error "Some requirements are not met. Please install missing tools."
        print_info "See docs/SETUP.md for detailed installation instructions."
        exit 1
    fi
    
    # Setup project structure
    echo
    print_info "Setting up project structure..."
    
    # Create directories if they don't exist
    for dir in build assets docs tests .vscode; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            print_status "Created directory: $dir"
        else
            print_status "Directory exists: $dir"
        fi
    done
    
    # Check for source files
    echo
    print_info "Checking source files..."
    
    required_files=(
        "include/User.h"
        "include/Account.h"
        "src/User.cpp"
        "src/Account.cpp"
        "src/main.cpp"
        "Makefile"
    )
    
    for file in "${required_files[@]}"; do
        if [ -f "$file" ]; then
            print_status "Found: $file"
        else
            print_error "Missing: $file"
        fi
    done
    
    # Test build
    echo
    print_info "Testing build system..."
    
    if make clean >/dev/null 2>&1; then
        print_status "Clean successful"
    fi
    
    if make debug >/dev/null 2>&1; then
        print_status "Debug build successful"
        
        # Test run
        if [ -f "./FinSmart" ]; then
            print_info "Testing application execution..."
            echo "--- Application Output ---"
            ./FinSmart
            echo "--- End Output ---"
            print_status "Application runs successfully"
        fi
    else
        print_error "Build failed"
        print_info "Try running 'make debug' manually to see error details"
    fi
    
    # Test suite
    if [ -f "tests/test_basic.cpp" ]; then
        echo
        print_info "Running test suite..."
        if make test >/dev/null 2>&1; then
            print_status "Test suite passed"
        else
            print_warning "Test suite failed or not available"
        fi
    fi
    
    # Optional tools check
    echo
    print_info "Checking optional development tools..."
    
    if command_exists valgrind; then
        print_status "Valgrind found (memory debugging available)"
    else
        print_warning "Valgrind not found (install with: sudo apt install valgrind)"
    fi
    
    if command_exists cppcheck; then
        print_status "Cppcheck found (static analysis available)"
    else
        print_warning "Cppcheck not found (install with: sudo apt install cppcheck)"
    fi
    
    if command_exists clang-format; then
        print_status "clang-format found (code formatting available)"
    else
        print_warning "clang-format not found (install with: sudo apt install clang-format)"
    fi
    
    # VS Code check
    if command_exists code; then
        print_status "VS Code found"
        print_info "Run 'code .' to open project in VS Code"
    else
        print_warning "VS Code not found (optional)"
    fi
    
    # Setup complete
    echo
    echo "🎉 Setup complete!"
    echo "=================="
    print_info "Next steps:"
    echo "  1. Run 'make help' to see available build commands"
    echo "  2. Run 'make debug' to build in debug mode"
    echo "  3. Run 'make run' to build and run the application"
    echo "  4. Run 'code .' to open in VS Code (if installed)"
    echo
    print_info "For detailed documentation, see:"
    echo "  - README.md (project overview)"
    echo "  - docs/SETUP.md (detailed setup guide)"
    echo "  - assets/README.md (sample data information)"
    echo
}

# Script entry point
if [ "$0" = "${BASH_SOURCE[0]}" ]; then
    main "$@"
fi