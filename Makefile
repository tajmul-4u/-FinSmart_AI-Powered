# FinSmart++ Makefile
# Modern C++ Financial Management Application

# Compiler and flags
CXX = g++
CXXSTD = -std=c++17
INCLUDE = -Iinclude
WARNINGS = -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wunreachable-code
THREADING = -pthread

# Build modes
DEBUG_FLAGS = -g -O0 -DDEBUG -fsanitize=address -fsanitize=undefined
RELEASE_FLAGS = -O3 -DNDEBUG -march=native
PROFILE_FLAGS = -O2 -g -pg

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TESTDIR = tests
ASSETDIR = assets

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_OBJECTS = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

# Main source (exclude from library)
MAIN_SRC = $(SRCDIR)/main.cpp
MAIN_OBJ = $(BUILDDIR)/main.o
LIB_OBJECTS = $(filter-out $(MAIN_OBJ), $(OBJECTS))

# Target executable
TARGET = FinSmart
TEST_TARGET = test_runner

# Default build mode
BUILD_MODE ?= debug

# Select flags based on build mode
ifeq ($(BUILD_MODE),debug)
    CXXFLAGS = $(CXXSTD) $(INCLUDE) $(WARNINGS) $(THREADING) $(DEBUG_FLAGS)
else ifeq ($(BUILD_MODE),release)
    CXXFLAGS = $(CXXSTD) $(INCLUDE) $(WARNINGS) $(THREADING) $(RELEASE_FLAGS)
else ifeq ($(BUILD_MODE),profile)
    CXXFLAGS = $(CXXSTD) $(INCLUDE) $(WARNINGS) $(THREADING) $(PROFILE_FLAGS)
else
    $(error Invalid BUILD_MODE. Use: debug, release, or profile)
endif

# Default target
.PHONY: all debug release profile clean test help install dirs

all: debug

debug:
	$(MAKE) $(TARGET) BUILD_MODE=debug

release:
	$(MAKE) $(TARGET) BUILD_MODE=release

profile:
	$(MAKE) $(TARGET) BUILD_MODE=profile

# Create build directory
dirs:
	@mkdir -p $(BUILDDIR)

# Main executable
$(TARGET): dirs $(OBJECTS)
	@echo "Linking $(TARGET) in $(BUILD_MODE) mode..."
	$(CXX) $(CXXFLAGS) -o $@ $(OBJECTS)
	@echo "Build complete: $(TARGET)"

# Object files compilation
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@echo "Compiling $< in $(BUILD_MODE) mode..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test compilation
$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	@echo "Compiling test $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target (if test files exist)
test: dirs $(LIB_OBJECTS) $(TEST_OBJECTS)
	@if [ -n "$(TEST_SOURCES)" ]; then \
		echo "Building test suite..."; \
		$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $(LIB_OBJECTS) $(TEST_OBJECTS); \
		echo "Running tests..."; \
		./$(TEST_TARGET); \
	else \
		echo "No test files found in $(TESTDIR)/"; \
	fi

# Run the application
run: $(TARGET)
	@echo "Running FinSmart++..."
	./$(TARGET)

# Memory check with valgrind
memcheck: debug
	@if command -v valgrind >/dev/null 2>&1; then \
		echo "Running memory check..."; \
		valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(TARGET); \
	else \
		echo "Valgrind not found. Install with: sudo apt install valgrind"; \
	fi

# Static analysis with cppcheck
analyze:
	@if command -v cppcheck >/dev/null 2>&1; then \
		echo "Running static analysis..."; \
		cppcheck --enable=all --std=c++17 --language=c++ $(SRCDIR)/ $(INCDIR)/; \
	else \
		echo "Cppcheck not found. Install with: sudo apt install cppcheck"; \
	fi

# Format code (if clang-format is available)
format:
	@if command -v clang-format >/dev/null 2>&1; then \
		echo "Formatting code..."; \
		find $(SRCDIR) $(INCDIR) -name "*.cpp" -o -name "*.h" | xargs clang-format -i; \
		echo "Code formatted."; \
	else \
		echo "clang-format not found. Install with: sudo apt install clang-format"; \
	fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILDDIR)/*.o $(TARGET) $(TEST_TARGET)
	@echo "Clean complete."

# Clean everything including build directory
distclean: clean
	@echo "Removing build directory..."
	rm -rf $(BUILDDIR)

# Install system-wide (optional)
install: release
	@echo "Installing FinSmart++ to /usr/local/bin/"
	sudo cp $(TARGET) /usr/local/bin/
	@echo "Installation complete."

# Show help
help:
	@echo "FinSmart++ Build System"
	@echo "======================"
	@echo "Available targets:"
	@echo "  all         - Build in debug mode (default)"
	@echo "  debug       - Build with debug symbols and sanitizers"
	@echo "  release     - Build optimized release version"
	@echo "  profile     - Build with profiling support"
	@echo "  test        - Build and run tests"
	@echo "  run         - Build and run the application"
	@echo "  memcheck    - Run with valgrind memory checking"
	@echo "  analyze     - Run static analysis with cppcheck"
	@echo "  format      - Format code with clang-format"
	@echo "  clean       - Remove build artifacts"
	@echo "  distclean   - Remove build directory"
	@echo "  install     - Install system-wide"
	@echo "  help        - Show this help message"
	@echo ""
	@echo "Build modes:"
	@echo "  BUILD_MODE=debug    - Debug build (default)"
	@echo "  BUILD_MODE=release  - Release build"
	@echo "  BUILD_MODE=profile  - Profile build"

# Dependency tracking
-include $(OBJECTS:.o=.d)

# Generate dependency files
$(BUILDDIR)/%.d: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXSTD) $(INCLUDE) -MM -MT $(@:.d=.o) $< > $@
