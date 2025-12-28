# DesignSystemKit

A professional, minimal, and beautiful design system for iOS applications, inspired by modern aesthetics (superlocaldesign.com, Linear, Arc). Built with native iOS elements using SwiftUI and Swift 6.

## Overview

DesignSystemKit provides a comprehensive set of design tokens, theme management, and UI components that work seamlessly across multiple applications. The system emphasizes a calm, neutral aesthetic with generous whitespace, clear typography, and subtle depth.

## Features

✨ **Complete Design Token System**
- Semantic color system with automatic light/dark themes
- Typography scale with native iOS fonts and Dynamic Type support
- 4pt grid-based spacing system
- Subtle shadow/elevation system
- Consistent corner radius, opacity, and border tokens

🎨 **Theme Management**
- Automatic theme switching based on system appearance
- Environment-based theme injection
- Preview helpers for development

🧩 **UI Component Library**
- **DSButton** - Primary, secondary, tertiary, and ghost variants
- **DSTextField** - Text input with validation and error states
- **DSLabel** - Semantic text display
- **DSCard** - Content container with elevation
- **DSDivider** - Horizontal and vertical separators
- **DSChip** - Tags and labels
- **DSProgressView** - Loading indicators

## Installation

### Swift Package Manager

Add DesignSystemKit to your project:

```swift
dependencies: [
    .package(path: "../Packages/DesignSystemKit")
]
```

## Quick Start

### 1. Apply Theme Provider

Add the theme provider to your app's root view:

```swift
import SwiftUI
import DesignSystemKit

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .withDSTheme()
        }
    }
}
```

### 2. Use Components

```swift
import DesignSystemKit

struct ContentView: View {
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: DSSpacing.large) {
            DSLabel("Welcome Back", variant: .title)
            
            DSTextField("Email", text: $email, placeholder: "Enter your email")
            
            DSButton("Continue", style: .primary) {
                // Handle action
            }
        }
        .padding(DSSpacing.Layout.screenEdge)
    }
}
```

### 3. Access Design Tokens

```swift
// Colors
let primaryText = DSColor.Text.primary
let accentColor = DSColor.Accent.primary
let backgroundColor = DSColor.Background.primary

// Typography
Text("Title")
    .font(DSTypography.Title.large)

// Spacing
VStack(spacing: DSSpacing.medium) {
    // Content
}
.padding(DSSpacing.large)

// Shadows
RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium)
    .fill(Color.white)
    .shadow(DSShadow.medium)
```

## Design Philosophy

### Minimal & Beautiful
Clean, modern aesthetics inspired by the best in contemporary design. Every element is refined and purposeful.

### Calm & Neutral
Soft color palettes and non-alarming visual language create a peaceful user experience. No aggressive colors or overwhelming contrasts.

### Clear & Readable
Excellent typography with a clear hierarchy ensures content is always legible and scannable.

### Theme-Aware
Seamless support for light and dark modes with carefully crafted color palettes for each.

### Accessible
WCAG AA compliant color contrasts, Dynamic Type support, and VoiceOver compatibility built in.

### Reusable
Designed as a standalone system that can be integrated into any iOS application, not just Lens.

## Documentation

- **[Brand Guidelines](Documentation/BRAND_GUIDELINES.md)** - Visual identity and design principles
- **[Component Guide](Documentation/COMPONENT_GUIDE.md)** - Detailed component usage
- **[Getting Started](Documentation/GETTING_STARTED.md)** - Integration and setup
- **[Image Generation](Documentation/ImageGeneration/)** - AI asset generation guides

## Architecture

The design system follows a layered architecture:

```
DesignSystemKit/
├── Tokens/              # Raw design values
│   ├── DSColor         # Color palette and semantic colors
│   ├── DSTypography    # Type scale and font styles
│   ├── DSSpacing       # Spacing and layout tokens
│   ├── DSShadow        # Shadow/elevation system
│   └── DSTokens        # Central token namespace
├── Theme/              # Theme system
│   ├── DSTheme         # Theme protocol and implementations
│   └── DSThemeProvider # Environment integration
└── Components/         # UI components
    ├── DSButton
    ├── DSTextField
    ├── DSLabel
    ├── DSCard
    ├── DSDivider
    ├── DSChip
    └── DSProgressView
```

## Requirements

- iOS 26.0+
- Swift 6.2+
- Xcode 16.0+

## License

Internal use only. Part of the Lens project.

## Version

Current version: **2.0.0**

---

Built with ❤️ for the Lens project and beyond.
