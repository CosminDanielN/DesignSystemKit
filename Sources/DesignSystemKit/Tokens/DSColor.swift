//
//  DSColor.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI
import UIKit

/// Design System color tokens with theme-aware semantic naming.
///
/// This structure provides a comprehensive color system that adapts to light and dark themes,
/// inspired by minimal, modern aesthetics with soft neutrals and subtle accents.
///
/// ## Color Philosophy
/// - Soft, non-alarming colors
/// - Clear contrast for readability
/// - Calm, neutral palette
/// - Subtle depth through grays
/// - WCAG AA compliant contrast ratios
///
/// ## Usage
/// ```swift
/// Text("Hello")
///     .foregroundStyle(DSColor.text.primary)
///     .background(DSColor.background.primary)
/// ```
public struct DSColor {
    private init() {}
    
    /// Creates a color that dynamically adapts to the user interface style
    private static func adaptiveColor(light: Color, dark: Color) -> Color {
        Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }
    
    // MARK: - Semantic Color Groups
    
    /// Text colors for different hierarchy levels
    public struct Text {
        /// Primary text color (highest emphasis)
        public static let primary = adaptiveColor(light: Light.textPrimary, dark: Dark.textPrimary)
        
        /// Secondary text color (medium emphasis)
        public static let secondary = adaptiveColor(light: Light.textSecondary, dark: Dark.textSecondary)
        
        /// Tertiary text color (lowest emphasis)
        public static let tertiary = adaptiveColor(light: Light.textTertiary, dark: Dark.textTertiary)
        
        /// Disabled text color
        public static let disabled = adaptiveColor(light: Light.textDisabled, dark: Dark.textDisabled)
        
        /// Inverse text (for dark backgrounds)
        public static let inverse = adaptiveColor(light: Light.textInverse, dark: Dark.textInverse)
    }
    
    /// Background colors for surfaces
    public struct Background {
        /// Primary background (app background)
        public static let primary = adaptiveColor(light: Light.backgroundPrimary, dark: Dark.backgroundPrimary)
        
        /// Secondary background (elevated surfaces)
        public static let secondary = adaptiveColor(light: Light.backgroundSecondary, dark: Dark.backgroundSecondary)
        
        /// Tertiary background (cards, containers)
        public static let tertiary = adaptiveColor(light: Light.backgroundTertiary, dark: Dark.backgroundTertiary)
        
        /// Elevated background (modals, popovers)
        public static let elevated = adaptiveColor(light: Light.backgroundElevated, dark: Dark.backgroundElevated)
    }
    
    /// Border and divider colors
    public struct Border {
        /// Standard border color
        public static let standard = adaptiveColor(light: Light.borderStandard, dark: Dark.borderStandard)
        
        /// Subtle border (less prominent)
        public static let subtle = adaptiveColor(light: Light.borderSubtle, dark: Dark.borderSubtle)
        
        /// Strong border (more prominent)
        public static let strong = adaptiveColor(light: Light.borderStrong, dark: Dark.borderStrong)
        
        /// Focused border (input fields)
        public static let focused = adaptiveColor(light: Light.borderFocused, dark: Dark.borderFocused)
    }
    
    /// Brand and accent colors
    public struct Accent {
        /// Primary brand color
        public static let primary = adaptiveColor(light: Light.accentPrimary, dark: Dark.accentPrimary)
        
        /// Secondary brand color
        public static let secondary = adaptiveColor(light: Light.accentSecondary, dark: Dark.accentSecondary)
        
        /// Tertiary accent
        public static let tertiary = adaptiveColor(light: Light.accentTertiary, dark: Dark.accentTertiary)
        
        /// On primary (text/icons on primary background)
        public static let onPrimary = adaptiveColor(light: Light.accentOnPrimary, dark: Dark.accentOnPrimary)
    }
    
    /// Semantic status colors
    public struct Status {
        /// Success state (calm green)
        public static let success = adaptiveColor(light: Light.statusSuccess, dark: Dark.statusSuccess)
        
        /// Success background (subtle)
        public static let successBackground = adaptiveColor(light: Light.statusSuccessBg, dark: Dark.statusSuccessBg)
        
        /// Warning state (soft amber)
        public static let warning = adaptiveColor(light: Light.statusWarning, dark: Dark.statusWarning)
        
        /// Warning background (subtle)
        public static let warningBackground = adaptiveColor(light: Light.statusWarningBg, dark: Dark.statusWarningBg)
        
        /// Error state (muted red)
        public static let error = adaptiveColor(light: Light.statusError, dark: Dark.statusError)
        
        /// Error background (subtle)
        public static let errorBackground = adaptiveColor(light: Light.statusErrorBg, dark: Dark.statusErrorBg)
        
        /// Info state (soft blue)
        public static let info = adaptiveColor(light: Light.statusInfo, dark: Dark.statusInfo)
        
        /// Info background (subtle)
        public static let infoBackground = adaptiveColor(light: Light.statusInfoBg, dark: Dark.statusInfoBg)
    }
    
    /// Interactive element colors
    public struct Interactive {
        /// Default interactive state
        public static let `default` = adaptiveColor(light: Light.interactiveDefault, dark: Dark.interactiveDefault)
        
        /// Hover state
        public static let hover = adaptiveColor(light: Light.interactiveHover, dark: Dark.interactiveHover)
        
        /// Pressed state
        public static let pressed = adaptiveColor(light: Light.interactivePressed, dark: Dark.interactivePressed)
        
        /// Disabled state
        public static let disabled = adaptiveColor(light: Light.interactiveDisabled, dark: Dark.interactiveDisabled)
        
