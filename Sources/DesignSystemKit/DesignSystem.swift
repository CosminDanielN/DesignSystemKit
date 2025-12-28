//
//  DesignSystemKit.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import Foundation
import SwiftUI

/// Main entry point for the DesignSystemKit module.
///
/// DesignSystemKit is a comprehensive, professional design system inspired by minimal,
/// beautiful modern aesthetics (superlocaldesign.com, Linear, Arc). It provides a complete
/// set of design tokens, theme management, and UI components built with native iOS elements.
///
/// ## Design Philosophy
/// The design system follows these core principles:
/// - **Minimal & Beautiful**: Clean, modern aesthetics with generous whitespace
/// - **Calm & Neutral**: Soft colors and non-alarming visual language
/// - **Clear & Readable**: Excellent typography with clear hierarchy
/// - **Theme-Aware**: Seamless light/dark mode support
/// - **Accessible**: WCAG AA compliant with Dynamic Type support
/// - **Reusable**: Built for use across multiple applications
///
/// ## Quick Start
///
/// ### 1. Add Theme Provider
/// ```swift
/// import SwiftUI
/// import DesignSystemKit
///
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             ContentView()
///                 .withDSTheme()
///         }
///     }
/// }
/// ```
///
/// ### 2. Use Components
/// ```swift
/// import DesignSystemKit
///
/// struct ContentView: View {
///     @State private var text = ""
///     
///     var body: some View {
///         VStack(spacing: DSSpacing.large) {
///             DSLabel("Welcome", variant: .title)
///             DSTextField("Email", text: $text, placeholder: "Enter email")
///             DSButton("Continue", style: .primary) {
///                 print("Tapped")
///             }
///         }
///         .padding(DSSpacing.Layout.screenEdge)
///     }
/// }
/// ```
///
/// ### 3. Access Design Tokens
/// ```swift
/// // Colors
/// let textColor = DSColor.Text.primary
/// let accentColor = DSColor.Accent.primary
///
/// // Typography
/// Text("Headline")
///     .font(DSTypography.Headline.large)
///
/// // Spacing
/// VStack(spacing: DSSpacing.medium) { }
///
/// // Shadows
/// RoundedRectangle(cornerRadius: 12)
///     .shadow(DSShadow.medium)
/// ```
///
/// ## Available Components
/// - `DSButton` - Buttons with multiple styles (primary, secondary, tertiary, ghost)
/// - `DSTextField` - Text input with label, error states, and validation
/// - `DSLabel` - Semantic text display with variants
/// - `DSCard` - Content container with elevation
/// - `DSDivider` - Horizontal and vertical separators
/// - `DSChip` - Tags and labels with removable option
/// - `DSProgressView` - Linear and circular progress indicators
///
/// ## Design Tokens
/// - **Colors**: Semantic color system with light/dark themes
/// - **Typography**: Clear hierarchy with native iOS fonts
/// - **Spacing**: 4pt grid system for consistent rhythm
/// - **Shadows**: Subtle elevation system
/// - **Corner Radius**: Consistent rounding values
/// - **Opacity**: Standard transparency levels
///
/// ## Theme System
/// Automatic theme switching based on system appearance:
/// - `DSTheme` - Theme protocol
/// - `DSLightTheme` - Light theme implementation
/// - `DSDarkTheme` - Dark theme implementation
/// - `DSThemeManager` - Theme state management
/// - `DSThemeProvider` - Environment integration
///
/// ## Documentation
/// For detailed documentation, see:
/// - `BRAND_GUIDELINES.md` - Brand vision and visual identity
/// - `COMPONENT_GUIDE.md` - Component usage and best practices
/// - `GETTING_STARTED.md` - Setup and integration guide
///
/// ## Version
/// Current version: 2.0.0
public struct DesignSystemKit {
    /// The current version of the design system.
    public static let version = "2.0.0"
    
    private init() {}
}
