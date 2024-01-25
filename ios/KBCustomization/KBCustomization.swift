//
//  KBCustomization.swift
//
//
//  Created by Andrei Sava on 12.09.2022.
//

import UIKit
import Keemoji

/// KBCustomization implementation of the KMCustomizable protocol
/// Any client integrating the SDK, would have to provide a similar implementation of this protocol
/// it is the main custom module containing the other customization objects
public struct KBCustomization: KeemojiCustomizable {
    /// computed property for Configurator protocol implementation
    public var localizer: KeemojiLocalizer
        
        /// computed property for ImageProvider protocol implementation
        public var imageProvider: KeemojiImageProvider
        
        /// computed property for ColorPalette protocol implementation
        public var colorPalette: KeemojiColorPalette
            
        /// Initializes the KBCustomization() module, to be passed by injection
        /// the properties are initialized with the module's implementations for
        /// the respective protocols
        public init() {
            localizer = KMLocalizer()
            imageProvider = KMImageProvider()
            colorPalette = KMColorPalette()
        }

    }

    public struct KMImageProvider: KeemojiImageProvider {
        /// Retrieves an image asset for a given `name`, if an image exists
        /// To be used for app and keyboard assets
        /// ```
        /// image(named: "flag")
        /// ```
        ///
        /// - Parameter name: the name of the image asset
        ///
        /// - Returns: image asset for a given `name`, if an image exists;
        /// nil if no image exists with that name.
        public func image(named name: String) -> UIImage? {
            UIImage(named: name,
                    in: .main,
                    compatibleWith: nil)
        }

        /// Retrieves an icon asset for a given `name`, if an icon exists
        /// To be used in the context of the toolbar (for iconresources)
        /// ```
        /// icon(named: "flag")
        /// ```
        ///
        /// - Parameter name: the name of the icon asset
        ///
        /// - Returns: icon asset for a given `name`, if an icon exists;
        /// nil if no icon exists with that name.
        public func icon(named name: String) -> UIImage? {
            UIImage(named: name,
                    in: .main,
                    compatibleWith: nil)
        }
    }

    public struct KMColorPalette: KeemojiColorPalette {
      /// computed property for status bar background
      /// in case client has forced per-app appearance
      ///
      /// - Returns: The keyboard text color
      public var activation_status_bg: UIColor { .black }

        public init() {}

    }

    public struct KMLocalizer: KeemojiLocalizer {
        /// Produces the translation for the given `text` into the desired language.
        ///
        /// ```
        /// translation("Download") // "Descargar"
        /// ```
        ///
        ///
        /// - Parameter text: The text to be translated.
        ///
        /// - Returns: translation for the given `text` into the desired language.
        public func translation(_ text: String) -> String {
            NSLocalizedString(text, comment: "")
        }

        public init() {}

    }
