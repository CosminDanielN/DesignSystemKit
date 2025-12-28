//
//  DSTokens.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Central namespace for all design tokens in the Design System.
///
/// This structure serves as the main entry point for accessing design tokens
/// including colors, typography, spacing, shadows, and other foundational elements.
///
/// ## Design Token Philosophy
/// - Single source of truth for design values
/// - Semantic naming over literal values
/// - Theme-aware where appropriate
/// - Scalable and maintainable
///
/// ## Usage
/// ```swift
/// // Accessing color tokens
/// let textColor = DSTokens.color.text.primary
///
/// // Accessing typography
/// let titleFont = DSTokens.typography.title.large
///
/// // Accessing spacing
/// let padding = DSTokens.spacing.medium
/// ```
public struct DSTokens {
    private init() {}
    
    /// Color token namespace
    public static let color = DSColor.self
    
    /// Typography token namespace
    public static let typography = DSTypography.self
    
    /// Spacing token namespace
    public static let spacing = DSSpacing.self
    
    /// Shadow token namespace
    public static let shadow = DSShadow.self
    
    // MARK: - Corner Radius
    
    /// Corner radius tokens for consistent rounded corners
    public struct CornerRadius {
        /// No rounding (0pt)
        public static let none: CGFloat = 0
        
        /// Extra small radius (4pt)
        public static let xsmall: CGFloat = 4
        
        /// Small radius (8pt)
        public static let small: CGFloat = 8
        
        /// Medium radius (12pt) - Default for most components
        public static let medium: CGFloat = 12
        
        /// Large radius (16pt)
        public static let large: CGFloat = 16
        
        /// Extra large radius (20pt)
        public static let xlarge: CGFloat = 20
        
        /// Extra extra large radius (24pt)
        public static let xxlarge: CGFloat = 24
        
        /// Full circle/pill (very large value)
        public static let full: CGFloat = 9999
    }
    
    /// Corner radius namespace
    public static let cornerRadius = CornerRadius.self
    
    // MARK: - Opacity/Alpha
    
    /// Opacity/alpha tokens for consistent transparency levels
    public struct Opacity {
        /// Fully transparent (0%)
        public static let transparent: Double = 0.0
        
        /// Extra light opacity (5%)
        public static let xlight: Double = 0.05
        
        /// Light opacity (10%)
        public static let light: Double = 0.10
        
        /// Medium opacity (30%)
        public static let medium: Double = 0.30
        
        /// Semi-transparent (50%)
        public static let semiTransparent: Double = 0.50
        
        /// Semi-opaque (70%)
        public static let semiOpaque: Double = 0.70
        
        /// Strong opacity (85%)
        public static let strong: Double = 0.85
        
        /// Nearly opaque (95%)
        public static let nearlyOpaque: Double = 0.95
        
        /// Fully opaque (100%)
        public static let opaque: Double = 1.0
    }
    
    /// Opacity namespace
    public static let opacity = Opacity.self
    
    // MARK: - Border Width
    
    /// Border width tokens
    public struct BorderWidth {
        /// Hairline border (0.5pt)
        public static let hairline: CGFloat = 0.5
        
        /// Thin border (1pt)
        public static let thin: CGFloat = 1
        
        /// Medium border (2pt)
        public static let medium: CGFloat = 2
        
        /// Thick border (3pt)
        public static let thick: CGFloat = 3
        
        /// Extra thick border (4pt)
        public static let extraThick: CGFloat = 4
    }
    
    /// Border width namespace
    public static let borderWidth = BorderWidth.self
    
    // MARK: - Animation Duration
    
    /// Animation duration tokens for consistent timing
    public struct Duration {
        /// Instant (0s)
        public static let instant: Double = 0.0
        
        /// Extra fast (0.1s)
        public static let xfast: Double = 0.1
        
        /// Fast (0.2s)
        public static let fast: Double = 0.2
        
        /// Normal (0.3s) - Default animation duration
        public static let normal: Double = 0.3
        
        /// Slow (0.5s)
        public static let slow: Double = 0.5
        
        /// Extra slow (0.8s)
        public static let xslow: Double = 0.8
    }
    
    /// Animation duration namespace
    public static let duration = Duration.self
    
    // MARK: - Icon Sizes
    
    /// Standard icon size tokens
    public struct IconSize {
        /// Extra small icon (12pt)
        public static let xsmall: CGFloat = 12
        
        /// Small icon (16pt)
        public static let small: CGFloat = 16
        
        /// Medium icon (20pt)
        public static let medium: CGFloat = 20
        
        /// Large icon (24pt)
        public static let large: CGFloat = 24
        
        /// Extra large icon (32pt)
        public static let xlarge: CGFloat = 32
        
        /// Extra extra large icon (40pt)
        public static let xxlarge: CGFloat = 40
    }
    
    /// Icon size namespace
    public static let iconSize = IconSize.self
}

// MARK: - View Extensions for Tokens

extension View {
    /// Apply standard corner radius
    /// - Parameter radius: Corner radius value from DSTokens.cornerRadius
    /// - Returns: Modified view with corner radius
    

    public func cornerRadius(_ radius: CGFloat) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: radius))
    }
    
    /// Apply border with design system tokens
    /// - Parameters:
    ///   - color: Border color
    ///   - width: Border width from DSTokens.borderWidth
    /// - Returns: Modified view with border
    public func border(_ color: Color, width: CGFloat) -> some View {
        self.overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(color, lineWidth: width)
        )
    }
}
