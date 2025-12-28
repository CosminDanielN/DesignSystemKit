//
//  DSTypography.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System typography tokens with native iOS Font integration.
///
/// This structure provides a clear typographic hierarchy optimized for readability
/// and visual clarity, with full support for Dynamic Type and accessibility.
///
/// ## Typography Philosophy
/// - Clear hierarchy
/// - Excellent readability
/// - Generous line heights
/// - Subtle letter spacing
/// - Dynamic Type support
///
/// ## Usage
/// ```swift
/// Text("Headline")
///     .font(DSTypography.title.large)
///
/// Text("Body text")
///     .font(DSTypography.body.medium)
/// ```
public struct DSTypography {
    private init() {}
    
    // MARK: - Font Weights
    
    /// Typography weights
    public enum Weight {
        case regular
        case medium
        case semibold
        case bold
        
        var fontWeight: Font.Weight {
            switch self {
            case .regular: return .regular
            case .medium: return .medium
            case .semibold: return .semibold
            case .bold: return .bold
            }
        }
    }
    
    // MARK: - Title Styles
    
    /// Large title styles for major headings
    public struct Title {
        /// Extra large title (34pt)
        public static let extraLarge = Font.system(size: 34, weight: .bold, design: .default)
        
        /// Large title (28pt)
        public static let large = Font.system(size: 28, weight: .bold, design: .default)
        
        /// Medium title (22pt)
        public static let medium = Font.system(size: 22, weight: .semibold, design: .default)
        
        /// Small title (20pt)
        public static let small = Font.system(size: 20, weight: .semibold, design: .default)
    }
    
    // MARK: - Headline Styles
    
    /// Headline styles for section headers
    public struct Headline {
        /// Large headline (18pt)
        public static let large = Font.system(size: 18, weight: .semibold, design: .default)
        
        /// Medium headline (17pt)
        public static let medium = Font.system(size: 17, weight: .semibold, design: .default)
        
        /// Small headline (16pt)
        public static let small = Font.system(size: 16, weight: .semibold, design: .default)
    }
    
    // MARK: - Body Styles
    
    /// Body text styles for main content
    public struct Body {
        /// Large body (17pt)
        public static let large = Font.system(size: 17, weight: .regular, design: .default)
        
        /// Medium body (15pt) - Default reading size
        public static let medium = Font.system(size: 15, weight: .regular, design: .default)
        
        /// Small body (14pt)
        public static let small = Font.system(size: 14, weight: .regular, design: .default)
        
        /// Emphasized body (17pt, medium weight)
        public static let largeEmphasized = Font.system(size: 17, weight: .medium, design: .default)
        
        /// Emphasized body (15pt, medium weight)
        public static let mediumEmphasized = Font.system(size: 15, weight: .medium, design: .default)
    }
    
    // MARK: - Caption and Footnote Styles
    
    /// Caption and footnote styles for secondary information
    public struct Caption {
        /// Large caption (13pt)
        public static let large = Font.system(size: 13, weight: .regular, design: .default)
        
        /// Medium caption (12pt)
        public static let medium = Font.system(size: 12, weight: .regular, design: .default)
        
        /// Small caption (11pt)
        public static let small = Font.system(size: 11, weight: .regular, design: .default)
        
        /// Emphasized caption (13pt, medium weight)
        public static let emphasized = Font.system(size: 13, weight: .medium, design: .default)
    }
    
    // MARK: - Button Styles
    
    /// Typography for buttons
    public struct Button {
        /// Large button (17pt)
        public static let large = Font.system(size: 17, weight: .semibold, design: .default)
        
        /// Medium button (15pt)
        public static let medium = Font.system(size: 15, weight: .semibold, design: .default)
        
        /// Small button (13pt)
        public static let small = Font.system(size: 13, weight: .semibold, design: .default)
    }
    
    // MARK: - Label Styles
    
    /// Typography for labels and tags
    public struct Label {
        /// Large label (14pt)
        public static let large = Font.system(size: 14, weight: .medium, design: .default)
        
        /// Medium label (12pt)
        public static let medium = Font.system(size: 12, weight: .medium, design: .default)
        
        /// Small label (11pt)
        public static let small = Font.system(size: 11, weight: .medium, design: .default)
    }
    
    // MARK: - Line Height
    
    /// Line height multipliers for different text sizes
    public struct LineHeight {
        /// Tight line height (1.2x)
        public static let tight: CGFloat = 1.2
        
        /// Normal line height (1.4x)
        public static let normal: CGFloat = 1.4
        
        /// Relaxed line height (1.6x)
        public static let relaxed: CGFloat = 1.6
        
        /// Loose line height (1.8x)
        public static let loose: CGFloat = 1.8
    }
    
    // MARK: - Letter Spacing
    
    /// Letter spacing (tracking) values
    public struct LetterSpacing {
        /// Tight tracking (-0.5pt)
        public static let tight: CGFloat = -0.5
        
        /// Normal tracking (0pt)
        public static let normal: CGFloat = 0
        
        /// Wide tracking (0.5pt)
        public static let wide: CGFloat = 0.5
        
        /// Extra wide tracking (1pt)
        public static let extraWide: CGFloat = 1.0
    }
}

// MARK: - View Extensions for Typography

extension View {
    /// Apply a text style with custom line height
    /// - Parameters:
    ///   - font: The font to apply
    ///   - lineHeight: Line height multiplier (default: 1.4)
    /// - Returns: Modified view with font and line spacing
    
    public func textStyle(_ font: Font, lineHeight: CGFloat = DSTypography.LineHeight.normal) -> some View {
        self
            .font(font)
            .lineSpacing(lineHeight - 1.0)
    }
    
    /// Apply letter spacing to text
    /// - Parameter spacing: The tracking value
    /// - Returns: Modified view with letter spacing
    public func letterSpacing(_ spacing: CGFloat) -> some View {
        self.tracking(spacing)
    }
}
