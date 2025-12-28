//
//  DSLabel.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System label component for semantic text display.
///
/// A text wrapper that provides consistent styling based on semantic meaning
/// and visual hierarchy, with support for different variants and colors.
///
/// ## Usage
/// ```swift
/// DSLabel("Headline", variant: .headline)
/// DSLabel("Body text", variant: .body, color: .secondary)
/// DSLabel("Caption text", variant: .caption, color: .tertiary)
/// ```
public struct DSLabel: View {
    // MARK: - Variant Styles
    
    /// Label variant defining style and typography
    public enum Variant {
        case title
        case headline
        case body
        case bodyEmphasized
        case caption
        case footnote
        
        var font: Font {
            switch self {
            case .title: return DSTypography.Title.medium
            case .headline: return DSTypography.Headline.medium
            case .body: return DSTypography.Body.medium
            case .bodyEmphasized: return DSTypography.Body.mediumEmphasized
            case .caption: return DSTypography.Caption.medium
            case .footnote: return DSTypography.Caption.small
            }
        }
    }
    
    /// Color variant
    public enum ColorVariant {
        case primary
        case secondary
        case tertiary
        case accent
        case success
        case warning
        case error
        
        var color: Color {
            switch self {
            case .primary: return DSColor.Text.primary
            case .secondary: return DSColor.Text.secondary
            case .tertiary: return DSColor.Text.tertiary
            case .accent: return DSColor.Accent.primary
            case .success: return DSColor.Status.success
            case .warning: return DSColor.Status.warning
            case .error: return DSColor.Status.error
            }
        }
    }
    
    // MARK: - Properties
    
    private let text: String
    private let variant: Variant
    private let colorVariant: ColorVariant
    private let alignment: TextAlignment
    private let lineLimit: Int?
    
    // MARK: - Initialization
    
    /// Creates a design system label
    /// - Parameters:
    ///   - text: The text to display
    ///   - variant: Style variant
    ///   - color: Color variant
    ///   - alignment: Text alignment
    ///   - lineLimit: Maximum number of lines
    public init(
        _ text: String,
        variant: Variant = .body,
        color: ColorVariant = .primary,
        alignment: TextAlignment = .leading,
        lineLimit: Int? = nil
    ) {
        self.text = text
        self.variant = variant
        self.colorVariant = color
        self.alignment = alignment
        self.lineLimit = lineLimit
    }
    
    // MARK: - Body
    
    public var body: some View {
        Text(text)
            .font(variant.font)
            .foregroundStyle(colorVariant.color)
            .multilineTextAlignment(alignment)
            .lineLimit(lineLimit)
    }
}

// MARK: - Previews

#Preview("Label Variants") {
    VStack(alignment: .leading, spacing: DSSpacing.medium) {
        DSLabel("Title Text", variant: .title)
        DSLabel("Headline Text", variant: .headline)
        DSLabel("Body Text", variant: .body)
        DSLabel("Emphasized Body", variant: .bodyEmphasized)
        DSLabel("Caption Text", variant: .caption)
        DSLabel("Footnote Text", variant: .footnote)
        
        Divider()
        
        DSLabel("Primary Color", color: .primary)
        DSLabel("Secondary Color", color: .secondary)
        DSLabel("Tertiary Color", color: .tertiary)
        DSLabel("Accent Color", color: .accent)
        DSLabel("Success Color", color: .success)
        DSLabel("Warning Color", color: .warning)
        DSLabel("Error Color", color: .error)
    }
    .padding()
    .previewBothThemes()
}
