#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
APP="build/LTFS Tape Manager for Mac.app"
mkdir -p "$APP/Contents/MacOS"
cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>LTFSTapeManager</string>
<key>CFBundleIdentifier</key><string>com.ltfs.tapemanager.mac</string>
<key>CFBundleName</key><string>LTFS Tape Manager for Mac</string>
<key>CFBundleDisplayName</key><string>LTFS Tape Manager for Mac</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>CFBundleShortVersionString</key><string>0.2.0</string>
<key>CFBundleVersion</key><string>2</string>
<key>LSMinimumSystemVersion</key><string>15.4</string>
<key>NSHighResolutionCapable</key><true/>
</dict></plist>
PLIST
swiftc -parse-as-library -framework SwiftUI -framework AppKit Sources/main.swift -o "$APP/Contents/MacOS/LTFSTapeManager"
codesign --force --sign - "$APP"
echo "Built: $(pwd)/$APP"
open "$APP"
