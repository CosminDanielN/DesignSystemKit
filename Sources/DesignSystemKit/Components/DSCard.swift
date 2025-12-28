//
//  DSCard.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System card component for grouping content.
///
/// A versatile container component with consistent padding, elevation, and optional tap action.
///
/// ## Usage
/// ```swift
/// DSCard {
///     VStack {
///         DSLabel("Title", variant: .headline)
///         DSLabel("Description", color: .secondary)
///     }
/// }
/// ```
public struct DSCard<Content: View>: View {
    // MARK: - Padding Variants
    
    /// Card padding variants
    public enum Padding {
        case none
        case small
        case medium
        case large
        
        var value: CGFloat {
            switch self {
            case .none: return 0
            case .small: return DSSpacing.small
            case .medium: return DSSpacing.medium
            case .large: return DSSpacing.xlarge
            }
        }
    }
    
    // MARK: - Properties
    
    private let content: Content
    private let padding: Padding
    private let cornerRadius: CGFloat
    private let elevation: Int
    private let backgroundColor: Color?
    private let action: (() -> Void)?
    
    // MARK: - Initialization
    
    /// Creates a design system card
    /// - Parameters:
    ///   - padding: Internal padding
    ///   - cornerRadius: Corner radius value
    ///   - elevation: Shadow elevation level (0-5)
    ///   - backgroundColor: Custom background color
    ///   - action: Optional tap action
    ///   - content: Card content
    public init(
        padding: Padding = .medium,
        cornerRadius: CGFloat = DSTokens.cornerRadius.medium,
        elevation: Int = 1,
        backgroundColor: Color? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.elevation = elevation
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Group {
            if let action {
                Button(action: action) {
                    cardContent
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                cardContent
            }
        }
    }
    
    private var cardContent: some View {
        content
            .padding(padding.value)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor ?? DSColor.Background.tertiary)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .elevation(elevation)
    }
}

// MARK: - Previews

#Preview("Card Variants") {
    VStack(spacing: DSSpacing.medium) {
        DSCard {
            VStack(alignment: .leading, spacing: DSSpacing.xsmall) {
                DSLabel("Card Title", variant: .headline)
                DSLabel("This is a card with default padding and elevation.", color: .secondary)
            }
        }
        
        DSCard(padding: .large, elevation: 3) {
            DSLabel("Large padding, higher elevation", variant: .headline)
        }
        
        DSCard(padding: .small, elevation: 0) {
            DSLabel("Flat card with small padding", variant: .body)
        }
        
        DSCard(action: {}) {
            HStack {
                DSLabel("Tappable Card", variant: .bodyEmphasized)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(DSColor.Text.tertiary)
            }
        }
    }
    .padding()
    .previewBothThemes()
}
