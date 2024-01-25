package com.keyboardoldrn.keyboard;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.mocha.keyboard.framework.activation.ActivationExtensions;


public class TappaModule extends ReactContextBaseJavaModule {

    public TappaModule(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "TappaModule";
    }

    @ReactMethod
    public void launchActivationIfNeeded() {
        ActivationExtensions.launchActivationIfNeeded();
    }

    @ReactMethod
    public void isKeyboardInstalled(Promise promise) {
        try {
            boolean isInstalled = ActivationExtensions.getState().getCurrent();
            promise.resolve(isInstalled);
        } catch (Exception e) {
            promise.reject("Error checking installation status", e.getMessage());
        }
    }

    @ReactMethod
    public void isKeyboardAdded(Promise promise) {
        try {
            boolean isInstalled = ActivationExtensions.getState().getEnabled();
            promise.resolve(isInstalled);
        } catch (Exception e) {
            promise.reject("Error checking installation status", e.getMessage());
        }
    }
}