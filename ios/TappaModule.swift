//
//  TappaModule.swift
//  TappaDemo
//
//  Created by Bogdan Burdalescu on 04.01.2024.
//

import Foundation
import Combine
import Keemoji

@objc(TappaModule)
class TappaModule: NSObject {
  private var cancellables: Set<AnyCancellable> = []
  private var rootController: UIViewController?
  
  @objc static let shared = TappaModule()
    
  private override init() { }

  // MARK: - interface
  @objc
  func initializeNativeSDK() -> Void {
    observeOnboardingStatus()
    KeyboardSDK.setup(customizable: KBCustomization())
    
    startup()
  }
  
  @objc
  func launchActivationIfNeeded(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock) -> Void
  {
    Task {
      await MainActor.run {
        TappaModule.shared.startOnboarding()
      }
    }
    resolve("startOnboarding")
  }
  
  @objc
  func isKeyboardAdded(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock)
  {
    resolve(KeyboardSDK.isKeyboardAdded())
  }
  
  @objc
  func isKeyboardInstalled(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock)
  {
    
    resolve(KeyboardSDK.isKeyboardInstalled())
  }
  
  @objc
  func isOnboardingDismissed(
    _ resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: RCTPromiseRejectBlock)
  {
    resolve(KeyboardSDK.isOnboardingDismissed())
  }

  @objc func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool
  {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      _ = KeyboardSDK.application(open: url, options: options)
    }
    return true
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // MARK: - private
  private func startup()
  {
    Task {
      await MainActor.run {
        KeyboardSDK.initialize()
      }
    }
  }
  
  private func startOnboarding() {
    if rootController == nil {
      rootController = UIApplication.shared.windows[0].rootViewController
    }
    KeyboardSDK.startOnboarding()
  }
  
  private func observeOnboardingStatus() {
    KeyboardSDK.onboardingStatus.$isOnboardingFinished
      .receive(on: DispatchQueue.main)
      .sink { [weak self] finished in
        guard finished else { return }
        guard let self = self else { return }
      
        self.closeOnboardingScreen()
      }
      .store(in: &cancellables)
    
    KeyboardSDK.onboardingStatus.$isOnboardingDismissed
      .receive(on: DispatchQueue.main)
      .sink { [weak self] dismissed in
        guard dismissed else { return }
        guard let self = self else { return }
      
        self.closeOnboardingScreen()
      }
      .store(in: &cancellables)
    
  }
  
  private func closeOnboardingScreen() {
    guard let rootVC = self.rootController  else { return }
    let appWindow = UIApplication.shared.windows[0]
    guard appWindow.rootViewController != rootVC else {return}
    appWindow.rootViewController = rootVC
    
    UIView.transition(
      with: appWindow,
      duration: 0.35,
      options: .transitionCrossDissolve,
      animations: nil,
      completion: nil)
  }
  
}
