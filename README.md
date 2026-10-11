<div align="center">

<!-- LOGO PLACEHOLDER — apna logo.png yahan daalein -->
<img src="/logo.png" alt="FLASH" width="140" height="140">

# ⚡ FLASH

**A Modern Android Remote Management Tool**

*Fast. Stealthy. Powerful.*

[![Platform](https://img.shields.io/badge/Platform-Termux%20%7C%20Linux-blue?style=for-the-badge&logo=linux)](https://termux.com)
[![Made With](https://img.shields.io/badge/Made%20With-Node.js-3c873a?style=for-the-badge&logo=node.js)](https://nodejs.org)
[![Version](https://img.shields.io/badge/Version-1.0-cyan?style=for-the-badge)](https://github.com/Athexblackhat2/flash)
[![License](https://img.shields.io/badge/License-Educational-red?style=for-the-badge)](#-disclaimer)

[📱 Features](#-features) •
[⚙️ Installation](#️-installation) •
[🔧 Setup](#-setup) •
[💬 Contact](#-contact) •
[⚠️ Disclaimer](#️-disclaimer)

</div>

---

## 📖 About

**FLASH** is a lightweight, powerful remote management framework built for **Termux** and **Linux**. It provides real-time monitoring and control of Android devices with a sleek, modern web dashboard.

Designed for **security researchers, ethical hackers, and developers** who want to learn about Android internals, network protocols, and remote management systems in a controlled lab environment.

> ⚡ **Fast setup, powerful features, clean dashboard.**

---

## 🎯 Available On

| Platform | Status | Notes |
|----------|--------|-------|
| **Termux** | ✅ Supported | Recommended (F-Droid version) |
| **Linux** | ✅ Supported | Debian, Ubuntu, Kali, Arch |
| **Windows (WSL)** | ⚠️ Partial | Tested with WSL2 |
| **macOS** | ❌ Not tested | — |

---

## ✨ Features

### 📍 Location & Tracking
- **GPS Logging** — Live location tracking with historical trail
- **Interactive Map** — Powered by Leaflet + OpenStreetMap
- **Date-based History** — View movement trails by day

### 🎙️ Media Capture
- **Microphone Recording** — Custom duration audio capture
- **Built-in Player** — Play recordings directly in the dashboard
- **File Downloads** — Save captures to your local machine

### 📱 Communication
- **SMS Logs** — Full SMS history with conversation view
- **Send SMS** — Compose and send from the target device
- **Call Logs** — Incoming, outgoing, missed calls
- **View Contacts** — Full contact list with quick call/SMS links

### 🌐 Network
- **WiFi Networks** — Current connection + historical logs
- **Signal Info** — BSSID, SSID tracking
- **File Explorer** — Browse device files remotely
- **File Downloader** — Pull any file from the device

### 📊 Data Collection
- **Clipboard Logging** — Live clipboard capture
- **Notification Logging** — Real-time notification feed
- **Installed Apps** — Full package list with versions
- **Stub Permissions** — See what's granted

### 🛠️ Tooling
- **Command Queuing** — Queue commands for offline devices
- **Built-in APK Builder** — Build custom APKs from the dashboard
- **Dark Neon UI** — Modern glassmorphic dashboard
- **Mobile Responsive** — Works on phone, tablet, desktop

---

## ⚙️ Installation

### 🚀 One-Line Install (Termux)

Copy and paste this into Termux:

```
apt-get update -y && \
apt-get upgrade -y && \
pkg install git -y && \
git clone https://github.com/Athexblackhat2/flash.git && \
cd flash && \
bash flash.
```

### 🐧 Linux Install

```
# Clone the repository
git clone https://github.com/Athexblackhat2/flash.git
cd flash

# Install Node.js (if not already)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install dependencies
npm install

# Start FLASH
bash flash.sh
```

### 📦 Requirements

- **Node.js** v14+ (v18+ recommended)
- **Git**
- **~500 MB** free storage
- **Termux** (F-Droid version, not Play Store)
- **Java 8** (for APK Builder)

---

## 🔧 Setup

After installation, follow these steps **one by one**:

### 1️⃣ Start the Server

```
cd
flash
```

> 🔴 **Press `Ctrl + C` to stop the FLASH server**

### 2️⃣ Credentials

| Field | Default Value |
|-------|---------------|
| Username | `athex` |
| Password | *athex* |


### 3️⃣ Launch FLASH

```bash
flash
```

Then open in your browser:

```
http://localhost:22533
```

### 4️⃣ Build a Payload

1. Login to the dashboard
2. Navigate to **APK Builder**
3. Enter your public IP/domain + control port (`22222` by default)
4. Click **Build** and download the APK
5. Install it on a test device in your lab

---

---

## 🎨 Dashboard Preview

FLASH features a **dark neon UI** with:

- 🌌 **Glassmorphic cards** with backdrop blur
- 💎 **Cyan → Purple** gradient accents
- ⚡ **Smooth animations** on every interaction
- 📱 **Fully responsive** — works perfectly on mobile
- 🌙 **Dark theme** — easy on the eyes

---

## 💬 Contact

<div align="center">

**Made with ❤️ by ATHEX BLACK HAT**

[![GitHub](https://img.shields.io/badge/GitHub-Athexblackhat2-181717?style=for-the-badge&logo=github)](https://github.com/Athexblackhat2)

</div>

### 💖 Support the Project

If you want this project to stay alive and updated, consider donating:

Every contribution — **code, bug reports, or a coffee** — keeps FLASH running.

---

## ⚠️ Disclaimer

> **This tool is provided for EDUCATIONAL and RESEARCH purposes ONLY.**

By using FLASH, you agree that:

- ✅ You will use it **only on devices you own** or have **explicit written permission** to test
- ✅ You understand that unauthorized access to devices is **illegal** in most countries
- ✅ You are aware of laws like **PECA 2016 (Pakistan)**, **IT Act 2000 (India)**, **CFAA (USA)**, and similar
- ❌ The author(s) **are not responsible** for any direct or indirect damage
- ❌ Any misuse of this software is **your own responsibility**

**Test only in controlled environments** — your own lab, your own devices, or authorized penetration testing engagements.

---

## 🙏 Credits

FLASH wouldn't exist without these amazing projects:

<table>
<tr>
<br />
<sub>Original inspiration</sub>
</td>
<td align="center" width="25%">
<a href="https://github.com/AhMyth/AhMyth-Android-RAT">
<img src="https://img.shields.io/badge/Inspiration-AhMyth-red?style=flat-square" />
</a>
<br />
<sub>Android client base</sub>
</td>
<td align="center" width="25%">
<a href="https://expressjs.com">
<img src="https://img.shields.io/badge/Web-Express-black?style=flat-square" />
</a>
<br />
<sub>Web framework</sub>
</td>
<td align="center" width="25%">
<a href="https://socket.io">
<img src="https://img.shields.io/badge/Realtime-Socket.io-white?style=flat-square&logo=socket.io" />
</a>
<br />
<sub>Live communication</sub>
</td>
</tr>
<tr>
<td align="center">
<a href="https://github.com/typicode/lowdb">
<img src="https://img.shields.io/badge/Database-Lowdb-yellow?style=flat-square" />
</a>
<br />
<sub>JSON storage</sub>
</td>
<td align="center">
<a href="https://leafletjs.com">
<img src="https://img.shields.io/badge/Maps-Leaflet-green?style=flat-square" />
</a>
<br />
<sub>Interactive maps</sub>
</td>
<td align="center">
<a href="https://www.openstreetmap.org">
<img src="https://img.shields.io/badge/Map_Data-OpenStreetMap-7EBC6F?style=flat-square" />
</a>
<br />
<sub>Map tiles</sub>
</td>
<td align="center">
<a href="https://github.com/bluesmoon/node-geoip">
<img src="https://img.shields.io/badge/GeoIP-node--geoip-orange?style=flat-square" />
</a>
<br />
<sub>IP geolocation</sub>
</td>
</tr>
</table>

---

<div align="center">

### ⭐ Star this repo if you found it useful!

**FLASH** — *Built for the curious, tested in the lab.*

</div>