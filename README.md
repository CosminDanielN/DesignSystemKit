# DesignSystemKit

A local Swift package containing the design system components, tokens, and theming logic for the Lens application.

## Overview

This package encapsulates the visual language of the app, ensuring consistency and reusability across features. It is built with **SwiftUI** and supports both Light and Dark modes.

## Contents

### Tokens
Core primitives of the design system:
- **Colors (`DSColor`)**: Semantic color palette (e.g., `primary`, `background`, `error`).
- **Typography (`DSTypography`)**: Font styles and weights.
- **Spacing (`DSSpacing`)**: Standardized spacing grid (4pt, 8pt, 16pt, etc.).
- **Shadows (`DSShadow`)**: Elevation styles.

### Components
Reusable UI elements built using the tokens:
- Buttons
- Cards
- Inputs
- Loaders

### Theme
- **Theme Provider**: Logic for switching and applying themes.

## Usage

Import the module in your SwiftUI views:

```swift
import DesignSystemKit
import SwiftUI

struct MyView: View {
    var body: some View {
        Text("Hello")
            .font(DSTypography.headline)
            .foregroundStyle(DSColor.text.primary)
            .padding(DSSpacing.m)
    }
}
```

## Testing

Run unit tests directly for this package:

```bash
xcodebuild test -scheme DesignSystemKit -destination 'platform=iOS Simulator,name=iPhone 16 Pro'
```
