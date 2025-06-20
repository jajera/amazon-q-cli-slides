# Amazon Q CLI Slides

This repository contains Marp slides about Amazon Q CLI with Mermaid diagram support.

## Features

- 🎯 Amazon Q CLI overview presentation
- 📊 Interactive Mermaid diagrams
- 🎨 AWS-themed styling
- 📱 Responsive design
- 🚀 Automated GitHub Pages deployment

## Local Development

### Prerequisites

- Node.js 18+
- npm

### Setup

1. Clone the repository
2. Install dependencies:

   ```bash
   npm install
   ```

### Building

- **HTML**: `npm run build`
- **PDF**: `npm run build:pdf`
- **Development server**: `npm run dev`
- **Serve locally**: `npm run serve`

## Deployment

The slides are automatically deployed to GitHub Pages when you push to the main branch. The workflow:

1. Builds the HTML with Mermaid support
2. Generates a PDF version
3. Deploys to GitHub Pages

## File Structure

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

## Customization

To customize the presentation:

1. Edit `src/slides.md`
2. Modify the CSS in the frontmatter for styling
3. Update Mermaid theme configuration in the script section
4. Run `npm run build` to regenerate

## GitHub Pages Setup

1. Go to repository Settings > Pages
2. Source: GitHub Actions
3. The workflow will automatically deploy on push to main

## License

MIT License
