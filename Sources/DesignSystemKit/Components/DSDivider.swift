//
//  DSDivider.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System divider component for separating content.
///
/// A simple separator line with consistent styling and orientation support.
///
/// ## Usage
/// ```swift
/// VStack {
///     Text("Section 1")
///     DSDivider()
///     Text("Section 2")
/// }
/// ```
public struct DSDivider: View {
    // MARK: - Orientation
    
    /// Divider orientation
    public enum Orientation {
        case horizontal
        case vertical
    }
    
    // MARK: - Properties
    
    private let orientation: Orientation
    private let thickness: CGFloat
    private let color: Color
    private let spacing: CGFloat
    
    // MARK: - Initialization
    
    /// Creates a design system divider
    /// - Parameters:
    ///   - orientation: Horizontal or vertical
    ///   - thickness: Line thickness
    ///   - color: Divider color
    ///   - spacing: Spacing around the divider
    public init(
        orientation: Orientation = .horizontal,
        thickness: CGFloat = DSTokens.borderWidth.hairline,
        color: Color = DSColor.Border.subtle,
        spacing: CGFloat = DSSpacing.medium
    ) {
        self.orientation = orientation
        self.thickness = thickness
        self.color = color
        self.spacing = spacing
    }
    
    // MARK: - Body
    
    public var body: some View {
        Group {
            switch orientation {
            case .horizontal:
                Rectangle()
                    .fill(color)
                    .frame(height: thickness)
                    .padding(.vertical, spacing)
            case .vertical:
                Rectangle()
                    .fill(color)
                    .frame(width: thickness)
                    .padding(.horizontal, spacing)
            }
        }
    }
}

// MARK: - Previews

#Preview("Divider Examples") {
    VStack(spacing: 0) {
        DSLabel("Section 1", variant: .headline)
        DSDivider()
        DSLabel("Section 2", variant: .headline)
        DSDivider(color: DSColor.Border.standard)
        DSLabel("Section 3", variant: .headline)
        
        HStack {
            DSLabel("Left", variant: .body)
            DSDivider(orientation: .vertical)
            DSLabel("Right", variant: .body)
        }
        .frame(height: 50)
    }
    .padding()
    .previewBothThemes()
}
