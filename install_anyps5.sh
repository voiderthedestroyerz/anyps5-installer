# Read README.md
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== AnyPS5 Automated Installer for Linux Mint ===${NC}"

if [ "$EUID" -ne 0 ]; then
  echo -e "${YELLOW}[*] This script requires sudo privileges to install dependencies.${NC}"
  sudo -v || { echo -e "${RED}[X] Sudo authentication failed. Exiting.${NC}"; exit 1; }
fi

# 1. Install build tools, git, and required SDL/X11/Wayland/Audio development headers
echo -e "${GREEN}[*] Updating package lists and installing dependencies...${NC}"
sudo apt update
sudo apt install -y git build-essential cmake libxrandr-dev libx11-dev libxext-dev libwayland-dev libxkbcommon-dev libegl-dev libdecor-0-dev libpipewire-0.3-dev libpulse-dev libasound2-dev

# 2. Handle repository cloning safely
REPO_DIR="AnyPS5"
if [ -d "$REPO_DIR" ]; then
    echo -e "${YELLOW}[*] Directory '$REPO_DIR' already exists. Entering and updating...${NC}"
    cd "$REPO_DIR"
    git pull
else
    echo -e "${GREEN}[*] Cloning AnyPS5 repository with recursive submodules...${NC}"
    git clone --recursive https://github.com/boykopovar/AnyPS5.git
    cd "$REPO_DIR"
fi

# Always ensure submodules are synced
git submodule update --init --recursive

# 3. Build the project inside a clean build directory
echo -e "${GREEN}[*] Creating clean build directory...${NC}"
rm -rf build
mkdir -p build
cd build

echo -e "${GREEN}[*] Running CMake configuration...${NC}"
cmake ..

echo -e "${GREEN}[*] Building AnyPS5 using all available CPU cores...${NC}"
cmake --build . -j$(nproc)

echo -e "${GREEN}==============================================${NC}"
echo -e "${GREEN}=== Build Completed Successfully! ==========O${NC}"
echo -e "${GREEN}==============================================${NC}"
echo -e "Binaries are located at: ${YELLOW}$(pwd)${NC}"
