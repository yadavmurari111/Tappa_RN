import React, {Component, RefObject} from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import Tappa from '../assets/Tappa.svg';

type Props = {};

class InstalledScreen extends Component<Props> {
  private focusNode: RefObject<TextInput>;

  constructor(props: Props) {
    super(props);
    this.focusNode = React.createRef<TextInput>();
  }

  render() {
    return (
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.flexContainer}>
        <View style={styles.column}>
          <View style={styles.statusContainer}>
            <Text style={styles.statusText}>Status:</Text>
            <View style={styles.statusIndicator} />
            <Text style={styles.statusInstalled}>Installed</Text>
          </View>
          <View style={styles.logoContainer}>
            <Tappa width={76} height={90} />
          </View>
          <Text style={styles.logoText}>Tappa SDK</Text>
          <Text style={styles.description}>
            Tap on the form below to test the keyboard
          </Text>
          <TextInput
            ref={this.focusNode}
            style={styles.textInput}
            placeholder="Try it out..."
          />
        </View>
      </KeyboardAvoidingView>
    );
  }
}

const styles = StyleSheet.create({
  flexContainer: {
    flex: 1,
  },
  column: {
    alignItems: 'center',
  },
  statusContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'rgb(228, 228, 228)',
    borderRadius: 16,
    paddingHorizontal: 16,
    paddingVertical: 8,
    marginTop: 32,
  },
  statusText: {
    fontSize: 14,
    fontWeight: '700',
    color: 'black',
  },
  statusIndicator: {
    width: 13,
    height: 13,
    borderRadius: 6.5,
    backgroundColor: 'rgb(84, 192, 161)',
    marginLeft: 13,
    marginRight: 4,
  },
  statusInstalled: {
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
  logoText: {
    fontSize: 32,
    fontWeight: '700',
    marginTop: 24,
    color: 'black',
  },
  description: {
    fontSize: 16,
    textAlign: 'center',
    marginTop: 9,
    color: 'black',
  },
  textInput: {
    marginTop: 40,
    borderWidth: 1,
    borderColor: 'rgb(212, 212, 212)',
    borderRadius: 4,
    paddingHorizontal: 8,
    paddingVertical: 6,
    marginHorizontal: 16,
    width: '90%',
    color: 'black',
  },
});

export default InstalledScreen;
