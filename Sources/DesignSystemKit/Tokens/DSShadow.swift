//
//  DSShadow.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System shadow tokens for creating depth and elevation.
///
/// This structure provides subtle shadow presets that adapt to the current theme,
/// creating a calm, elegant sense of depth without being overpowering.
///
/// ## Shadow Philosophy
/// - Subtle and refined
/// - Theme-aware opacity
/// - Consistent elevation system
/// - Multiple shadow layers for realism
///
/// ## Usage
/// ```swift
/// RoundedRectangle(cornerRadius: 12)
///     .fill(Color.white)
///     .shadow(DSShadow.medium)
/// ```
public struct DSShadow {
    private init() {}
    
    // MARK: - Shadow Elevation Levels
    
    /// No shadow (flat surface)
    public static let none = ShadowStyle(
        color: .clear,
        radius: 0,
        x: 0,
        y: 0
    )
    
    /// Extra small shadow - Barely perceptible depth
    public static let xsmall = ShadowStyle(
        color: Color.black.opacity(0.04),
        radius: 2,
        x: 0,
        y: 1
    )
    
    /// Small shadow - Subtle elevation
    public static let small = ShadowStyle(
        color: Color.black.opacity(0.06),
        radius: 4,
        x: 0,
        y: 2
    )
    
    /// Medium shadow - Clear but calm elevation
    public static let medium = ShadowStyle(
        color: Color.black.opacity(0.08),
        radius: 8,
        x: 0,
        y: 4
    )
    
    /// Large shadow - Prominent elevation
    public static let large = ShadowStyle(
        color: Color.black.opacity(0.10),
        radius: 16,
        x: 0,
        y: 8
    )
    
    /// Extra large shadow - Maximum elevation
    public static let xlarge = ShadowStyle(
        color: Color.black.opacity(0.12),
        radius: 24,
        x: 0,
        y: 12
    )
    
    // MARK: - Multi-Layer Shadows (More Realistic)
    
    /// Small layered shadow with depth
    public static let smallLayered: [ShadowStyle] = [
        ShadowStyle(color: Color.black.opacity(0.04), radius: 2, x: 0, y: 1),
        ShadowStyle(color: Color.black.opacity(0.02), radius: 6, x: 0, y: 2)
    ]
    
    /// Medium layered shadow with depth
    public static let mediumLayered: [ShadowStyle] = [
        ShadowStyle(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 2),
        ShadowStyle(color: Color.black.opacity(0.03), radius: 12, x: 0, y: 4)
    ]
    
    /// Large layered shadow with depth
    public static let largeLayered: [ShadowStyle] = [
        ShadowStyle(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4),
        ShadowStyle(color: Color.black.opacity(0.04), radius: 20, x: 0, y: 8)
    ]
}

// MARK: - Shadow Style

/// Represents a single shadow configuration
public struct ShadowStyle: Sendable {
    /// Shadow color (with opacity)
    public let color: Color
    
    /// Shadow blur radius
    public let radius: CGFloat
    
    /// Horizontal offset
    public let x: CGFloat
    
    /// Vertical offset
    public let y: CGFloat
    
    /// Creates a shadow style
    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

// MARK: - View Extensions for Shadows

extension View {
    /// Apply a design system shadow
    /// - Parameter shadow: The shadow style to apply
    /// - Returns: Modified view with shadow
    
    @available(iOS 26, *)
    public func shadow(_ shadow: ShadowStyle) -> some View {
        self.shadow(
            color: shadow.color,
            radius: shadow.radius,
            x: shadow.x,
            y: shadow.y
        )
    }
    
    /// Apply multiple layered shadows for realistic depth
    /// - Parameter shadows: Array of shadow styles to apply
    /// - Returns: Modified view with layered shadows
    public func shadow(_ shadows: [ShadowStyle]) -> some View {
        var view: AnyView = AnyView(self)
        for shadow in shadows {
            view = AnyView(
                view.shadow(
                    color: shadow.color,
                    radius: shadow.radius,
                    x: shadow.x,
                    y: shadow.y
                )
            )
        }
        return view
    }
    
    /// Apply elevation-based shadow (uses theme-aware presets)
    /// - Parameter level: Elevation level (0-5)
    /// - Returns: Modified view with appropriate shadow
    public func elevation(_ level: Int) -> some View {
        switch level {
        case 0: return AnyView(self)
        case 1: return AnyView(self.shadow(DSShadow.xsmall))
        case 2: return AnyView(self.shadow(DSShadow.small))
        case 3: return AnyView(self.shadow(DSShadow.medium))
        case 4: return AnyView(self.shadow(DSShadow.large))
        case 5: return AnyView(self.shadow(DSShadow.xlarge))
        default: return AnyView(self.shadow(DSShadow.medium))
        }
    }
}
