#!/bin/bash

# Test Marp functionality
echo "🧪 Testing Marp functionality..."

# Check if Marp CLI is available
if ! command -v marp &>/dev/null; then
    echo "⚠️  Marp CLI not found. Installing..."
    npm install -g @marp-team/marp-cli
fi

# Generate HTML from the slide deck
echo "📝 Generating HTML slides..."
marp docs/index.md --html --output docs/slides.html --allow-local-files

if [ $? -eq 0 ]; then
    echo "✅ Marp slides generated successfully!"
    echo "📄 Output: docs/slides.html"
else
    echo "❌ Marp generation failed. Check your slide syntax."
fi

# Optional: Generate PDF (requires Chrome/Chromium)
if command -v google-chrome &>/dev/null || command -v chromium &>/dev/null; then
    echo "📄 Generating PDF slides..."
    marp docs/index.md --pdf --output docs/slides.pdf --allow-local-files
    if [ $? -eq 0 ]; then
        echo "✅ PDF slides generated successfully!"
        echo "📄 Output: docs/slides.pdf"
    fi
else
    echo "⚠️  Chrome/Chromium not found. PDF generation skipped."
fi
