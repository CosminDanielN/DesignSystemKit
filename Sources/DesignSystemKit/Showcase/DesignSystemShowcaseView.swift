//
//  DesignSystemShowcaseView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Main showcase view with tab navigation for the Design System.
///
/// Displays 4 tabs:
/// - Typography: Text styles and hierarchy
/// - Colors: Complete color palette
/// - UI Elements: All components
/// - Scenarios: Real-world usage examples
public struct DesignSystemShowcaseView: View {
    @State private var selectedTab = 0
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            TypographyTabView()
                .tabItem {
                    Label("Typography", systemImage: "textformat")
                }
                .tag(0)
            
            ColorsTabView()
                .tabItem {
                    Label("Colors", systemImage: "paintpalette")
                }
                .tag(1)
            
            UIElementsTabView()
                .tabItem {
                    Label("UI Elements", systemImage: "square.grid.2x2")
                }
                .tag(2)
            
            ScenariosTabView()
                .tabItem {
                    Label("Scenarios", systemImage: "sparkles")
                }
                .tag(3)
        }
        .withDSTheme()
    }
}

#Preview {
    DesignSystemShowcaseView()
}
