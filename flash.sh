#!/data/data/com.termux/files/usr/bin/bash

#   FLASH RAT - Auto Installer & Launcher
#   Developed by ATHEX BLACK HAT

# Colors
R='\033[1;31m'; G='\033[1;32m'; Y='\033[1;33m'; B='\033[1;34m'
M='\033[1;35m'; C='\033[1;36m'; W='\033[1;37m'; NC='\033[0m'

clear
echo
printf "${C}"
for i in $(seq 1 60); do printf "═"; sleep 0.006; done
printf "${NC}\n"

flash_frames=(
"\033[1;31m  ███████╗██╗      █████╗ ███████╗██╗  ██╗"
"\033[1;35m  ██╔════╝██║     ██╔══██╗██╔════╝██║  ██║"
"\033[1;36m  █████╗  ██║     ███████║███████╗███████║"
"\033[1;32m  ██╔══╝  ██║     ██╔══██║╚════██║██╔══██║"
"\033[1;33m  ██║     ███████╗██║  ██║███████║██║  ██║"
"\033[1;34m  ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
)

for f in 1 2; do
    printf "\033[2J\033[H"
    for line in "${flash_frames[@]}"; do echo -e "$line"; done
    sleep 0.12
    printf "\033[2J\033[H"
    sleep 0.08
done

for line in "${flash_frames[@]}"; do
    echo -e "$line"
    sleep 0.06
done

echo
echo -e "${M}    ▓▒░${W}  ██████╗  █████╗ ████████╗ ${M}░▒▓${NC}"
sleep 0.08
echo -e "${C}    ▓▒░${Y}  ██╔══██╗██╔══██╗╚══██╔══╝ ${C}░▒▓${NC}"
sleep 0.08
echo -e "${G}    ▓▒░${W}  ██████╔╝███████║   ██║    ${G}░▒▓${NC}"
sleep 0.08
echo -e "${Y}    ▓▒░${M}  ██╔══██╗██╔══██║   ██║    ${Y}░▒▓${NC}"
sleep 0.08
echo -e "${R}    ▓▒░${C}  ██║  ██║██║  ██║   ██║    ${R}░▒▓${NC}"
sleep 0.08
echo -e "${B}    ▓▒░${G}  ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ${B}░▒▓${NC}"

echo
for i in 1 2; do
    echo -ne "\r${Y}⚡ DEVELOPED BY ${R}ATHEX BLACK HAT ${Y}⚡${NC}   "
    sleep 0.25
done
echo
echo

printf "${M}"
for i in $(seq 1 60); do printf "═"; sleep 0.006; done
printf "${NC}\n"
echo

IS_TERMUX=false
if [ -d "/data/data/com.termux" ]; then
    IS_TERMUX=true
fi

echo -e "${C}    ${W}Environment: ${G}$([ "$IS_TERMUX" = true ] && echo "Termux" || echo "Linux/Unix")${C}         ${NC}"
echo

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FILES_DIR="$SCRIPT_DIR/.files"

echo -e "${B}  [${G}i${B}]${W} Script folder: ${C}$SCRIPT_DIR${NC}"
echo -e "${B}  [${G}i${B}]${W} Source folder: ${C}$FILES_DIR${NC}"
echo

echo -e "${C}    ${Y}⚙  Checking System Dependencies...${C}      ${NC}"
echo

# Check for Node.js
if ! command -v node >/dev/null 2>&1; then
    echo -e "${Y}  [!] Node.js not found. Installing...${NC}"
    if [ "$IS_TERMUX" = true ]; then
        pkg install nodejs -y
    else
        echo -e "${R}  [✗] Node.js not installed!${NC}"
        echo -e "${Y}  → Install Node.js v14+ manually:${NC}"
        echo -e "${C}    Termux: ${W}pkg install nodejs${NC}"
        echo -e "${C}    Linux:  ${W}sudo apt install nodejs npm${NC}"
        echo -e "${C}    Windows: ${W}https://nodejs.org${NC}"
        exit 1
    fi
