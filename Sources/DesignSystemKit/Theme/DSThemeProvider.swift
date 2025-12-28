//
//  DSThemeProvider.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

// MARK: - Environment Key

/// Environment key for accessing the current theme
private struct DSThemeKey: EnvironmentKey {
    nonisolated(unsafe) static let defaultValue: any DSTheme = DSLightTheme()
}

extension EnvironmentValues {
    /// Access the current design system theme from the environment
    public var dsTheme: any DSTheme {
        get { self[DSThemeKey.self] }
        set { self[DSThemeKey.self] = newValue }
    }
}

// MARK: - Theme Provider View Modifier

/// View modifier that provides theme to the view hierarchy
private struct DSThemeProviderModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        content
            .environment(\.dsTheme, colorScheme == .dark ? DSDarkTheme() as any DSTheme : DSLightTheme() as any DSTheme)
            .task {
                await updateThemeManager()
            }
            .onChange(of: colorScheme) { _, newScheme in
                Task {
                    await updateThemeManager(newScheme)
                }
            }
    }
    
    @MainActor
    private func updateThemeManager(_ scheme: ColorScheme? = nil) {
        let targetScheme = scheme ?? colorScheme
        DSThemeManager.shared.updateTheme(for: targetScheme)
    }
}

// MARK: - View Extensions

extension View {
    /// Apply the design system theme provider to this view
    ///
    /// This should be applied at the root of your view hierarchy to enable
    /// automatic theme switching based on system appearance.
    ///
    /// ## Usage
    /// ```swift
    /// struct MyApp: App {
    ///     var body: some Scene {
    ///         WindowGroup {
    ///             ContentView()
    ///                 .withDSTheme()
    ///         }
    ///     }
    /// }
    /// ```
    public func withDSTheme() -> some View {
        self.modifier(DSThemeProviderModifier())
    }
    
    /// Access the current theme from the environment
    /// - Parameter action: Closure that receives the current theme
    /// - Returns: Modified view with theme access
    public func onTheme(_ action: @escaping (any DSTheme) -> Void) -> some View {
        self.background(
            ThemeReader(action: action)
        )
    }
}

// MARK: - Theme Reader Helper

/// Helper view to read theme from environment
private struct ThemeReader: View {
    @Environment(\.dsTheme) private var theme
    let action: (any DSTheme) -> Void
    
    var body: some View {
        Color.clear
            .onAppear {
                action(theme)
            }
            .onChange(of: theme.name) { _, _ in
                action(theme)
            }
    }
}

// MARK: - Preview Helpers

extension View {
    /// Preview this view in both light and dark themes
    ///
    /// Creates a horizontal stack showing the view in both appearances
    /// for easy comparison during development.
    ///
    /// ## Usage
    /// ```swift
    /// #Preview {
    ///     MyView()
    ///         .previewBothThemes()
    /// }
    /// ```
    public func previewBothThemes() -> some View {
        HStack(spacing: 0) {
            self
                .environment(\.dsTheme, DSLightTheme() as any DSTheme)
                .preferredColorScheme(.light)
                .previewDisplayName("Light")
            
            self
                .environment(\.dsTheme, DSDarkTheme() as any DSTheme)
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark")
        }
    }
    
    /// Preview this view in light theme only
    public func previewLightTheme() -> some View {
        self
            .environment(\.dsTheme, DSLightTheme() as any DSTheme)
            .preferredColorScheme(.light)
    }
    
    /// Preview this view in dark theme only
    public func previewDarkTheme() -> some View {
        self
            .environment(\.dsTheme, DSDarkTheme() as any DSTheme)
            .preferredColorScheme(.dark)
    }
}
