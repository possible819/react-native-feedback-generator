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

const {
  ImpactFeedbackStyleLight,
  ImpactFeedbackStyleMedium,
  ImpactFeedbackStyleHeavy,
  ImpactFeedbackStyleSoft,
  ImpactFeedbackStyleRigid,
  NotificationFeedbackStyleSuccess,
  NotificationFeedbackStyleWarning,
  NotificationFeedbackStyleError,
} = FeedbackGenerator.getConstants();

export enum ImpactFeedbackStyle {
  Light = ImpactFeedbackStyleLight,
  Medium = ImpactFeedbackStyleMedium,
  Heavy = ImpactFeedbackStyleHeavy,
  Soft = ImpactFeedbackStyleSoft,
  Rigid = ImpactFeedbackStyleRigid,
}

export enum NotificationFeedbackStyle {
  Success = NotificationFeedbackStyleSuccess,
  Warning = NotificationFeedbackStyleWarning,
  Error = NotificationFeedbackStyleError,
}

export function impactFeedback(impactFeedbackStyle: ImpactFeedbackStyle) {
  FeedbackGenerator.impactFeedback(impactFeedbackStyle);
}

export function selectionFeedback() {
  FeedbackGenerator.selectionFeedback();
}

export function notificationFeedback(
  notificationFeedbackStyle: NotificationFeedbackStyle
) {
  FeedbackGenerator.notificationFeedback(notificationFeedbackStyle);
}