fi

# Check node version
NODE_VERSION=$(node -v 2>/dev/null | sed 's/v//' | cut -d. -f1)
echo -e "${G}  [✓] Node.js detected: ${W}$(node -v)${NC}"

# Check git
if ! command -v git >/dev/null 2>&1; then
    echo -e "${Y}  [!] Git not found. Installing...${NC}"
    if [ "$IS_TERMUX" = true ]; then
        pkg install git -y
    else
        echo -e "${R}  [✗] Git not installed!${NC}"
        exit 1
    fi
fi
echo -e "${G}  [✓] Git detected${NC}"

# Check for .files folder
if [ ! -d "$FILES_DIR" ]; then
    echo -e "${R}  [✗] ERROR: .files folder not found!${NC}"
    echo -e "${Y}  → Expected at: ${C}$FILES_DIR${NC}"
    exit 1
fi
echo -e "${G}  [✓] Source files found${NC}"

# Check for index.js
if [ ! -f "$FILES_DIR/index.js" ]; then
    echo -e "${R}  [✗] ERROR: index.js not found in .files${NC}"
    exit 1
fi
echo -e "${G}  [✓] Main entry point verified${NC}"

echo

echo -e "${C}    ${Y}📦 Installing Node.js Dependencies...${C}   ${NC}"
echo

cd "$FILES_DIR" || exit 1

if [ ! -d "node_modules" ]; then
    echo -e "${W}  → Running npm install...${NC}"
    echo
    npm install --silent 2>&1 | tail -5
    if [ $? -ne 0 ]; then
        echo -e "${Y}  [!] Retrying with --legacy-peer-deps...${NC}"
        npm install --legacy-peer-deps --silent 2>&1 | tail -5
    fi
    echo -e "${G}  [✓] Dependencies installed!${NC}"
else
    echo -e "${G}  [✓] Dependencies already installed${NC}"
fi

echo

echo -e "${C}    ${Y} Creating Global Shortcuts...${C}         ${NC}"
echo

if [ "$IS_TERMUX" = true ]; then
    # ===== TERMUX =====
    BIN_DIR="$PREFIX/bin"

    # Create flash and lemon launchers
    cat > "$BIN_DIR/flash" << LAUNCHER_EOF
#!/data/data/com.termux/files/usr/bin/bash
cd "$FILES_DIR" && node index.js
LAUNCHER_EOF

    cp "$BIN_DIR/flash" "$BIN_DIR/lemon"
    chmod +x "$BIN_DIR/flash" "$BIN_DIR/lemon"

    echo -e "${G}  [✓] Created: ${W}$BIN_DIR/flash${NC}"
    echo -e "${G}  [✓] Created: ${W}$BIN_DIR/lemon${NC}"

else
    # ===== LINUX / MINGW / UNIX =====
    BIN_DIR="$HOME/bin"
    mkdir -p "$BIN_DIR"

    # Create flash launcher
    cat > "$BIN_DIR/flash" << LAUNCHER_EOF
#!/bin/bash
cd "$FILES_DIR" && node index.js
LAUNCHER_EOF

    cp "$BIN_DIR/flash" "$BIN_DIR/lemon"
    chmod +x "$BIN_DIR/flash" "$BIN_DIR/lemon"

    echo -e "${G}  [✓] Created: ${W}$BIN_DIR/flash${NC}"
    echo -e "${G}  [✓] Created: ${W}$BIN_DIR/lemon${NC}"

    # Add ~/bin to PATH if not present
    case ":$PATH:" in
        *":$HOME/bin:"*)
            echo -e "${G}  [✓] ~/bin already in PATH${NC}"
            ;;
        *)
            if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null; then
                echo '' >> "$HOME/.bashrc"
                echo '# FLASH RAT - add ~/bin to PATH' >> "$HOME/.bashrc"
                echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
                echo -e "${G}  [✓] Added ~/bin to PATH (.bashrc)${NC}"
            fi
            export PATH="$HOME/bin:$PATH"
            ;;
    esac
