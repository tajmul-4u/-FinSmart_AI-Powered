# 🚀 FinSmart++ – AI-Powered Personal Finance & Investment Simulator

![C++](https://img.shields.io/badge/C%2B%2B-17-blue?style=for-the-badge&logo=c%2B%2B)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Windows-lightgrey?style=for-the-badge)

---

## ✨ **Overview**

**FinSmart++** is a cutting-edge **C++ application** that helps users **manage personal finances and simulate investments** using **AI-powered predictions**. It integrates **modern C++ concepts**, **file persistence**, and **multithreading** to deliver an advanced and practical finance tool.

---

## ✅ **Features**

✔ **Secure User Management** – Registration, login, password encryption  
✔ **Account Management** – Track income, expenses, balance  
✔ **Investment Simulation** – Stocks, Crypto, Fixed Deposit  
✔ **AI Simulation Engine** – Predict profits/loss based on risk  
✔ **Data Persistence** – File storage with basic encryption  
✔ **Visualization** – Reports, charts (ASCII or OpenGL)  
✔ **Multithreading** – Faster AI predictions

---

## 🛠 **Tech Stack**

- **Language:** C++17 (or later)
- **Core Concepts:**

  - OOP (Encapsulation, Inheritance, Polymorphism)
  - Templates & STL (`vector`, `map`, `algorithm`)
  - Smart Pointers (`unique_ptr`, `shared_ptr`)
  - Exception Handling
  - File Handling & Persistence
  - Multithreading (`std::thread`)
  - Design Patterns (**Singleton**, **Factory**, **Observer**)

- **Optional Libraries:**
  - **OpenGL / SDL** for charts
  - **ASCII Graphs** for lightweight mode

---

## 📂 **Project Structure**

```
FinSmart++/
├── 📁 include/           # Header files (.h)
│   ├── User.h           # User management class
│   └── Account.h        # Account management class
├── 📁 src/              # Source files (.cpp)
│   ├── main.cpp         # Main application entry
│   ├── User.cpp         # User implementation
│   └── Account.cpp      # Account implementation
├── 📁 build/            # Compiled objects (auto-generated)
├── 📁 tests/            # Unit tests
├── 📁 assets/           # Configuration & data files
├── 📁 docs/             # Documentation
│   └── SETUP.md         # Detailed setup guide
├── 📁 .vscode/          # VS Code configuration
│   ├── launch.json      # Debug configuration
│   ├── tasks.json       # Build tasks
│   └── settings.json    # Editor settings
├── 📄 Makefile          # Enhanced build system
├── 📄 .gitignore        # Git ignore rules
├── 📄 LICENSE           # MIT License
└── 📄 README.md         # This file
```

---

## 🔍 **How It Works**

1. 👤 **Register/Login** → Create account
2. 💰 **Add Income & Expenses** → Update balance
3. 📈 **Choose Investment** → Stock / Crypto / FD
4. 🧠 **Set Risk Level** → AI Simulation in background
5. 📊 **View Report** → Profit/Loss prediction with charts

---

## ⚡ **Quick Start Setup**

### Step 1: Prerequisites Check

Before starting, ensure you have the required tools installed:

```bash
# Check if required tools are installed
g++ --version    # Should show GCC 7.0+ or Clang 5.0+
make --version   # GNU Make 4.0+
git --version    # Git 2.0+
```

**📋 Need to install tools?** See our [detailed setup guide](docs/SETUP.md)

### Step 2: Clone & Setup

```bash
# Clone the repository
git clone https://github.com/tajmul-4u/-FinSmart_AI-Powered.git
cd -FinSmart_AI-Powered

# Make sure all directories exist
mkdir -p build assets docs tests
```

### Step 3: Build the Project

```bash
# Quick build (debug mode with safety checks)
make debug

# Or for optimized release
make release

# Or just use default
make
```

### Step 4: Run the Application

```bash
# Run the application
make run

# Or run directly
./FinSmart
```

### Step 5: Development Setup (Optional)

For the best development experience with **VS Code**:

1. **Install VS Code Extensions:**

   - C/C++ Extension Pack
   - GitLens (for Git integration)
   - Better Comments (for code documentation)

2. **Open in VS Code:**

   ```bash
   code .
   ```

3. **Use integrated debugging:**
   - Press `F5` to start debugging
   - Set breakpoints by clicking line numbers
   - Use the integrated terminal (` Ctrl+``  ` `)

---

## 🔧 **Build System Guide**

Our enhanced Makefile supports multiple build modes and development tools:

### Build Modes

```bash
make debug      # Debug build with sanitizers
make release    # Optimized production build
make profile    # Profiling enabled build
```

### Development Tools

```bash
make test       # Run unit tests (when available)
make memcheck   # Memory leak detection with Valgrind
make analyze    # Static code analysis with Cppcheck
make format     # Code formatting with clang-format
make clean      # Clean build artifacts
make help       # Show all available commands
```

### Advanced Usage

```bash
# Build with specific compiler
CXX=clang++ make release

# Parallel compilation (faster builds)
make -j$(nproc) debug

# Verbose compilation
make debug VERBOSE=1
```

---

---

## 🚨 **Troubleshooting**

### Common Build Issues

**❌ "g++: command not found"**

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install build-essential

# CentOS/RHEL
sudo yum groupinstall "Development Tools"
```

**❌ "C++17 features not recognized"**

```bash
# Check compiler version
g++ --version

# Ensure GCC 7.0+ or Clang 5.0+
# Update if necessary
```

**❌ "Permission denied" when running**

```bash
# Make executable
chmod +x FinSmart

# Or rebuild
make clean && make
```

**❌ Build fails with "No such file or directory"**

```bash
# Ensure all directories exist
mkdir -p build assets docs tests

# Clean and rebuild
make distclean && make debug
```

### Getting Help

- 📖 Check [detailed setup guide](docs/SETUP.md)
- 🐛 Open an issue on GitHub
- 💬 Ask questions in discussions
- 📧 Contact: [your-email@example.com]

---

## ✅ **Why Choose FinSmart++?**

- Covers **100% of modern C++ concepts**
- Real-world finance & AI simulation
- Highly modular and scalable architecture
- Perfect for **learning C++** or **portfolio project**

---

## 🚀 **Future Enhancements**

- ✅ Full GUI using **Qt**
- ✅ Real-time Stock API integration
- ✅ Advanced Encryption (AES/RSA)
- ✅ Cloud storage support

---

## 📜 **License**

This project is licensed under the [MIT License](LICENSE).

---

## ⭐ **Show your support**

If you like this project, give it a **⭐ on GitHub**!
