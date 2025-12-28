//
//  DSProgressView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System progress indicator component.
///
/// Provides both linear and circular progress indicators with determinate and indeterminate states.
///
/// ## Usage
/// ```swift
/// DSProgressView(value: 0.7, style: .linear)
/// DSProgressView(style: .circular) // Indeterminate
/// ```
public struct DSProgressView: View {
    // MARK: - Style Variants
    
    /// Progress view style
    public enum Style {
        case linear
        case circular
    }
    
    // MARK: - Properties
    
    private let value: Double?
    private let style: Style
    private let tint: Color
    
    // MARK: - Initialization
    
    /// Creates a design system progress view
    /// - Parameters:
    ///   - value: Progress value (0.0 to 1.0), nil for indeterminate
    ///   - style: Visual style (linear or circular)
    ///   - tint: Progress indicator color
    public init(
        value: Double? = nil,
        style: Style = .linear,
        tint: Color = DSColor.Accent.primary
    ) {
        self.value = value
        self.style = style
        self.tint = tint
    }
    
    // MARK: - Body
    
    public var body: some View {
        Group {
            switch style {
            case .linear:
                if let value {
                    ProgressView(value: value)
                        .tint(tint)
                } else {
                    ProgressView()
                        .tint(tint)
                }
            case .circular:
                if let value {
                    ProgressView(value: value)
                        .progressViewStyle(.circular)
                        .tint(tint)
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(tint)
                }
            }
        }
    }
}

// MARK: - Previews

#Preview("Progress View Variants") {
    VStack(spacing: DSSpacing.xlarge) {
        VStack(alignment: .leading, spacing: DSSpacing.small) {
            DSLabel("Linear Progress", variant: .caption)
            DSProgressView(value: 0.3, style: .linear)
            DSProgressView(value: 0.7, style: .linear)
            DSProgressView(style: .linear) // Indeterminate
        }
        
        VStack(spacing: DSSpacing.small) {
            DSLabel("Circular Progress", variant: .caption)
            DSProgressView(style: .circular)
        }
    }
    .padding()
    .previewBothThemes()
}
