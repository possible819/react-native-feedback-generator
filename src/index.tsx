import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-feedback-generator' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const FeedbackGenerator = NativeModules.FeedbackGenerator
  ? NativeModules.FeedbackGenerator
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function multiply(a: number, b: number): Promise<number> {
  return FeedbackGenerator.multiply(a, b);
}
