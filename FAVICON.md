# Favicon Setup Guide

## 🎯 Overview

This guide explains how the favicon system works in your Marp slides and how to customize it.

## ✅ Current Setup

Your Marp presentation now includes a complete favicon setup:

### 🔧 **Technical Implementation**

1. **Custom HTML Template**: `templates/template.html`
   - Contains all favicon links in the `<head>` section
   - Includes meta tags for social sharing
   - Supports multiple favicon formats

2. **Favicon Source Files**: Located in `assets/` directory
   - `favicon.svg` - Modern SVG favicon (Amazon Q themed)
   - `favicon.ico` - Traditional ICO format (placeholder)
   - Other formats as needed

3. **Build Integration**: During build, assets are copied to `docs/`:

   ```bash
   npm run build  # Copies assets to docs/ and builds HTML
   ```

## 🎨 **Current Favicon**

The default favicon is an Amazon Q themed SVG:

- **Background**: Dark navy (`#232F3E`)
- **Circle**: Amazon orange (`#FF9900`)
- **Text**: Bold "Q" in dark navy

## 🔄 **How to Customize**

### Option 1: Replace the SVG (Easiest)

Edit `assets/favicon.svg` with your own design:

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <!-- Your custom design here -->
  <rect width="32" height="32" fill="#YourColor"/>
  <text x="16" y="20" text-anchor="middle">Q</text>
</svg>
```

### Option 2: Use PNG/ICO Files

1. Generate favicon files using:
   - [Favicon.io](https://favicon.io/)
   - [RealFaviconGenerator](https://realfavicongenerator.net/)

2. Add files to `assets/`:
   - `favicon.ico`
   - `favicon-32x32.png`
   - `favicon-16x16.png`
   - `apple-touch-icon.png`

3. Build process will copy them to `docs/` automatically

## 🚀 **Testing Your Favicon**

1. **Build slides**: `npm run build`
2. **Serve locally**: `npm run serve`
3. **Open browser**: `http://localhost:8080`
4. **Check browser tab**: Should show your favicon

## 📁 **File Structure**

```plaintext
├── assets/                      # Source files
│   ├── favicon.svg              # SVG favicon (source)
│   ├── favicon.ico              # ICO favicon (optional)
│   └── ...                      # Other favicon formats
├── docs/                        # Generated website (output)
│   ├── index.html               # Generated HTML slides
│   ├── slides.pdf               # Generated PDF
│   ├── favicon.svg              # Copied from assets/
│   └── ...                      # Other copied assets
├── templates/
│   └── template.html            # HTML template with favicon links
└── package.json                 # Build script
```

## 🌐 **GitHub Pages Deployment**

When you push to main:

1. GitHub Actions builds the slides
2. Assets are copied from `assets/` to `docs/`
3. Template is applied with favicon links
4. GitHub Pages serves everything from `docs/`

## 💡 **Pro Tips**

- **Keep source in `assets/`**: Never edit files directly in `docs/`
- **SVG is preferred**: Scales perfectly on all devices
- **Test locally**: Always test before pushing to main
- **Brand consistency**: Match your organization's colors

Your favicon will now appear in:

- Browser tabs
- Bookmarks
- History
- Mobile home screen (if saved)
- Social media previews

Perfect for professional presentations! 🎉
