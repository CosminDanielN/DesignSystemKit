//
//  TypographyTabView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Typography showcase tab displaying all text styles and variations.
public struct TypographyTabView: View {
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DSSpacing.xxlarge) {
                // Header
                VStack(alignment: .leading, spacing: DSSpacing.small) {
                    DSLabel("Typography", variant: .title)
                    DSLabel("A clear hierarchy for readable, accessible text", color: .secondary)
                }
                
                DSDivider()
                
                // Title Styles
                typographySection(
                    title: "Titles",
                    examples: [
                        (text: "Extra Large Title (34pt)", font: DSTypography.Title.extraLarge),
                        (text: "Large Title (28pt)", font: DSTypography.Title.large),
                        (text: "Medium Title (22pt)", font: DSTypography.Title.medium),
                        (text: "Small Title (20pt)", font: DSTypography.Title.small)
                    ]
                )
                
                DSDivider()
                
                // Headline Styles
                typographySection(
                    title: "Headlines",
                    examples: [
                        (text: "Large Headline (18pt)", font: DSTypography.Headline.large),
                        (text: "Medium Headline (17pt)", font: DSTypography.Headline.medium),
                        (text: "Small Headline (16pt)", font: DSTypography.Headline.small)
                    ]
                )
                
                DSDivider()
                
                // Body Styles
                typographySection(
                    title: "Body Text",
                    examples: [
                        (text: "Large Body (17pt) - Perfect for reading longer passages", font: DSTypography.Body.large),
                        (text: "Medium Body (15pt) - Default reading size", font: DSTypography.Body.medium),
                        (text: "Small Body (14pt) - Compact information", font: DSTypography.Body.small),
                        (text: "Emphasized Body (17pt) - Important information", font: DSTypography.Body.largeEmphasized)
                    ]
                )
                
                DSDivider()
                
                // Caption & Footnote
                typographySection(
                    title: "Captions & Footnotes",
                    examples: [
                        (text: "Large Caption (13pt) - Metadata", font: DSTypography.Caption.large),
                        (text: "Medium Caption (12pt) - Helper text", font: DSTypography.Caption.medium),
                        (text: "Small Caption (11pt) - Fine print", font: DSTypography.Caption.small)
                    ]
                )
                
                DSDivider()
                
                // Button & Label Text
                VStack(alignment: .leading, spacing: DSSpacing.medium) {
                    DSLabel("Buttons & Labels", variant: .headline)
                    
                    VStack(alignment: .leading, spacing: DSSpacing.small) {
                        Text("Large Button Text (17pt)")
                            .font(DSTypography.Button.large)
                        Text("Medium Button Text (15pt)")
                            .font(DSTypography.Button.medium)
                        Text("Small Button Text (13pt)")
                            .font(DSTypography.Button.small)
                    }
                }
                
                DSDivider()
                
                // Line Heights
                VStack(alignment: .leading, spacing: DSSpacing.medium) {
                    DSLabel("Line Heights", variant: .headline)
                    DSLabel("Line height affects readability and spacing", variant: .caption, color: .secondary)
                    
                    VStack(alignment: .leading, spacing: DSSpacing.medium) {
                        lineHeightExample("Tight (1.2x)", lineHeight: DSTypography.LineHeight.tight)
                        lineHeightExample("Normal (1.4x)", lineHeight: DSTypography.LineHeight.normal)
                        lineHeightExample("Relaxed (1.6x)", lineHeight: DSTypography.LineHeight.relaxed)
                    }
                }
            }
            .padding(.horizontal, DSSpacing.Layout.screenEdge)
            .padding(.vertical, DSSpacing.large)
        }
        .background(DSColor.Background.primary)
    }
    
    // MARK: - Helper Views
    
    private func typographySection(title: String, examples: [(text: String, font: Font)]) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.medium) {
            DSLabel(title, variant: .headline)
            
            VStack(alignment: .leading, spacing: DSSpacing.small) {
                ForEach(examples.indices, id: \.self) { index in
                    Text(examples[index].text)
                        .font(examples[index].font)
                        .foregroundStyle(DSColor.Text.primary)
                }
            }
        }
    }
    
    private func lineHeightExample(_ title: String, lineHeight: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
            DSLabel(title, variant: .caption, color: .tertiary)
            Text("The quick brown fox jumps over the lazy dog. Pack my box with five dozen liquor jugs.")
                .font(DSTypography.Body.medium)
                .lineSpacing(lineHeight - 1.0)
                .foregroundStyle(DSColor.Text.primary)
        }
    }
}

#Preview {
    TypographyTabView()
        .withDSTheme()
}