fi

echo

if [ "$IS_TERMUX" = true ]; then
    echo -e "${C}    ${Y}🔧 Installing APK Builder Tools...${C}      ${NC}"
    echo

    # Install proot if not present
    if ! command -v proot >/dev/null 2>&1; then
        echo -e "${W}  → Installing proot...${NC}"
        pkg install proot -y >/dev/null 2>&1
    fi
    echo -e "${G}  [✓] proot ready${NC}"

    # Install wget if not present
    if ! command -v wget >/dev/null 2>&1; then
        echo -e "${W}  → Installing wget...${NC}"
        pkg install wget -y >/dev/null 2>&1
    fi
    echo -e "${G}  [✓] wget ready${NC}"

    # Install Java 8 if not present
    if ! command -v java >/dev/null 2>&1; then
        echo -e "${W}  → Installing Java 8 (required for APK Builder)...${NC}"
        cd "$HOME"
        if [ ! -d "$HOME/java8-termux" ]; then
            git clone https://github.com/Athexblackhat2/java8-termux.git >/dev/null 2>&1
        fi
        if [ -d "$HOME/java8-termux" ]; then
            cd "$HOME/java8-termux"
            if [ -f "java.sh" ]; then
                bash java.sh >/dev/null 2>&1
            fi
        fi
    fi
    if command -v java >/dev/null 2>&1; then
        echo -e "${G}  [✓] Java 8 ready${NC}"
    else
        echo -e "${Y}  [!] Java install skipped (optional for server)${NC}"
    fi

    echo
fi

clear
echo
printf "${G}"
for i in $(seq 1 60); do printf "═"; sleep 0.005; done
printf "${NC}\n"
echo
echo -e "${G}     ██╗    ██╗███████╗██╗     ██╗     ██████╗  ██████╗ ███╗   ██╗███████╗${NC}"
sleep 0.06
echo -e "${G}     ██║    ██║██╔════╝██║     ██║     ██╔══██╗██╔═══██╗████╗  ██║██╔════╝${NC}"
sleep 0.06
echo -e "${C}     ██║ █╗ ██║█████╗  ██║     ██║     ██║  ██║██║   ██║██╔██╗ ██║█████╗  ${NC}"
sleep 0.06
echo -e "${C}     ██║███╗██║██╔══╝  ██║     ██║     ██║  ██║██║   ██║██║╚██╗██║██╔══╝  ${NC}"
sleep 0.06
echo -e "${B}     ╚███╔███╔╝███████╗███████╗███████╗██████╔╝╚██████╔╝██║ ╚████║███████╗${NC}"
sleep 0.06
echo -e "${B}      ╚══╝╚══╝ ╚══════╝╚══════╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝${NC}"
echo
echo -e "${G}          INSTALLED SUCCESSFULLY....${W}[${G}✓${W}]${NC}"
echo
printf "${C}"
for i in $(seq 1 60); do printf "═"; sleep 0.005; done
printf "${NC}\n"
sleep 2.0
clear

echo
echo
echo -e "${C} ${Y}▶  ${W}Type ${G}flash${W} To Start Server  ${Y}◀  ${C}${NC}"
echo
echo

if [ "$IS_TERMUX" = false ]; then
    echo -e "${Y}  ⚠  You're on Linux/MINGW.${NC}"
    echo -e "${Y}     If ${G}flash${Y} doesn't work, run:${NC}"
    echo -e "${C}     source ~/.bashrc${NC}"
    echo -e "${C}     flash${NC}"
    echo
fi

echo -e "${G}  [√] ${C}Ready! Server will start with: ${Y}flash${NC}"
echo

echo -e "${W}  → Starting server now...${NC}"
echo
sleep 1
cd "$FILES_DIR" && node index.js