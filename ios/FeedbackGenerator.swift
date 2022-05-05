import UIKit

@objc(CalendarManager)
class CalendarManager: NSObject {
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    @objc(impactFeedback:)
    func impactFeedback(_ type: NSNumber) -> Void {
        var style: UIImpactFeedbackGenerator.FeedbackStyle;
        
        switch (type.intValue) {
        case UIImpactFeedbackGenerator.FeedbackStyle.medium.rawValue:
            style  = UIImpactFeedbackGenerator.FeedbackStyle.medium;
            
        case UIImpactFeedbackGenerator.FeedbackStyle.heavy.rawValue:
            style = UIImpactFeedbackGenerator.FeedbackStyle.heavy;
            
        case UIImpactFeedbackGenerator.FeedbackStyle.light.rawValue:
            style = UIImpactFeedbackGenerator.FeedbackStyle.light;
            
        default:
            if #available(iOS 13.0.0, *) {
                if (type.intValue == UIImpactFeedbackGenerator.FeedbackStyle.rigid.rawValue) {
                    style = UIImpactFeedbackGenerator.FeedbackStyle.rigid
                } else if (type.intValue == UIImpactFeedbackGenerator.FeedbackStyle.rigid.rawValue) {
                    style = UIImpactFeedbackGenerator.FeedbackStyle.rigid
                } else {
                    style = UIImpactFeedbackGenerator.FeedbackStyle.medium;
                }
            } else {
                style = UIImpactFeedbackGenerator.FeedbackStyle.medium;
            }
        }
        
        UIImpactFeedbackGenerator(style: style).impactOccurred();
    }
    
    @objc(selectionFeedback)
    func selectionFeedback() -> Void {
        UISelectionFeedbackGenerator.init().selectionChanged();
    }
    
    @objc(notificationFeedback:)
    func notificationFeedback(_ type: NSNumber) -> Void {
        var notificationType: UINotificationFeedbackGenerator.FeedbackType
        
        switch (type.intValue) {
        case UINotificationFeedbackGenerator.FeedbackType.success.rawValue:
            notificationType = UINotificationFeedbackGenerator.FeedbackType.success;
            
        case UINotificationFeedbackGenerator.FeedbackType.warning.rawValue:
            notificationType = UINotificationFeedbackGenerator.FeedbackType.warning;
            
        case UINotificationFeedbackGenerator.FeedbackType.error.rawValue:
            notificationType = UINotificationFeedbackGenerator.FeedbackType.error;
            
        default:
            notificationType = UINotificationFeedbackGenerator.FeedbackType.success;
        }
        
        UINotificationFeedbackGenerator.init().notificationOccurred(notificationType)
    }
    
    
    @objc
    func constantsToExport() -> [String: Int]! {
        return [
            "ImpactFeedbackStyleLight": 0,
            "ImpactFeedbackStyleMedium": 1,
            "ImpactFeedbackStyleHeavy": 2,
            "ImpactFeedbackStyleSoft": 3,
            "ImpactFeedbackStyleRigid": 4,
            "NotificationFeedbackStyleSuccess": 0,
            "NotificationFeedbackStyleWarning": 1,
            "NotificationFeedbackStyleError": 2
        ]
    }
}
