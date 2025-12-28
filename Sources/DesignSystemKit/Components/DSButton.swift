//
//  DSButton.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System button with multiple style variants.
///
/// A flexible button component that supports different styles, sizes, and states,
/// all following the design system's minimal and beautiful aesthetic.
///
/// ## Usage
/// ```swift
/// DSButton("Continue", style: .primary) {
///     print("Button tapped")
/// }
///
/// DSButton("Cancel", style: .secondary, icon: .leading(Image(systemName: "xmark"))) {
///     dismiss()
/// }
/// ```
public struct DSButton: View {
    // MARK: - Style Variants
    
    /// Button style variants
    public enum Style {
        /// Primary filled button (most prominent)
        case primary
        
        /// Secondary outlined button
        case secondary
        
        /// Tertiary text-only button
        case tertiary
        
        /// Ghost transparent button
        case ghost
    }
    
    /// Button size variants
    public enum Size {
        case small
        case medium
        case large
        
        var height: CGFloat {
            switch self {
            case .small: return 36
            case .medium: return 44
            case .large: return 52
            }
        }
        
        var font: Font {
            switch self {
            case .small: return DSTypography.Button.small
            case .medium: return DSTypography.Button.medium
            case .large: return DSTypography.Button.large
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .small: return DSSpacing.medium
            case .medium: return DSSpacing.large
            case .large: return DSSpacing.xlarge
            }
        }
    }
    
    /// Icon position
    public enum IconPosition {
        case leading(Image)
        case trailing(Image)
    }
    
    // MARK: - Properties
    
    private let title: String
    private let style: Style
    private let size: Size
    private let icon: IconPosition?
    private let isLoading: Bool
    private let isDisabled: Bool
    private let action: () -> Void
    
    @State private var isPressed = false
    
    // MARK: - Initialization
    
    /// Creates a design system button
    /// - Parameters:
    ///   - title: Button label text
    ///   - style: Visual style variant
    ///   - size: Size variant
    ///   - icon: Optional icon with position
    ///   - isLoading: Loading state
    ///   - isDisabled: Disabled state
    ///   - action: Action to perform on tap
    public init(
        _ title: String,
        style: Style = .primary,
        size: Size = .medium,
        icon: IconPosition? = nil,
        isLoading: Bool = false,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.icon = icon
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: DSSpacing.xsmall) {
                if isLoading {
                    ProgressView()
                        .tint(textColor)
                } else {
                    if case .leading(let image) = icon {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: DSTokens.iconSize.small, height: DSTokens.iconSize.small)
                    }
                    
                    Text(title)
                        .font(size.font)
                    
                    if case .trailing(let image) = icon {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: DSTokens.iconSize.small, height: DSTokens.iconSize.small)
                    }
                }
            }
            .foregroundStyle(textColor)
            .frame(height: size.height)
            .padding(.horizontal, size.horizontalPadding)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium)
                    .strokeBorder(borderColor, lineWidth: borderWidth)
            )
            .clipShape(RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium))
            .shadow(shadowStyle)
            .opacity(isDisabled || isLoading ? DSTokens.opacity.semiTransparent : DSTokens.opacity.opaque)
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: DSTokens.duration.fast), value: isPressed)
        }
        .disabled(isDisabled || isLoading)
        .buttonStyle(PressableButtonStyle(isPressed: $isPressed))
        .accessibilityLabel(title)
        .accessibilityHint(isLoading ? "Loading" : "")
        .accessibilityAddTraits(isDisabled ? [.isButton, .isStaticText] : .isButton)
    }
    
    // MARK: - Style Computed Properties
    
    private var backgroundColor: Color {
        switch style {
        case .primary:
            return isPressed ? DSColor.Interactive.pressed : DSColor.Accent.primary
        case .secondary:
            return DSColor.Background.secondary
        case .tertiary, .ghost:
            return .clear
        }
    }
    
    private var textColor: Color {
        switch style {
        case .primary:
            return DSColor.Accent.onPrimary
        case .secondary, .tertiary, .ghost:
            return DSColor.Accent.primary
        }
    }
    
    private var borderColor: Color {
        switch style {
        case .primary, .ghost, .tertiary:
            return .clear
        case .secondary:
            return DSColor.Border.standard
        }
    }
    
    private var borderWidth: CGFloat {
        switch style {
        case .secondary:
            return DSTokens.borderWidth.thin
        default:
            return 0
        }
    }
    
    private var shadowStyle: ShadowStyle {
        switch style {
        case .primary:
            return DSShadow.small
        default:
            return DSShadow.none
        }
    }
}

// MARK: - Custom Button Style

private struct PressableButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed) { _, pressed in
                isPressed = pressed
            }
    }
}

// MARK: - Previews

#Preview("Button Variants") {
    VStack(spacing: DSSpacing.medium) {
        DSButton("Primary Button", style: .primary) {}
        DSButton("Secondary Button", style: .secondary) {}
        DSButton("Tertiary Button", style: .tertiary) {}
        DSButton("Ghost Button", style: .ghost) {}
        
        DSButton("With Icon", style: .primary, icon: .leading(Image(systemName: "star.fill"))) {}
        DSButton("Loading", style: .primary, isLoading: true) {}
        DSButton("Disabled", style: .primary, isDisabled: true) {}
    }
    .padding()
    .previewBothThemes()
}
