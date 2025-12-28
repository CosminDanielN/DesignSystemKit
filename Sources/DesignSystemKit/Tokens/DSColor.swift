//
//  DSColor.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

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
    
    // MARK: - Semantic Color Groups
    
    /// Text colors for different hierarchy levels
    public struct Text {
        /// Primary text color (highest emphasis)
        public static let primary = Color(hex: "1A1A1A")
        
        /// Secondary text color (medium emphasis)
        public static let secondary = Color(hex: "4A4A4A")
        
        /// Tertiary text color (lowest emphasis)
        public static let tertiary = Color(hex: "8A8A8A")
        
        /// Disabled text color
        public static let disabled = Color(hex: "BDBDBD")
        
        /// Inverse text (for dark backgrounds)
        public static let inverse = Color(hex: "FFFFFF")
    }
    
    /// Background colors for surfaces
    public struct Background {
        /// Primary background (app background)
        public static let primary = Color(hex: "FFFFFF")
        
        /// Secondary background (elevated surfaces)
        public static let secondary = Color(hex: "F8F9FA")
        
        /// Tertiary background (cards, containers)
        public static let tertiary = Color(hex: "F1F3F5")
        
        /// Elevated background (modals, popovers)
        public static let elevated = Color(hex: "FFFFFF")
    }
    
    /// Border and divider colors
    public struct Border {
        /// Standard border color
        public static let standard = Color(hex: "E1E4E8")
        
        /// Subtle border (less prominent)
        public static let subtle = Color(hex: "F0F2F5")
        
        /// Strong border (more prominent)
        public static let strong = Color(hex: "D1D5DB")
        
        /// Focused border (input fields)
        public static let focused = Color(hex: "4F7FF2")
    }
    
    /// Brand and accent colors
    public struct Accent {
        /// Primary brand color
        public static let primary = Color(hex: "4F7FF2")
        
        /// Secondary brand color
        public static let secondary = Color(hex: "6B93F5")
        
        /// Tertiary accent
        public static let tertiary = Color(hex: "A8C5F7")
        
        /// On primary (text/icons on primary background)
        public static let onPrimary = Color(hex: "FFFFFF")
    }
    
    /// Semantic status colors
    public struct Status {
        /// Success state (calm green)
        public static let success = Color(hex: "2D9F5E")
        
        /// Success background (subtle)
        public static let successBackground = Color(hex: "E6F7ED")
        
        /// Warning state (soft amber)
        public static let warning = Color(hex: "E89F3C")
        
        /// Warning background (subtle)
        public static let warningBackground = Color(hex: "FFF4E6")
        
        /// Error state (muted red)
        public static let error = Color(hex: "D85D5D")
        
        /// Error background (subtle)
        public static let errorBackground = Color(hex: "FFEAEA")
        
        /// Info state (soft blue)
        public static let info = Color(hex: "4F7FF2")
        
        /// Info background (subtle)
        public static let infoBackground = Color(hex: "E8F0FE")
    }
    
    /// Interactive element colors
    public struct Interactive {
        /// Default interactive state
        public static let `default` = Color(hex: "4F7FF2")
        
        /// Hover state
        public static let hover = Color(hex: "3D6FE0")
        
        /// Pressed state
        public static let pressed = Color(hex: "2B5FCE")
        
        /// Disabled state
        public static let disabled = Color(hex: "E1E4E8")
        
        /// Focus ring color
        public static let focus = Color(hex: "4F7FF2")
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
