//
//  DSChip.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System chip/tag component for labels and categories.
///
/// A compact component for displaying tags, labels, or selectable options.
///
/// ## Usage
/// ```swift
/// DSChip("Active", style: .filled)
/// DSChip("Removable", style: .outlined, isRemovable: true) {
///     print("Chip removed")
/// }
/// ```
public struct DSChip: View {
    // MARK: - Style Variants
    
    /// Chip style variants
    public enum Style {
        case filled
        case outlined
        case subtle
    }
    
    /// Chip size variants
    public enum Size {
        case small
        case medium
        case large
        
        var font: Font {
            switch self {
            case .small: return DSTypography.Label.small
            case .medium: return DSTypography.Label.medium
            case .large: return DSTypography.Label.large
            }
        }
        
        var padding: EdgeInsets {
            switch self {
            case .small:
                return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
            case .medium:
                return EdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
            case .large:
                return EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
            }
        }
    }
    
    // MARK: - Properties
    
    private let title: String
    private let style: Style
    private let size: Size
    private let icon: Image?
    private let isRemovable: Bool
    private let onRemove: (() -> Void)?
    
    // MARK: - Initialization
    
    /// Creates a design system chip
    /// - Parameters:
    ///   - title: Chip label
    ///   - style: Visual style variant
    ///   - size: Size variant
    ///   - icon: Optional leading icon
    ///   - isRemovable: Show remove button
    ///   - onRemove: Action when remove button tapped
    public init(
        _ title: String,
        style: Style = .filled,
        size: Size = .medium,
        icon: Image? = nil,
        isRemovable: Bool = false,
        onRemove: (() -> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.icon = icon
        self.isRemovable = isRemovable
        self.onRemove = onRemove
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack(spacing: DSSpacing.xxsmall) {
            if let icon {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
            }
            
            Text(title)
                .font(size.font)
            
            if isRemovable {
                Button(action: { onRemove?() }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 10, weight: .semibold))
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .foregroundStyle(textColor)
        .padding(size.padding)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: DSTokens.cornerRadius.full)
                .strokeBorder(borderColor, lineWidth: borderWidth)
        )
        .clipShape(RoundedRectangle(cornerRadius: DSTokens.cornerRadius.full))
    }
    
    // MARK: - Style Computed Properties
    
    private var backgroundColor: Color {
        switch style {
        case .filled:
            return DSColor.Accent.primary.opacity(DSTokens.opacity.light)
        case .outlined:
            return .clear
        case .subtle:
            return DSColor.Background.secondary
        }
    }
    
    private var textColor: Color {
        switch style {
        case .filled, .outlined:
            return DSColor.Accent.primary
        case .subtle:
            return DSColor.Text.primary
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .filled, .subtle:
            return .clear
        case .outlined:
            return DSColor.Accent.primary
        }
    }
    
    private var borderWidth: CGFloat {
        style == .outlined ? DSTokens.borderWidth.thin : 0
    }
}

// MARK: - Previews

#Preview("Chip Variants") {
    VStack(spacing: DSSpacing.medium) {
        HStack(spacing: DSSpacing.small) {
            DSChip("Filled", style: .filled)
            DSChip("Outlined", style: .outlined)
            DSChip("Subtle", style: .subtle)
        }
        
        HStack(spacing: DSSpacing.small) {
            DSChip("Small", size: .small)
            DSChip("Medium", size: .medium)
            DSChip("Large", size: .large)
        }
        
        DSChip("With Icon", icon: Image(systemName: "star.fill"))
        
        DSChip("Removable", isRemovable: true) {
            print("Removed")
        }
    }
    .padding()
    .previewBothThemes()
}
