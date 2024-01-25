//
//  KeyboardViewController.swift
//  KBKeyboard
//
//  Created by Bogdan Burdalescu on 28.03.2023.
//

import UIKit
import Keemoji

class KeyboardViewController: UIInputViewController {
    let keyboardExtensionSDK = KeyboardExtensionSDK()
    
    override func viewDidLoad() {
      super.viewDidLoad()

      /// Any client integrating the SDK, would have to initialize the customization module
      /// prior to first use
      KeyboardExtensionSDK.setup(customizable: KBCustomization() as! KeemojiCustomizable)
      keyboardExtensionSDK.inputViewController = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewWillLayoutSubviews()
    }
    
    override func viewWillTransition(
      to size: CGSize,
      with coordinator: UIViewControllerTransitionCoordinator
    ) {
      super.viewWillTransition(to: size, with: coordinator)
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerViewWillTransition(to: size, with: coordinator)
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
      /// Any client integrating the SDK, would have to
      /// call the extension implementation from the SDK
      keyboardExtensionSDK.controllerTextDidChange(textInput)
    }

  }
