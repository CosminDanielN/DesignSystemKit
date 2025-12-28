//
//  ScenariosTabView.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Scenarios showcase tab displaying real-world usage examples.
public struct ScenariosTabView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var selectedPlan = "Premium"
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DSSpacing.xxlarge) {
                // Header
                VStack(alignment: .leading, spacing: DSSpacing.small) {
                    DSLabel("Real-World Scenarios", variant: .title)
                    DSLabel("See the design system in action", color: .secondary)
                }
                
                DSDivider()
                
                // Scenario 1: Login Form
                scenarioCard(title: "Login Form", description: "Authentication screen") {
                    VStack(spacing: DSSpacing.large) {
                        VStack(alignment: .leading, spacing: DSSpacing.small) {
                            DSLabel("Welcome Back", variant: .title)
                            DSLabel("Sign in to continue", color: .secondary)
                        }
                        
                        VStack(spacing: DSSpacing.medium) {
                            DSTextField("Email", text: $email, placeholder: "you@example.com")
                            DSTextField("Password", text: $password, placeholder: "••••••••", isSecure: true)
                        }
                        
                        VStack(spacing: DSSpacing.small) {
                            DSButton("Sign In", style: .primary) { }
                            DSButton("Forgot Password?", style: .ghost) { }
                        }
                    }
                }
                
                // Scenario 2: Profile Card
                scenarioCard(title: "Profile Card", description: "User information display") {
                    DSCard {
                        HStack(spacing: DSSpacing.medium) {
                            Circle()
                                .fill(DSColor.Accent.primary)
                                .frame(width: 60, height: 60)
                                .overlay(
                                    DSLabel("JD", color: .primary)
                                        .font(DSTypography.Headline.large)
                                        .foregroundStyle(DSColor.Accent.onPrimary)
                                )
                            
                            VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
                                DSLabel("John Doe", variant: .headline)
                                DSLabel("john.doe@example.com", variant: .caption, color: .secondary)
                                HStack(spacing: DSSpacing.xsmall) {
                                    DSChip("Premium", style: .filled, size: .small)
                                    DSChip("Verified", style: .subtle, size: .small)
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
                
                // Scenario 3: Dashboard Widget
                scenarioCard(title: "Stats Widget", description: "Dashboard metric card") {
                    DSCard(elevation: 2) {
                        VStack(spacing: DSSpacing.medium) {
                            HStack {
                                VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
                                    DSLabel("Daily Average", variant: .caption, color: .secondary)
                                    DSLabel("3.2 hours", variant: .title)
                                }
                                Spacer()
                                Circle()
                                    .fill(DSColor.Status.successBackground)
                                    .frame(width: 48, height: 48)
                                    .overlay(
                                        Image(systemName: "chart.line.uptrend.xyaxis")
                                            .foregroundStyle(DSColor.Status.success)
                                    )
                            }
                            
                            DSDivider()
                            
                            HStack {
                                metricItem(label: "Trend", value: "+12%", color: .success)
                                Spacer()
                                metricItem(label: "Peak", value: "4:30 PM", color: .primary)
                            }
                        }
                    }
                }
                
                // Scenario 4: Settings Item
                scenarioCard(title: "Settings List Item", description: "Navigation row") {
                    VStack(spacing: 0) {
                        settingsRow(icon: "bell.fill", title: "Notifications", subtitle: "Manage alerts")
                        settingsRow(icon: "lock.fill", title: "Privacy", subtitle: "Data controls")
                        settingsRow(icon: "paintpalette.fill", title: "Appearance", subtitle: "Theme settings")
                    }
                }
                
                // Scenario 5: Empty State
                scenarioCard(title: "Empty State", description: "No content placeholder") {
                    VStack(spacing: DSSpacing.large) {
                        Circle()
                            .fill(DSColor.Background.tertiary)
                            .frame(width: 80, height: 80)
                            .overlay(
                                Image(systemName: "tray")
                                    .font(.system(size: 40))
                                    .foregroundStyle(DSColor.Text.tertiary)
                            )
                        
                        VStack(spacing: DSSpacing.small) {
                            DSLabel("No Data Yet", variant: .headline)
                            DSLabel("Start tracking to see insights here", color: .secondary, alignment: .center)
                        }
                        
                        DSButton("Get Started", style: .primary) { }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, DSSpacing.xlarge)
                }
                
                // Scenario 6: Alert Messages
                scenarioCard(title: "Status Messages", description: "Alerts and notifications") {
                    VStack(spacing: DSSpacing.medium) {
                        statusMessage(type: .success, message: "Settings saved successfully")
                        statusMessage(type: .warning, message: "Your trial expires in 3 days")
                        statusMessage(type: .error, message: "Failed to sync data")
                        statusMessage(type: .info, message: "New features available")
                    }
                }
            }
            .padding(.horizontal, DSSpacing.Layout.screenEdge)
            .padding(.vertical, DSSpacing.large)
        }
        .background(DSColor.Background.primary)
    }
    
    // MARK: - Helper Views
    
    private func scenarioCard<Content: View>(title: String, description: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.medium) {
            VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
                DSLabel(title, variant: .headline)
                DSLabel(description, variant: .caption, color: .tertiary)
            }
            
            content()
        }
    }
    
    private func metricItem(label: String, value: String, color: DSLabel.ColorVariant) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
            DSLabel(label, variant: .caption, color: .tertiary)
            DSLabel(value, variant: .bodyEmphasized, color: color)
        }
    }
    
    private func settingsRow(icon: String, title: String, subtitle: String) -> some View {
        DSCard(padding: .medium, elevation: 0, action: {}) {
            HStack(spacing: DSSpacing.medium) {
                Circle()
                    .fill(DSColor.Accent.primary.opacity(0.1))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 16))
                            .foregroundStyle(DSColor.Accent.primary)
                    )
                
                VStack(alignment: .leading, spacing: DSSpacing.xxsmall) {
                    DSLabel(title, variant: .bodyEmphasized)
                    DSLabel(subtitle, variant: .caption, color: .tertiary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundStyle(DSColor.Text.tertiary)
            }
        }
    }
    
    private enum StatusType {
        case success, warning, error, info
        
        var color: Color {
            switch self {
            case .success: return DSColor.Status.success
            case .warning: return DSColor.Status.warning
            case .error: return DSColor.Status.error
            case .info: return DSColor.Status.info
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .success: return DSColor.Status.successBackground
            case .warning: return DSColor.Status.warningBackground
            case .error: return DSColor.Status.errorBackground
            case .info: return DSColor.Status.infoBackground
            }
        }
        
        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            case .error: return "xmark.circle.fill"
            case .info: return "info.circle.fill"
            }
        }
    }
    
    private func statusMessage(type: StatusType, message: String) -> some View {
        HStack(spacing: DSSpacing.small) {
            Image(systemName: type.icon)
                .foregroundStyle(type.color)
            DSLabel(message, variant: .caption)
            Spacer()
        }
        .padding(DSSpacing.small)
        .background(type.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: DSTokens.cornerRadius.small))
    }
}

#Preview {
    ScenariosTabView()
        .withDSTheme()
}
