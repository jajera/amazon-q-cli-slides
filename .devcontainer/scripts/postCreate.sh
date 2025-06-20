#!/bin/bash

# Include commands that you would like to execute after the container is created
echo "🚀 Setting up development environment..."
uname -a

# Install npm dependencies (same as GitHub workflow)
echo "📦 Installing Node.js dependencies..."
npm install

# Install Marp CLI globally as backup
echo "🎨 Installing Marp CLI..."
npm install -g @marp-team/marp-cli

# Make scripts executable
echo "🔧 Setting up scripts..."
chmod +x scripts/*.sh

# Create docs directory for build outputs
echo "📁 Creating build directory..."
mkdir -p docs

# Build slides like GitHub workflow
echo "🎬 Building slides (same as GitHub workflow)..."
echo "  Building HTML with Mermaid support..."
npx marp src/slides.md --html --allow-local-files --output docs/index.html

echo "  Building PDF version..."
npx marp src/slides.md --pdf --allow-local-files --output docs/slides.pdf

echo "✅ Development environment setup complete!"
echo ""
echo "📝 Available commands:"
echo "  npm run build      - Build HTML slides"
echo "  npm run build:pdf  - Build PDF slides"
echo "  npm run dev        - Start development server with watch"
echo "  npm run serve      - Serve slides locally"
echo ""
echo "📁 Project structure:"
echo "  src/slides.md      - Source markdown file"
echo "  docs/index.html    - HTML presentation (generated)"
echo "  docs/slides.pdf    - PDF version (generated)"
echo ""
echo "🌐 To test locally:"
echo "  npm run serve      - Then open http://localhost:8080"
echo "  npm run dev        - Auto-rebuild on changes"
