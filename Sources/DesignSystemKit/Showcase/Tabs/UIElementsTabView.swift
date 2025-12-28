//
//  UIElementsTabView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// UI Elements showcase tab displaying all design system components.
public struct UIElementsTabView: View {
    @State private var sampleText = ""
    @State private var samplePassword = ""
    @State private var sampleSearch = ""
    @State private var isLoading = false
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DSSpacing.xxlarge) {
                // Header
                VStack(alignment: .leading, spacing: DSSpacing.small) {
                    DSLabel("UI Elements", variant: .title)
                    DSLabel("All design system components", color: .secondary)
                }
                
                DSDivider()
                
                // Text Fields
                componentSection(title: "Text Fields") {
                    DSTextField("Email", text: $sampleText, placeholder: "you@example.com")
                    DSTextField("Password", text: $samplePassword, placeholder: "••••••••", isSecure: true)
                    DSTextField("Search", text: $sampleSearch, placeholder: "Search...", 
                               prefixIcon: Image(systemName: "magnifyingglass"))
                }
                
                DSDivider()
                
                // Buttons
                componentSection(title: "Buttons") {
                    VStack(spacing: DSSpacing.small) {
                        DSButton("Primary Button", style: .primary) { }
                        DSButton("Secondary Button", style: .secondary) { }
                        DSButton("Tertiary Button", style: .tertiary) { }
                        DSButton("Ghost Button", style: .ghost) { }
                        DSButton("Loading Button", style: .primary, isLoading: isLoading) {
                            isLoading = true
                            Task {
                                try? await Task.sleep(for: .seconds(2))
                                isLoading = false
                            }
                        }
                        DSButton("Disabled Button", style: .primary, isDisabled: true) { }
                    }
                }
                
                DSDivider()
                
                // Cards
                componentSection(title: "Cards") {
                    DSCard {
                        VStack(alignment: .leading, spacing: DSSpacing.xsmall) {
                            DSLabel("Simple Card", variant: .headline)
                            DSLabel("Default padding and elevation", color: .secondary)
                        }
                    }
                    
                    DSCard(elevation: 3, action: {}) {
                        HStack {
                            VStack(alignment: .leading) {
                                DSLabel("Tappable Card", variant: .bodyEmphasized)
                                DSLabel("With chevron", variant: .caption, color: .tertiary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(DSColor.Text.tertiary)
                        }
                    }
                }
                
                DSDivider()
                
                // Chips
                componentSection(title: "Chips & Tags") {
                    VStack(alignment: .leading, spacing: DSSpacing.medium) {
                        // Styles
                        HStack(spacing: DSSpacing.small) {
                            DSChip("Filled", style: .filled)
                            DSChip("Outlined", style: .outlined)
                            DSChip("Subtle", style: .subtle)
                        }
                        
                        // Sizes
                        HStack(spacing: DSSpacing.small) {
                            DSChip("Small", size: .small)
                            DSChip("Medium", size: .medium)
                            DSChip("Large", size: .large)
                        }
                    }
                }
                
                DSDivider()
                
                // Progress
                componentSection(title: "Progress Indicators") {
                    VStack(alignment: .leading, spacing: DSSpacing.medium) {
                        VStack(alignment: .leading, spacing: DSSpacing.xsmall) {
                            DSLabel("Linear Progress", variant: .caption, color: .secondary)
                            DSProgressView(value: 0.65, style: .linear)
                        }
                        
                        HStack(spacing: DSSpacing.xlarge) {
                            VStack(spacing: DSSpacing.xsmall) {
                                DSProgressView(style: .circular)
                                DSLabel("Loading", variant: .caption, color: .tertiary)
                            }
                        }
                    }
                }
                
                DSDivider()
                
                // Dividers
                componentSection(title: "Dividers") {
                    VStack(spacing: DSSpacing.medium) {
                        VStack(alignment: .leading, spacing: DSSpacing.xsmall) {
                            DSLabel("Horizontal", variant: .caption, color: .secondary)
                            DSDivider()
                        }
                        
                        HStack(spacing: DSSpacing.small) {
                            DSLabel("Vertical", variant: .caption, color: .secondary)
                            DSDivider(orientation: .vertical)
                                .frame(height: 30)
                            DSLabel("Separator", variant: .caption, color: .secondary)
                        }
                    }
                }
            }
            .padding(.horizontal, DSSpacing.Layout.screenEdge)
            .padding(.vertical, DSSpacing.large)
        }
        .background(DSColor.Background.primary)
    }
    
    // MARK: - Helper Views
    
    private func componentSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.medium) {
            DSLabel(title, variant: .headline)
            content()
        }
    }
}

#Preview {
    UIElementsTabView()
        .withDSTheme()
}
