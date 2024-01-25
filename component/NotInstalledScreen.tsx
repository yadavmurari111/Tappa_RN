import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
} from 'react-native';
import Tappa from '../assets/Tappa.svg';

type NotInstalledScreenProps = {
  startInstall: () => void;
};

const NotInstalledScreen: React.FC<NotInstalledScreenProps> = ({
  startInstall,
}) => {
  const {height} = Dimensions.get('window');
  const verticalGap = height / 2 - 251.0;

  const launchActivationIfNeeded = (): void => {
    startInstall();
  };

  return (
    <View style={styles.column}>
      <View style={styles.smallSpacer} />
      <View style={styles.statusContainer}>
        <View style={styles.mediumWidthSpacer} />
        <Text style={styles.statusTitle}>Status:</Text>
        <View style={styles.smallWidthSpacer} />
        <View style={styles.notInstalledIndicator} />
        <View style={styles.extraSmallWidthSpacer} />
        <Text style={styles.notInstalledText}>Not installed</Text>
      </View>
      <View style={{height: verticalGap}} />
      <View style={styles.logoContainer}>
        <Tappa width={76} height={90} />
      </View>
      <View style={styles.mediumSpacer} />
      <Text style={styles.tappaSDK}>Tappa SDK</Text>
      <View style={styles.extraSmallSpacer} />
      <Text style={styles.installText}>Install and preview the keyboard</Text>
      <View style={styles.largeSpacer} />
      <TouchableOpacity
        style={styles.installButton}
        onPress={launchActivationIfNeeded}>
        <Text style={styles.installButtonText}>Start installation</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  smallSpacer: {
    height: 32,
  },
  mediumSpacer: {
    height: 24,
  },
  largeSpacer: {
    height: 40,
  },
  extraSmallSpacer: {
    height: 8,
  },
  extraSmallWidthSpacer: {
    width: 4,
  },
  smallWidthSpacer: {
    width: 13,
  },
  mediumWidthSpacer: {
    width: 16,
  },
  column: {
    alignItems: 'center',
  },
  statusContainer: {
    width: 186,
    height: 32,
    backgroundColor: 'rgba(228, 228, 228, 1)',
    borderRadius: 16,
    flexDirection: 'row',
    alignItems: 'center',
  },
  statusTitle: {
    fontSize: 14,
    fontWeight: '700',
    color: 'black',
  },
  notInstalledIndicator: {
    width: 13,
    height: 13,
    backgroundColor: 'rgba(239, 67, 89, 1)',
    borderRadius: 6.5,
  },
  notInstalledText: {
    fontSize: 14,
    color: 'black',
  },
  logoContainer: {
    justifyContent: 'center',
    alignItems: 'center',
    width: 152,
    height: 152,
    backgroundColor: 'rgb(61, 149, 248)',
    borderRadius: 76,
    marginTop: 66,
  },
  circle: {
    width: 254,
    height: 254,
    backgroundColor: 'rgba(61, 149, 248, 1)',
    borderRadius: 127,
    justifyContent: 'center',
    alignItems: 'center',
  },
  tappaSDK: {
    fontSize: 32,
    fontWeight: '700',
    color: 'black',
  },
  installText: {
    fontSize: 16,
    color: 'black',
  },
  installButton: {
    width: 264,
    height: 42,
    backgroundColor: 'rgba(52, 55, 71, 1)',
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
  },
  installButtonText: {
    fontSize: 14,
    fontWeight: '700',
    color: 'rgba(231, 222, 95, 1)',
  },
});

export default NotInstalledScreen;
