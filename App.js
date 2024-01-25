/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useEffect, useRef, useState} from 'react';
import {
  ActivityIndicator,
  SafeAreaView,
  StyleSheet,
  ViewStyle,
} from 'react-native';
import {AppState, NativeModules} from 'react-native';
import NotInstalledScreen from './component/NotInstalledScreen';
import InstalledScreen from './component/InstalledScreen';

const {TappaModule} = NativeModules;

const App = () => {
  const [isKeyboardInstalled, setIsKeyboardInstalled] = useState(false);
  const [isKeyboardAdded, setIsKeyboardAdded] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  const isKeyboardInstalledRef = useRef(isKeyboardInstalled);
  const isKeyboardAddedRef = useRef(isKeyboardAdded);

  useEffect(() => {
    isKeyboardInstalledRef.current = isKeyboardInstalled;
    isKeyboardAddedRef.current = isKeyboardAdded;
  }, [isKeyboardInstalled, isKeyboardAdded]);

  useEffect(() => {
    const subscription = AppState.addEventListener(
      'change',
      async nextAppState => {
        if (nextAppState === 'active') {
          const {installed, added} = await checkInstallationStatus();

          isKeyboardInstalledRef.current = installed;
          isKeyboardAddedRef.current = added;

          if (isKeyboardAddedRef.current && !isKeyboardInstalledRef.current) {
            TappaModule.launchActivationIfNeeded();
          }
        }
      },
    );

    return () => {
      subscription.remove();
    };
  }, []);

  const checkInstallationStatus = async () => {
    setIsLoading(true);
    try {
      const [installed, added] = await Promise.all([
        TappaModule.isKeyboardInstalled(),
        TappaModule.isKeyboardAdded(),
      ]);
      setIsKeyboardInstalled(installed);
      setIsKeyboardAdded(added);
      setIsLoading(false);
      return {installed, added};
    } catch (error) {
      setIsLoading(false);
      return {installed: false, added: false};
    }
  };

  useEffect(() => {
    checkInstallationStatus();
  }, []);

  const startInstall = () => {
    TappaModule.launchActivationIfNeeded();
  };

  if (isLoading) {
    return (
      <SafeAreaView style={styles.container}>
        <ActivityIndicator size="large" />
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={styles.container}>
      {isKeyboardInstalled ? (
        <InstalledScreen />
      ) : (
        <NotInstalledScreen startInstall={startInstall} />
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
