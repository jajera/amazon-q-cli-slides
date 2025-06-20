#!/bin/bash

# Build slides with proper Chrome setup
set -e

echo "🎬 Building Amazon Q CLI Slides..."

# Setup Chrome for PDF generation
source scripts/setup-chrome.sh

# Copy assets
echo "📁 Copying assets..."
mkdir -p docs
cp -r assets/* docs/ 2>/dev/null || echo "No assets to copy"

# Build HTML
echo "🌐 Building HTML slides..."
npx marp src/slides.md --html --allow-local-files --output docs/index.html

# Build PDF with fallback
echo "📄 Building PDF slides..."
if [ -n "$PUPPETEER_EXECUTABLE_PATH" ] && [ -f "$PUPPETEER_EXECUTABLE_PATH" ]; then
    echo "Using Chrome at: $PUPPETEER_EXECUTABLE_PATH"
    PUPPETEER_EXECUTABLE_PATH="$PUPPETEER_EXECUTABLE_PATH" npx marp src/slides.md --pdf --allow-local-files --output docs/slides.pdf
    echo "✅ PDF generated successfully!"
else
    echo "⚠️  Chrome not found, skipping PDF generation"
    echo "You can install Chrome and run: npm run build:pdf"
fi

echo "✅ Build complete!"
echo "📁 Output files:"
echo "  - docs/index.html (HTML slides)"
if [ -f "docs/slides.pdf" ]; then
    echo "  - docs/slides.pdf (PDF slides)"
fi
