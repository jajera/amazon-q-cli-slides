#!/bin/bash

# Setup Chrome for containerized environments
echo "🔧 Setting up Chrome for PDF generation..."

# Check if Chrome is installed
if [ -f "/usr/bin/google-chrome-stable" ]; then
    echo "✅ Chrome found at /usr/bin/google-chrome-stable"
    export PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable
elif [ -f "/usr/bin/chromium-browser" ]; then
    echo "✅ Chromium found at /usr/bin/chromium-browser"
    export PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
else
    echo "❌ No suitable browser found for PDF generation"
    echo "Installing Chrome..."

    # Install Chrome if not present
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable

    export PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable
fi

# Test Chrome installation
echo "🧪 Testing Chrome installation..."
$PUPPETEER_EXECUTABLE_PATH --version --no-sandbox --disable-setuid-sandbox || echo "Chrome test failed, but continuing..."

echo "✅ Chrome setup complete!"
echo "PUPPETEER_EXECUTABLE_PATH=$PUPPETEER_EXECUTABLE_PATH"
