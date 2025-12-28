//
//  DSSpacing.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System spacing tokens based on a 4pt grid system.
///
/// This structure provides consistent spacing values for padding, margins,
/// and gaps throughout the application, ensuring visual rhythm and breathability.
///
/// ## Spacing Philosophy
/// - 4pt base grid system
/// - Generous whitespace
/// - Consistent rhythm
/// - Scalable spacing scale
///
/// ## Usage
/// ```swift
/// VStack(spacing: DSSpacing.medium) {
///     Text("Item 1")
///         .padding(DSSpacing.small)
/// }
/// ```
public struct DSSpacing {
    private init() {}
    
    // MARK: - Core Spacing Scale (4pt grid)
    
    /// Extra extra small spacing (4pt)
    public static let xxsmall: CGFloat = 4
    
    /// Extra small spacing (8pt)
    public static let xsmall: CGFloat = 8
    
    /// Small spacing (12pt)
    public static let small: CGFloat = 12
    
    /// Medium spacing (16pt) - Default spacing
    public static let medium: CGFloat = 16
    
    /// Large spacing (20pt)
    public static let large: CGFloat = 20
    
    /// Extra large spacing (24pt)
    public static let xlarge: CGFloat = 24
    
    /// Extra extra large spacing (32pt)
    public static let xxlarge: CGFloat = 32
    
    /// Extra extra extra large spacing (40pt)
    public static let xxxlarge: CGFloat = 40
    
    /// Huge spacing (48pt)
    public static let huge: CGFloat = 48
    
    /// Extra huge spacing (64pt)
    public static let xhuge: CGFloat = 64
    
    // MARK: - Semantic Spacing
    
    /// Spacing for component internals
    public struct Component {
        /// Padding inside small components (8pt)
        public static let paddingSmall: CGFloat = DSSpacing.xsmall
        
        /// Padding inside medium components (16pt)
        public static let paddingMedium: CGFloat = DSSpacing.medium
        
        /// Padding inside large components (24pt)
        public static let paddingLarge: CGFloat = DSSpacing.xlarge
        
        /// Gap between elements in small components (8pt)
        public static let gapSmall: CGFloat = DSSpacing.xsmall
        
        /// Gap between elements in medium components (12pt)
        public static let gapMedium: CGFloat = DSSpacing.small
        
        /// Gap between elements in large components (16pt)
        public static let gapLarge: CGFloat = DSSpacing.medium
    }
    
    /// Spacing for layout sections
    public struct Layout {
        /// Small section spacing (16pt)
        public static let sectionSmall: CGFloat = DSSpacing.medium
        
        /// Medium section spacing (24pt)
        public static let sectionMedium: CGFloat = DSSpacing.xlarge
        
        /// Large section spacing (32pt)
        public static let sectionLarge: CGFloat = DSSpacing.xxlarge
        
        /// Extra large section spacing (40pt)
        public static let sectionXLarge: CGFloat = DSSpacing.xxxlarge
        
        /// Screen edge margins (16pt)
        public static let screenEdge: CGFloat = DSSpacing.medium
        
        /// Screen edge margins large (20pt)
        public static let screenEdgeLarge: CGFloat = DSSpacing.large
        
        /// Screen edge margins extra large (24pt)
        public static let screenEdgeXLarge: CGFloat = DSSpacing.xlarge
    }
    
    /// Spacing for content
    public struct Content {
        /// Vertical spacing between text elements (8pt)
        public static let textVertical: CGFloat = DSSpacing.xsmall
        
        /// Horizontal spacing between text and icon (8pt)
        public static let textIcon: CGFloat = DSSpacing.xsmall
        
        /// Spacing between form fields (16pt)
        public static let formField: CGFloat = DSSpacing.medium
        
        /// Spacing between related items (12pt)
        public static let relatedItems: CGFloat = DSSpacing.small
        
        /// Spacing between unrelated items (24pt)
        public static let unrelatedItems: CGFloat = DSSpacing.xlarge
    }
    
    // MARK: - Edge Insets
    
    /// Common edge inset configurations
    public struct Insets {
        /// No insets
        public static let none = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        /// Small insets (8pt all sides)
        public static let small = EdgeInsets(
            top: DSSpacing.xsmall,
            leading: DSSpacing.xsmall,
            bottom: DSSpacing.xsmall,
            trailing: DSSpacing.xsmall
        )
        
        /// Medium insets (16pt all sides)
        public static let medium = EdgeInsets(
            top: DSSpacing.medium,
            leading: DSSpacing.medium,
            bottom: DSSpacing.medium,
            trailing: DSSpacing.medium
        )
        
        /// Large insets (24pt all sides)
        public static let large = EdgeInsets(
            top: DSSpacing.xlarge,
            leading: DSSpacing.xlarge,
            bottom: DSSpacing.xlarge,
            trailing: DSSpacing.xlarge
        )
        
        /// Horizontal insets only (16pt)
        public static let horizontal = EdgeInsets(
            top: 0,
            leading: DSSpacing.medium,
            bottom: 0,
            trailing: DSSpacing.medium
        )
        
        /// Vertical insets only (16pt)
        public static let vertical = EdgeInsets(
            top: DSSpacing.medium,
            leading: 0,
            bottom: DSSpacing.medium,
            trailing: 0
        )
        
        /// Screen edge insets (16pt horizontal, 0 vertical)
        public static let screenEdge = EdgeInsets(
            top: 0,
            leading: DSSpacing.Layout.screenEdge,
            bottom: 0,
            trailing: DSSpacing.Layout.screenEdge
        )
    }
}

// MARK: - CGFloat Extension for Readability

extension CGFloat {
    /// Multiply spacing by a factor
    /// - Parameter factor: The multiplication factor
    /// - Returns: Scaled spacing value
    

    public func scaled(by factor: CGFloat) -> CGFloat {
        return self * factor
    }
}
