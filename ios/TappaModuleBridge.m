//
//  TappaModuleBridge.m
//  TappaDemo
//
//  Created by Bogdan Burdalescu on 04.01.2024.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TappaModule, NSObject)

RCT_EXTERN_METHOD(
                  launchActivationIfNeeded: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(isKeyboardInstalled: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(isKeyboardAdded: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

RCT_EXTERN_METHOD(isOnboardingDismissed: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

@end
