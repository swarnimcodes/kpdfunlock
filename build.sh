#!/bin/bash
# Build script for kpdfunlock

set -e  # Exit on error

BUILD_DIR="build"
CMAKE_FLAGS="-DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DQT_MAJOR_VERSION=6"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Parse arguments
case "${1:-build}" in
    configure|config)
        echo -e "${BLUE}Configuring project...${NC}"
        mkdir -p "$BUILD_DIR"
        cd "$BUILD_DIR"
        cmake .. $CMAKE_FLAGS
        cd ..
        ln -sf "$BUILD_DIR/compile_commands.json" compile_commands.json
        echo -e "${GREEN}Configuration complete!${NC}"
        ;;

    build)
        echo -e "${BLUE}Building project...${NC}"
        if [ ! -d "$BUILD_DIR" ]; then
            echo "Build directory not found, configuring first..."
            $0 configure
        fi
        cd "$BUILD_DIR"
        cmake --build . -j$(nproc)
        echo -e "${GREEN}Build complete!${NC}"
        ;;

    run)
        echo -e "${BLUE}Building and running...${NC}"
        $0 build
        echo -e "${BLUE}Running kpdfunlock...${NC}"
        ./"$BUILD_DIR/bin/kpdfunlock"
        ;;

    clean)
        echo -e "${BLUE}Cleaning build artifacts...${NC}"
        rm -rf "$BUILD_DIR"
        rm -f compile_commands.json
        echo -e "${GREEN}Clean complete!${NC}"
        ;;

    rebuild)
        echo -e "${BLUE}Rebuilding from scratch...${NC}"
        $0 clean
        $0 build
        ;;

    install)
        echo -e "${BLUE}Installing...${NC}"
        cd "$BUILD_DIR"
        cmake --install .
        echo -e "${GREEN}Installation complete!${NC}"
        ;;

    help|--help|-h)
        echo "Usage: ./build.sh [command]"
        echo ""
        echo "Commands:"
        echo "  configure  - Run CMake configuration"
        echo "  build      - Build the project (default)"
        echo "  run        - Build and run the application"
        echo "  clean      - Remove build artifacts"
        echo "  rebuild    - Clean and rebuild from scratch"
        echo "  install    - Install the application"
        echo "  help       - Show this help message"
        ;;

    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Run './build.sh help' for usage information"
        exit 1
        ;;
esac
