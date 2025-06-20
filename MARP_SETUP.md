# Marp Setup Guide for VSCode

## 🎯 Overview

This guide explains how to use Marp preview with your Amazon Q CLI slides in VSCode.

## ✅ What's Been Configured

### 1. VSCode Extensions

- **Added**: `marp-team.marp-vscode` to `.vscode/extensions.json`
- **Auto-install**: Extension will be recommended when opening the workspace

### 2. VSCode Settings (`.vscode/settings.json`)

```json
{
  "markdown.marp.enabled": true,
  "markdown.marp.enableHtml": true,
  "markdown.marp.mathTypesetting": "katex",
  "markdown.marp.chromePath": "",
  "markdown.marp.exportType": "html",
  "markdown.marp.outlineExtension": true
}
```

### 3. DevContainer Configuration

- **Node.js**: Added to `.devcontainer/devcontainer.json`
- **Extensions**: Marp extension included in devcontainer
- **PostCreate**: Automatic installation of Marp CLI

### 4. Package Management

- **package.json**: Created with Marp CLI dependency
- **Scripts**: Added build commands for HTML/PDF generation

## 🚀 How to Use

### Option 1: VSCode Extension (It works with limitation rendering Mermaid Gantt)

1. **Install Extension**: `marp-team.marp-vscode`
2. **Open Slide File**: `src/slides.md`
3. **Open Preview**:
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Marp: Open Preview"
   - Or click the preview icon in the editor toolbar

### Option 2: Command Line (Recommended)

```bash
# Install dependencies (in devcontainer)
npm install

# Build HTML slides
npm run build

# Build PDF slides
npm run build:pdf

# Start preview server
npm run serve
```

## 🔧 Troubleshooting

### Preview Not Working?

1. **Check Extension**: Ensure `marp-team.marp-vscode` is installed
2. **Reload Window**: `Ctrl+Shift+P` → "Developer: Reload Window"
3. **Check Settings**: Verify `markdown.marp.enabled: true`

### Font Issues?

- Falls back to system fonts if Internet is unavailable

### DevContainer Issues?

1. **Rebuild Container**: `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"
2. **Check Node.js**: Run `node --version` in terminal
3. **Install Manually**: `npm install -g @marp-team/marp-cli`

## 📁 File Structure

```plaintext
├── .devcontainer/
│   ├── devcontainer.json     # Node.js + Marp extension
│   └── scripts/postCreate.sh # Auto-install Marp CLI
├── .vscode/
│   ├── extensions.json       # Marp extension recommendation
│   └── settings.json         # Marp configuration
├── docs/
│   └── index.html            # Generated HTML (auto-generated)
├── src/
│   └── slides.md             # Your slide deck
├── scripts/
│   └── test-marp.sh          # Test script
├── .marprc.yml               # Marp configuration
└── package.json             # Node.js dependencies
```

## 🎨 Slide Features

- **Theme**: Amazon-inspired dark theme
- **Colors**: Orange headers (#FF9900), white text, dark navy background
- **Diagrams**: Mermaid support for flowcharts, gantt charts
- **Code**: Syntax highlighting
- **Export**: HTML and PDF generation

## 🔗 Quick Commands

- **Preview**: `Ctrl+Shift+V` (with Marp extension)
- **Export HTML**: `Ctrl+Shift+P` → "Marp: Export slide deck"
- **Toggle Preview**: `Ctrl+K V`

Your Marp setup should now work perfectly in VSCode! 🎉
