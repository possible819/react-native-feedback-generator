#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(FeedbackGenerator, NSObject)

RCT_EXTERN_METHOD(impactFeedback: (nonnull NSNumber *) type);
RCT_EXTERN_METHOD(selectionFeedback);
RCT_EXTERN_METHOD(notificationFeedback: (nonnull NSNumber *) type);

@end
