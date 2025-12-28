//
//  DSTheme.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Protocol defining the theme contract for the design system.
///
/// Themes implement this protocol to provide consistent color schemes,
/// typography, and other design tokens across light and dark appearances.
public protocol DSTheme {
    /// The theme's color scheme (light or dark)
    var colorScheme: ColorScheme { get }
    
    /// Theme name for debugging and identification
    var name: String { get }
}

/// Light theme implementation
public struct DSLightTheme: DSTheme {
    public let colorScheme: ColorScheme = .light
    public let name: String = "Light"
    
    public init() {}
}

/// Dark theme implementation
public struct DSDarkTheme: DSTheme {
    public let colorScheme: ColorScheme = .dark
    public let name: String = "Dark"
    
    public init() {}
}

/// Theme manager for automatic theme switching based on system appearance
@MainActor
@Observable
public final class DSThemeManager {
    /// Current active theme
    public private(set) var currentTheme: DSTheme
    
    /// Current color scheme (synced with system)
    public private(set) var colorScheme: ColorScheme
    
    /// Singleton instance
    public static let shared = DSThemeManager()
    
    private init() {
        // Initialize with light theme by default
        // The actual theme will be set by the environment
        self.colorScheme = .light
        self.currentTheme = DSLightTheme()
    }
    
    /// Update theme based on color scheme
    /// - Parameter colorScheme: The color scheme from the environment
    public func updateTheme(for colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
        self.currentTheme = colorScheme == .dark ? DSDarkTheme() : DSLightTheme()
    }
    
    /// Check if current theme is dark
    public var isDark: Bool {
        colorScheme == .dark
    }
    
    /// Check if current theme is light
    public var isLight: Bool {
        colorScheme == .light
    }
}
