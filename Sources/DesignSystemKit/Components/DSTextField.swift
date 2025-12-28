//
//  DSTextField.swift
//  DesignSystemKit
//
//  Created by Lens Team on 28.12.2025.
//

import SwiftUI

/// Design System text field with consistent styling and validation support.
///
/// A customizable text input component with label, placeholder, error states,
/// and optional prefix/suffix icons.
///
/// ## Usage
/// ```swift
/// @State private var email = ""
/// @State private var hasError = false
///
/// DSTextField(
///     "Email",
///     text: $email,
///     placeholder: "Enter your email",
///     errorMessage: hasError ? "Invalid email" : nil
/// )
/// ```
public struct DSTextField: View {
    // MARK: - Variant Styles
    
    /// Text field style variants
    public enum Variant {
        /// Default style with subtle border
        case `default`
        
        /// Bordered style with prominent border
        case bordered
        
        /// Underlined style (bottom border only)
        case underlined
    }
    
    // MARK: - Properties
    
    private let label: String?
    @Binding private var text: String
    private let placeholder: String
    private let variant: Variant
    private let prefixIcon: Image?
    private let suffixIcon: Image?
    private let errorMessage: String?
    private let helpText: String?
    private let characterLimit: Int?
    private let isSecure: Bool
    private let keyboardType: UIKeyboardType
    private let textContentType: UITextContentType?
    
    @FocusState private var isFocused: Bool
    
    // MARK: - Initialization
    
    /// Creates a design system text field
    /// - Parameters:
    ///   - label: Optional label above the field
    ///   - text: Binding to the text value
    ///   - placeholder: Placeholder text
    ///   - variant: Visual style variant
    ///   - prefixIcon: Optional icon at the start
    ///   - suffixIcon: Optional icon at the end
    ///   - errorMessage: Error message to display (shows error state)
    ///   - helpText: Helper text below the field
    ///   - characterLimit: Optional character limit with counter
    ///   - isSecure: Whether to obscure text (password field)
    ///   - keyboardType: Keyboard type
    ///   - autocapitalization: Autocapitalization behavior
    public init(
        _ label: String? = nil,
        text: Binding<String>,
        placeholder: String = "",
        variant: Variant = .default,
        prefixIcon: Image? = nil,
        suffixIcon: Image? = nil,
        errorMessage: String? = nil,
        helpText: String? = nil,
        characterLimit: Int? = nil,
        isSecure: Bool = false,
        keyboardType: UIKeyboardType = .default,
        textContentType: UITextContentType? = nil
    ) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.variant = variant
        self.prefixIcon = prefixIcon
        self.suffixIcon = suffixIcon
        self.errorMessage = errorMessage
        self.helpText = helpText
        self.characterLimit = characterLimit
        self.isSecure = isSecure
        self.keyboardType = keyboardType
        self.textContentType = textContentType
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpacing.xsmall) {
            // Label
            if let label {
                Text(label)
                    .font(DSTypography.Label.medium)
                    .foregroundStyle(DSColor.Text.secondary)
            }
            
            // Text Field Container
            HStack(spacing: DSSpacing.xsmall) {
                if let prefixIcon {
                    prefixIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: DSTokens.iconSize.small, height: DSTokens.iconSize.small)
                        .foregroundStyle(DSColor.Text.tertiary)
                }
                
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .font(DSTypography.Body.medium)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                        .textContentType(textContentType)
                } else {
                    TextField(placeholder, text: $text)
                        .font(DSTypography.Body.medium)
                        .focused($isFocused)
                        .keyboardType(keyboardType)
                        .textContentType(textContentType)
                }
                
                if let suffixIcon {
                    suffixIcon
                        .resizable()
                        .scaledToFit()
                        .frame(width: DSTokens.iconSize.small, height: DSTokens.iconSize.small)
                        .foregroundStyle(DSColor.Text.tertiary)
                }
            }
            .padding(.horizontal, DSSpacing.medium)
            .padding(.vertical, DSSpacing.small)
            .background(DSColor.Background.secondary)
            .overlay(
                Group {
                    switch variant {
                    case .default, .bordered:
                        RoundedRectangle(cornerRadius: DSTokens.cornerRadius.medium)
                            .strokeBorder(borderColor, lineWidth: borderWidth)
                    case .underlined:
                        VStack {
                            Spacer()
                            Rectangle()
                                .fill(borderColor)
                                .frame(height: borderWidth)
                        }
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: variant == .underlined ? 0 : DSTokens.cornerRadius.medium))
            
            // Helper Text or Error Message
            if let errorMessage, !errorMessage.isEmpty {
                HStack(spacing: DSSpacing.xxsmall) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 12))
                    Text(errorMessage)
                        .font(DSTypography.Caption.medium)
                }
                .foregroundStyle(DSColor.Status.error)
            } else if let helpText {
                Text(helpText)
                    .font(DSTypography.Caption.medium)
                    .foregroundStyle(DSColor.Text.tertiary)
            }
            
            // Character Counter
            if let characterLimit {
                Text("\(text.count) / \(characterLimit)")
                    .font(DSTypography.Caption.small)
                    .foregroundStyle(
                        text.count > characterLimit ? DSColor.Status.error : DSColor.Text.tertiary
                    )
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .animation(.easeInOut(duration: DSTokens.duration.fast), value: isFocused)
        .animation(.easeInOut(duration: DSTokens.duration.fast), value: errorMessage)
    }
    
    // MARK: - Style Computed Properties
    
    private var hasError: Bool {
        errorMessage != nil && !errorMessage!.isEmpty
    }
    
    private var borderColor: Color {
        if hasError {
            return DSColor.Status.error
        } else if isFocused {
            return DSColor.Border.focused
        } else {
            return variant == .bordered ? DSColor.Border.standard : DSColor.Border.subtle
        }
    }
    
    private var borderWidth: CGFloat {
        if hasError || isFocused {
            return DSTokens.borderWidth.medium
        } else {
            return variant == .bordered ? DSTokens.borderWidth.thin : DSTokens.borderWidth.hairline
        }
    }
}

// MARK: - Previews

#Preview("TextField Variants") {
    @Previewable @State var text = ""
    @Previewable @State var errorText = "Error text"
    
    VStack(spacing: DSSpacing.large) {
        DSTextField("Email", text: $text, placeholder: "Enter email")
        
        DSTextField(
            "Password",
            text: $text,
            placeholder: "Enter password",
            isSecure: true
        )
        
        DSTextField(
            "Search",
            text: $text,
            placeholder: "Search...",
            prefixIcon: Image(systemName: "magnifyingglass")
        )
        
        DSTextField(
            "With Error",
            text: $errorText,
            errorMessage: "This field is required"
        )
        
        DSTextField(
            "With Help",
            text: $text,
            helpText: "Enter a valid email address",
            characterLimit: 50
        )
    }
    .padding()
    .previewBothThemes()
}
