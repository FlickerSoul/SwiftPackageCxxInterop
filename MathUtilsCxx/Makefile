# Makefile for complex_math static library

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -O2 -std=c++17
CLANG = clang++
AR = ar
ARFLAGS = rcs

# Directories
SWIFT_PKG_DIR = ../MathUtils.swift
EXTERNAL_CXX_DIR = $(SWIFT_PKG_DIR)/Sources/ExternalMathUtilsCxx
LIB_DIR = $(EXTERNAL_CXX_DIR)/lib
INCLUDE_DIR = $(EXTERNAL_CXX_DIR)/include

# Files
HEADER = complex_math.h
SOURCE = complex_math.cpp
OBJECT = complex_math.o
LIBRARY = libcomplexmath.a

# Default target
all: $(LIBRARY) $(MODULEMAP) install

# Compile object file
$(OBJECT): $(SOURCE) $(HEADER)
	$(CXX) $(CXXFLAGS) -c $(SOURCE) -o $(OBJECT)

# Create static library
$(LIBRARY): $(OBJECT)
	$(AR) $(ARFLAGS) $(LIBRARY) $(OBJECT)

# Create target directories and copy files
install: $(LIBRARY)
	@echo "Creating target directories..."
	@mkdir -p $(LIB_DIR)
	@mkdir -p $(INCLUDE_DIR)
	@echo "Copying library to $(LIB_DIR)..."
	@cp $(LIBRARY) $(LIB_DIR)/
	@echo "Copying header to $(INCLUDE_DIR)..."
	@cp $(HEADER) $(INCLUDE_DIR)/
	@echo "Installation complete!"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -f $(OBJECT) $(LIBRARY)
	@echo "Clean complete!"

# Clean everything including installed files
distclean: clean
	@echo "Removing installed files..."
	@rm -f $(LIB_DIR)/$(LIBRARY)
	@rm -f $(INCLUDE_DIR)/$(HEADER)
	@echo "Distclean complete!"

# Force rebuild
rebuild: clean all

# Show help
help:
	@echo "Available targets:"
	@echo "  all       - Build library, generate module map, and install (default)"
	@echo "  install   - Copy library, header, and module map to Swift package"
	@echo "  clean     - Remove build artifacts and module map"
	@echo "  distclean - Remove build artifacts and installed files"
	@echo "  rebuild   - Clean and rebuild everything"
	@echo "  help      - Show this help message"

# Declare phony targets
.PHONY: all install clean distclean rebuild help
