CC=gcc
CFLAGS=-Wall -Wextra -std=c99 -O2
AR=ar
ARFLAGS=rcs

# Library and file names
LIBNAME=libmath_utils.a
SOURCES=math_utils.c
OBJECTS=$(SOURCES:.c=.o)
HEADERS=math_utils.h

# Swift package destination paths
SWIFT_LIB_DIR=../MathUtils.swift/Sources/ExternalMathUtilsC/lib
SWIFT_INCLUDE_DIR=../MathUtils.swift/Sources/ExternalMathUtilsC/include

# Default target
all: $(LIBNAME) install

# Build the static library
$(LIBNAME): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^
	@echo "Static library $(LIBNAME) created successfully"

# Compile source files to object files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Create directories and copy files to Swift package
install: $(LIBNAME)
	@echo "Installing library and headers to Swift package..."
	@mkdir -p $(SWIFT_LIB_DIR)
	@mkdir -p $(SWIFT_INCLUDE_DIR)
	cp $(LIBNAME) $(SWIFT_LIB_DIR)/
	cp $(HEADERS) $(SWIFT_INCLUDE_DIR)/
	@echo "Installation complete:"
	@echo "  Library: $(SWIFT_LIB_DIR)/$(LIBNAME)"
	@echo "  Header:  $(SWIFT_INCLUDE_DIR)/$(HEADERS)"

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(LIBNAME)
	@echo "Build artifacts cleaned"

# Clean everything including installed files
clean-all: clean
	rm -f $(SWIFT_LIB_DIR)/$(LIBNAME)
	rm -f $(SWIFT_INCLUDE_DIR)/$(HEADERS)
	@echo "All files cleaned"

# Build only (without installing)
build: $(LIBNAME)

# Show help
help:
	@echo "Available targets:"
	@echo "  all        - Build library and install to Swift package (default)"
	@echo "  build      - Build library only"
	@echo "  install    - Install library and headers to Swift package"
	@echo "  clean      - Remove build artifacts"
	@echo "  clean-all  - Remove build artifacts and installed files"
	@echo "  help       - Show this help message"

.PHONY: all install clean clean-all build help
