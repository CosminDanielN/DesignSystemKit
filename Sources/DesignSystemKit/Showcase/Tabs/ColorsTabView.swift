//
//  ColorsTabView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Colors showcase tab displaying the complete color palette.
public struct ColorsTabView: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DSSpacing.xxlarge) {
                // Header
                VStack(alignment: .leading, spacing: DSSpacing.small) {
                    DSLabel("Color Palette", variant: .title)
                    DSLabel("Soft, calm colors for a professional aesthetic", color: .secondary)
                }
                
                DSDivider()
                
                // Text Colors
                colorSection(
                    title: "Text Colors",
                    description: "Hierarchy through color weight",
                    colors: [
                        ("Primary", DSColor.Text.primary, "Highest emphasis"),
                        ("Secondary", DSColor.Text.secondary, "Medium emphasis"),
                        ("Tertiary", DSColor.Text.tertiary, "Lowest emphasis"),
                        ("Disabled", DSColor.Text.disabled, "Inactive text")
                    ]
                )
                
                DSDivider()
                
                // Background Colors
                colorSection(
                    title: "Backgrounds",
                    description: "Layered surface colors",
                    colors: [
                        ("Primary", DSColor.Background.primary, "App background"),
                        ("Secondary", DSColor.Background.secondary, "Elevated surfaces"),
                        ("Tertiary", DSColor.Background.tertiary, "Cards, containers"),
                        ("Elevated", DSColor.Background.elevated, "Modals, popovers")
                    ]
                )
                
                DSDivider()
                
                // Border Colors
                colorSection(
                    title: "Borders",
                    description: "Visual boundaries",
                    colors: [
                        ("Standard", DSColor.Border.standard, "Default borders"),
                        ("Subtle", DSColor.Border.subtle, "Light separation"),
                        ("Strong", DSColor.Border.strong, "Emphasis"),
                        ("Focused", DSColor.Border.focused, "Input focus")
                    ]
                )
                
                DSDivider()
                
                // Accent Colors
                colorSection(
                    title: "Accent Colors",
                    description: "Brand and interaction colors",
                    colors: [
                        ("Primary", DSColor.Accent.primary, "Main brand color"),
                        ("Secondary", DSColor.Accent.secondary, "Supporting accent"),
                        ("Tertiary", DSColor.Accent.tertiary, "Subtle accent"),
                        ("On Primary", DSColor.Accent.onPrimary, "Text on primary")
                    ]
                )
                
                DSDivider()
                
                // Status Colors
                VStack(alignment: .leading, spacing: DSSpacing.medium) {
                    DSLabel("Status Colors", variant: .headline)
                    DSLabel("Semantic states", variant: .caption, color: .secondary)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: DSSpacing.medium) {
                        statusColorCard("Success", color: DSColor.Status.success, bgColor: DSColor.Status.successBackground)
                        statusColorCard("Warning", color: DSColor.Status.warning, bgColor: DSColor.Status.warningBackground)
                        statusColorCard("Error", color: DSColor.Status.error, bgColor: DSColor.Status.errorBackground)
                        statusColorCard("Info", color: DSColor.Status.info, bgColor: DSColor.Status.infoBackground)
                    }
                }
            }
            .padding(.horizontal, DSSpacing.Layout.screenEdge)
            .padding(.vertical, DSSpacing.large)
        }
        .background(DSColor.Background.primary)
    }
    
    // MARK: - Helper Views
    
    private func colorSection(title: String, description: String, colors: [(String, Color, String)]) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.medium) {
            DSLabel(title, variant: .headline)
            DSLabel(description, variant: .caption, color: .secondary)
            
            VStack(spacing: DSSpacing.small) {
                ForEach(colors.indices, id: \.self) { index in
                    colorRow(
                        name: colors[index].0,
                        color: colors[index].1,
                        description: colors[index].2
                    )
                }
            }
        }
    }
    
    private func colorRow(name: String, color: Color, description: String) -> some View {
        HStack(spacing: DSSpacing.medium) {
            // Color swatch
            RoundedRectangle(cornerRadius: DSTokens.cornerRadius.small)
                .fill(color)
                .frame(width: 60, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: DSTokens.cornerRadius.small)
                        .strokeBorder(DSColor.Border.subtle, lineWidth: 1)
                )
            
            // Info
            VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
                DSLabel(name, variant: .bodyEmphasized)
                DSLabel(description, variant: .caption, color: .secondary)
            }
            
            Spacer()
        }
        .padding(DSSpacing.small)
        .background(DSColor.Background.secondary)
        .clipShape(RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium))
    }
    
    private func statusColorCard(_ name: String, color: Color, bgColor: Color) -> some View {
        VStack(spacing: DSSpacing.small) {
            RoundedRectangle(cornerRadius: DSTokens.cornerRadius.small)
                .fill(color)
                .frame(height: 50)
            
            DSLabel(name, variant: .caption)
        }
        .padding(DSSpacing.small)
        .background(bgColor)
        .clipShape(RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium))
    }
}

#Preview {
    ColorsTabView()
        .withDSTheme()
}
