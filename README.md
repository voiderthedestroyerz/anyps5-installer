AnyPS5 Installer for Linux Mint

Discord server: https://discord.gg/GNYmtZMwKB

An automated bash script that checks dependencies, installs required packages, initializes submodules, and compiles AnyPS5 from source on Linux Mint and Debian/Ubuntu-based systems.
📋 Requirements

Before running the installer, ensure you have:

    Operating System: Linux Mint 20+ (or Ubuntu 20.04+ / Debian 11+)

    Tooling: CMake 3.22 or newer, GCC/g++ with C++20 support, Git

    Hardware: Vulkan-capable GPU (to run converted binaries)

    Internet Connection (to download packages and repository submodules)

🚀 Quick Start

    Clone or download this repository:
    Bash

    git clone https://github.com/YOUR_USERNAME/anyps5-installer.git
    cd anyps5-installer

    Make the script executable:
    Bash

    chmod +x install_anyps5.sh

    Run the installer:
    Bash

    ./install_anyps5.sh

The script will handle package installation (apt), pull required submodules (such as SDL2), configure the CMake build tree, and compile the binaries. Once finished, compiled binaries will be available inside AnyPS5/build.
⚠️ Disclaimers & Notes

    Project Scope: AnyPS5 is NOT an emulator. It converts PS5 executables ahead-of-time (AOT) into native Linux PC executables.

    No Assets Included: This repository and the AnyPS5 project ship no Sony system libraries, proprietary code, or game assets. You must provide your own legally obtained PS5 binaries and PRX system libraries.

    Tested Titles: The project is in early development. Refer to the official repository for current compatibility lists.

📜 License

This installer script is provided as-is under the MIT License.

AnyPS5 itself is licensed separately under the GPL v2 License.
🙏 Credits & Acknowledgments

    AnyPS5 Core Developers: Full credit goes to boykopovar and the original contributors for creating AnyPS5.

    Disclaimer: This installer script was generated with the assistance of Google Gemini and is not officially maintained or endorsed by the AnyPS5 development team.
    
    Discord server: https://discord.gg/GNYmtZMwKB