        /// Focus ring color
        public static let focus = adaptiveColor(light: Light.interactiveFocus, dark: Dark.interactiveFocus)
    }
    
    // MARK: - Direct Color Values (for asset catalogs)
    
    /// Light theme color values
    public struct Light {
        // Text
        public static let textPrimary = Color(hex: "1A1A1A")           // Near black
        public static let textSecondary = Color(hex: "4A4A4A")         // Dark gray
        public static let textTertiary = Color(hex: "8A8A8A")          // Medium gray
        public static let textDisabled = Color(hex: "BDBDBD")          // Light gray
        public static let textInverse = Color(hex: "FFFFFF")           // White
        
        // Background
        public static let backgroundPrimary = Color(hex: "FFFFFF")     // White
        public static let backgroundSecondary = Color(hex: "F8F9FA")   // Off-white
        public static let backgroundTertiary = Color(hex: "F1F3F5")    // Light gray
        public static let backgroundElevated = Color(hex: "FFFFFF")    // White with shadow
        
        // Border
        public static let borderStandard = Color(hex: "E1E4E8")        // Light gray
        public static let borderSubtle = Color(hex: "F0F2F5")          // Very light gray
        public static let borderStrong = Color(hex: "D1D5DB")          // Medium gray
        public static let borderFocused = Color(hex: "4F7FF2")         // Soft blue
        
        // Accent
        public static let accentPrimary = Color(hex: "4F7FF2")         // Soft blue
        public static let accentSecondary = Color(hex: "6B93F5")       // Light blue
        public static let accentTertiary = Color(hex: "A8C5F7")        // Pale blue
        public static let accentOnPrimary = Color(hex: "FFFFFF")       // White
        
        // Status
        public static let statusSuccess = Color(hex: "2D9F5E")         // Calm green
        public static let statusSuccessBg = Color(hex: "E6F7ED")       // Light green
        public static let statusWarning = Color(hex: "E89F3C")         // Soft amber
        public static let statusWarningBg = Color(hex: "FFF4E6")       // Light amber
        public static let statusError = Color(hex: "D85D5D")           // Muted red
        public static let statusErrorBg = Color(hex: "FFEAEA")         // Light red
        public static let statusInfo = Color(hex: "4F7FF2")            // Soft blue
        public static let statusInfoBg = Color(hex: "E8F0FE")          // Light blue
        
        // Interactive
        public static let interactiveDefault = Color(hex: "4F7FF2")    // Soft blue
        public static let interactiveHover = Color(hex: "3D6FE0")      // Medium blue
        public static let interactivePressed = Color(hex: "2B5FCE")    // Deep blue
        public static let interactiveDisabled = Color(hex: "E1E4E8")   // Light gray
        public static let interactiveFocus = Color(hex: "4F7FF2")      // Soft blue
    }
    
    /// Dark theme color values
    public struct Dark {
        // Text
        public static let textPrimary = Color(hex: "FFFFFF")           // White
        public static let textSecondary = Color(hex: "B4B4B4")         // Light gray
        public static let textTertiary = Color(hex: "7A7A7A")          // Medium gray
        public static let textDisabled = Color(hex: "4A4A4A")          // Dark gray
        public static let textInverse = Color(hex: "1A1A1A")           // Near black
        
        // Background
        public static let backgroundPrimary = Color(hex: "0D0D0D")     // Near black
        public static let backgroundSecondary = Color(hex: "1A1A1A")   // Dark gray
        public static let backgroundTertiary = Color(hex: "252525")    // Medium dark
        public static let backgroundElevated = Color(hex: "2A2A2A")    // Elevated dark
        
        // Border
        public static let borderStandard = Color(hex: "3A3A3A")        // Medium gray
        public static let borderSubtle = Color(hex: "2A2A2A")          // Dark gray
        public static let borderStrong = Color(hex: "4A4A4A")          // Light gray
        public static let borderFocused = Color(hex: "5B8CF5")         // Soft blue
        
        // Accent
        public static let accentPrimary = Color(hex: "5B8CF5")         // Soft blue
        public static let accentSecondary = Color(hex: "7AA2F7")       // Light blue
        public static let accentTertiary = Color(hex: "4F7FF2")        // Medium blue
        public static let accentOnPrimary = Color(hex: "0D0D0D")       // Near black
        
        // Status
        public static let statusSuccess = Color(hex: "3FB870")         // Calm green
        public static let statusSuccessBg = Color(hex: "1A2E23")       // Dark green
        public static let statusWarning = Color(hex: "F5B55F")         // Soft amber
        public static let statusWarningBg = Color(hex: "2E2419")       // Dark amber
        public static let statusError = Color(hex: "E87777")           // Muted red
        public static let statusErrorBg = Color(hex: "2E1A1A")         // Dark red
        public static let statusInfo = Color(hex: "5B8CF5")            // Soft blue
        public static let statusInfoBg = Color(hex: "1A2340")          // Dark blue
        
        // Interactive
        public static let interactiveDefault = Color(hex: "5B8CF5")    // Soft blue
        public static let interactiveHover = Color(hex: "7AA2F7")      // Light blue
        public static let interactivePressed = Color(hex: "97B6F9")    // Pale blue
        public static let interactiveDisabled = Color(hex: "3A3A3A")   // Dark gray
        public static let interactiveFocus = Color(hex: "5B8CF5")      // Soft blue
    }
}

// MARK: - Color Extension for Hex Support

extension Color {
    /// Creates a color from a hex string (e.g., "FF0000" or "#FF0000")
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
